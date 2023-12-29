import { Router } from 'express';
const router = Router();

import indexController from '../controllers/indexController.js';
import auth from "../validation/authValidation.js";
import initPassportLocal from "../controllers/passport/passportLocal.js";
import passport from 'passport';

initPassportLocal();

// Логирование для каждого маршрута
router.get('/', (req, res, next) => {
    console.log('Получен запрос на главную страницу');
    indexController.getIndexPage(req, res, next);
});

router.get('/entry', (req, res, next) => {
    console.log('Получен запрос на страницу входа');
    indexController.getEntryPage(req, res, next);
});

router.get('/feedback', (req, res, next) => {
    console.log('Получен запрос на страницу обратной связи');
    indexController.getFeedbackPage(req, res, next);
});

router.get('/professors', (req, res, next) => {
    console.log('Получен запрос на страницу с преподавателями');
    indexController.getProfessorsPage(req, res, next);
});

router.get('/registration', (req, res, next) => {
    console.log('Получен запрос на страницу регистрации');
    indexController.getRegistrationPage(req, res, next);
});

router.get('/shedule', (req, res, next) => {
    console.log('Получен запрос на страницу расписания');
    indexController.getSchedulePage(req, res, next);
});

router.post('/register', auth.validateRegister, (req, res, next) => {
    console.log('Получен запрос на регистрацию');
    indexController.handleRegister(req, res, next);
});

router.post('/login', passport.authenticate("local", {
        successRedirect: "/",
        failureRedirect: "/entry",
        successFlash: true,
        failureFlash: true
    }
));

export default router;
