import models from '../models/index.js';
import userService from '../services/userService.js';
import { validationResult } from 'express-validator';

async function getIndexPage(req, res) {
    console.log('Processing request for index page');

    try {
        const [faculty, speciality, course, group] = await Promise.all([
            models.Faculty.findAll(),
            models.Speciality.findAll(),
            models.Course.findAll(),
            models.Group.findAll()
        ]);

        res.render('index', {
            faculty,
            speciality,
            course,
            group
        });
    } catch (error) {
        console.error('Error fetching data:', error);
        res.status(500).send('Error fetching data');
    }

    console.log('Index page request processed and rendered');
}

function getEntryPage(req, res) {
    console.log('Processing request for entry page');

    let form = {
        email: req.body.email
    };

    res.render('entry', { 
        errors: req.flash("errors"),
        form: form
    });

    console.log('Entry page request processed and rendered');
}

function getFeedbackPage(req, res) {
    console.log('Processing request for feedback page');

    res.render('feedback', { 
        errors: req.flash("errors")
    });

    console.log('Feedback page request processed and rendered');
}

function getProfessorsPage(req, res) {
    console.log('Processing request for professors page');

    res.render('professors', { 
        
    });

    console.log('Professors page request processed and rendered');
}

async function getRegistrationPage(req, res) {
    console.log('Processing request for registration page');

    let form = {
        name: req.body.name,
        surname: req.body.surname,
        email: req.body.email
    };

    res.render('registration', { 
        errors: req.flash("errors"),
        form: form
    });

    console.log('Registration page request processed and rendered');
}

function getSchedulePage(req, res) {
    console.log('Processing request for schedule page');

    const selectedGroup = req.session.selectedGroup || 'No group selected';

    res.render('schedule', {
        selectedGroup
    });

    console.log('Schedule page request processed and rendered');
}

async function createNewUser(req, res) {
    let user = req.body;
    await userService.createNewUser(user);
    res.redirect('/');
}

async function handleRegister(req, res) {
    let form = {
        name: req.body.name,
        surname: req.body.surname,
        email: req.body.email
    };

    let errorsArr = [];
    let validationError = validationResult(req);
    if(!validationError.isEmpty()) {
        let errors = Object.values(validationError.mapped());
        errors.forEach((item) => {
            errorsArr.push(item.msg);
        });
        req.flash("errors", errorsArr);
        res.render('registration', { 
            errors: req.flash("errors"),
            form: form
        });
    }

    try {
        let user = {
            name: req.body.name,
            surname: req.body.surname,
            email: req.body.email,
            password: req.body.password,
            confirmPassword: req.body.confirmPassword,
            createdAt: Date.now()
        };

        await userService.createNewUser(user);
        res.redirect("/");
    } catch (error) {
        req.flash("errors", error);
        res.render('registration', { 
            errors: req.flash("errors"),
            form: form
        });
    }
}


function handleLogin(req, res) {
    console.log('Processing request for handle Login');

    let user = {
        email: req.body.email,
        password: req.body.password
    }

    console.log(user)

    console.log('Handle Login request processed');
}

export default {
    getIndexPage,
    getEntryPage,
    getFeedbackPage,
    getProfessorsPage,
    getRegistrationPage,
    getSchedulePage,
    handleRegister
}