import { body } from "express-validator";


let validateRegister = [
    function(req, res, next) {  
        res.locals.errors = [];
        next();
    },
    body('email', 'Invlid email').isEmail().trim(),
    body('password', 'Invalid password. Password must be at least 6 chars long').isLength({min: 6}),
    body('passwordConfirm', "Password confirm does not match password").custom((value, {req}) => {
        return value === req.body.password
    })
];

let validateLogin = [
    function(req, res, next) {  
        res.locals.errors = [];
        next();
    },
    body('email', 'Invlid email').isEmail().trim(),
    body('password', 'Invalid password. Password must be at least 6 chars long').isLength({min: 6})
];

let validadateAddStudent = [
    function(req, res, next) {  
        res.locals.errors = [];
        next();
    },
    body('email', 'Invlid email').isEmail().trim()
];

let validadateAddProfessor = [
    function(req, res, next) {  
        res.locals.errors = [];
        next();
    },
    body('phone').notEmpty().withMessage('Введите номер телефона').matches(/^(?:\+380|380|0)\d{9}$/).withMessage('Введите корректный номер телефона'),
];

export default {
    validateRegister,
    validateLogin,
    validadateAddStudent,
    validadateAddProfessor
}