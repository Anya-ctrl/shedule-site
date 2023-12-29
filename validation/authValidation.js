import { check } from "express-validator";

let validateRegister = [
    check('email', 'Invlid email').isEmail().trim(),
    check('password', 'Invalid password. Password must be at least 6 chars long').isLength({min: 6}),
    check('confirmPassword', "Password confirm does not match password").custom((value, {req}) => {
        return value === req.body.password
    })
];

export default {
    validateRegister
}