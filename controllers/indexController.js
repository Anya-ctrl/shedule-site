import models from '../models/index.js';
import userService from '../services/userService.js';
import { validationResult } from 'express-validator';
import Jwt from 'jsonwebtoken';
import configEnv from "../config/db.config.js"
import bcrypt from 'bcryptjs';

async function getIndexPage(req, res) {
    console.log('Processing request for index page');

    try {
        const [faculty, speciality, course, group] = await Promise.all([
            models.Faculty.findAll(),
            models.Speciality.findAll(),
            models.Course.findAll(),
            models.Group.findAll()
        ]);

        let user = {};
        user.groupId = false;
        if (res.locals.auth) {
            const token = req.cookies.token;
            const { email, groupId } = Jwt.decode(token);
            user.groupId = groupId;
            user.email = email;
            const USER = await models.User.findOne({
                where: {
                    email
                }
            })
            const { role } = USER.dataValues;
            user.role = role;
        }
        
        if (!Object.keys(user).length) {
            user = false;
        }
        
        res.render('index', {
            faculty,
            speciality,
            course,
            group,
            auth: res.locals.auth,
            user
         });           
    } catch (error) {
        console.error('Error fetching data:', error);
        res.status(500).send('Error fetching data');
    }

    console.log('Index page request processed and rendered');
}

async function compareUserwithStudent(req, res, next) {
    res.locals.user = {};

    const userEmail = req.body.email;
    const student = await models.Student.findOne({
        where: {
            email: userEmail
        }
    });

    if (!student) {
        res.locals.user.isStudent = false;
        res.locals.user.groupId = false;
        next();
        return;
    }

    const { group_id: groupId } =  student.dataValues;

    res.locals.user.isStudent = true;
    res.locals.user.groupId = groupId;

    next();
}

function getUserFromToken(token) {
    let user = {};
    user.groupId = false;
    if (token) {
        const { groupId, email, role } = Jwt.decode(token);
        user.groupId = groupId;
        user.email = email;
        user.role = role;
    }
    return user;
}

async function getEntryPage(req, res) {
    console.log('Processing request for entry page');

    let user = getUserFromToken(req.cookies.token);
    
    if (!Object.keys(user).length) {
        user = false;
    }

    let form = {
        email: req.body.email
    };

    res.render('entry', { 
        errors: [],
        form: form,
        user
    });

    console.log('Entry page request processed and rendered');
}

async function getProfessorsPage(req, res, next) {
    console.log('Processing request for professors page');

    const professors = await models.Professor.findAll();
    console.log(professors[0]);

    let user = getUserFromToken(req.cookies.token);

    console.log(user);

    res.render('professors', {
        professors,
        user
    });

    console.log('Professors page request processed and rendered');
    next();
}

async function getRegistrationPage(req, res) {
    console.log('Processing request for registration page');

    let form = {
        name: req.body.name,
        surname: req.body.surname,
        email: req.body.email
    };

    let user = getUserFromToken(req.cookies.token);

    res.render('registration', { 
        errors: [],
        form: form,
        auth: res.locals.auth,
        user
    });

    console.log('Registration page request processed and rendered');
}

function getSchedulePage(req, res, next) {
    console.log('Processing request for schedule page');

    if (!res.locals.auth) { return res.redirect('/entry'); }

    res.locals.user = {};
    const token = req.cookies.token;
    const { groupId, email, role } = Jwt.decode(token);
    res.locals.user.groupId = groupId;
    res.locals.user.email = email;
    res.locals.user.role = role;   

    console.log('Schedule page request processed and rendered');
    next();
}

async function handleRegister(req, res) {
    let form = {
        name: req.body.name,
        surname: req.body.surname,
        email: req.body.email
    };

    let validationError = validationResult(req);
    if(!validationError.isEmpty()) {
        validationError.array().forEach((error) => {
            res.locals.errors.push(error.msg);
        });

        res.render('registration', { 
            errors: res.locals.errors,
            form: form
        });
    };

    try {
        let user = {
            name: req.body.name,
            surname: req.body.surname,
            email: req.body.email,
            password: req.body.password
        };

        let userRole = 'guest';

        const { isStudent, groupId } = res.locals.user;

        if (isStudent) {
            userRole = 'student';
        };

        try {
            const USER = await userService.createNewUser({...user, role: userRole});

            const {id, email, role} = USER.dataValues;

            const token = generateJWT({
                id, 
                email, 
                role,
                groupId
            });

            res.cookie('token', token, { 
                httpOnly: true,
                maxAge: (24 * 60 * 60 *1000)
            });

            res.redirect("/");
        } catch (error) {
            res.locals.errors.push(error.message);
        
            console.log(res.locals.errors);
        
            res.render('registration', { 
                errors: res.locals.errors,
                form: form
            });
        }
        
    } catch (error) {
        res.render('registration', { 
            errors: res.locals.errors,
            form: form
        });
    };
};

async function handleLogin(req, res) {

    try {
        let form = {
            email: req.body.email
        };

        let user = {
            email: req.body.email,
            password: req.body.password
        };

        let validationError = validationResult(req);
        if(!validationError.isEmpty()) {
                validationError.array().forEach((error) => {
                res.locals.errors.push(error.msg);
            });

            console.log(res.locals.errors);


            return res.render('entry', { 
                errors: res.locals.errors,
                form: form
            });
        };

        const USER = await models.User.findOne({
            where: {
                email: user.email
            }
        });

        if (!USER) {
            res.locals.errors.push('User not found!');

            return res.render('entry', { 
                errors: res.locals.errors,
                form: form
            });
        }

        const checkPassword = await bcrypt.compare(user.password, USER.password);

        if (!checkPassword) {
            res.locals.errors.push('Invalid password.');

            return res.render('entry', {
                errors: res.locals.errors,
                form: form
            });
        }

        const {id, email, role} = USER.dataValues;
        const { groupId } = res.locals.user;
        
        const token = generateJWT({
            id, 
            email, 
            role,
            groupId
        });

        res.cookie('token', token, { 
            httpOnly: true,
            maxAge: (24 * 60 * 60 *1000)
        });

        res.redirect("/");
    } catch (error) {
        // errors: res.locals.errors,
        // form: form
    }
}

function handleLogout(req, res, next) {
    if (req.cookies.token) return res.clearCookie('token').redirect('/');
    next();
}

function generateJWT(payload){
    return Jwt.sign(payload, configEnv.SECRET, {
        expiresIn: '1d',
    })
};

function checkAuth(req, res, next){
    const token = req.cookies.token;

    if (!token) {
        res.locals.auth = false;
        next();
        return;
    } 

    const isValidToken = Jwt.verify(token, configEnv.SECRET);

    if (!isValidToken) {
        res.locals.auth = false;
        next();
        return;
    }

    res.locals.auth = true;
    next();
};

export default {
    getIndexPage,
    getEntryPage,
    getProfessorsPage,
    getRegistrationPage,
    getSchedulePage,
    handleRegister,
    handleLogin,
    handleLogout,
    checkAuth,
    compareUserwithStudent
};