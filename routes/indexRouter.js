import { Router } from 'express';
const router = Router();

import { getIndexPage, getEntryPage, getFeedbackPage, getProfessorsPage, getRegistrationPage, getSchedulePage } from '../controllers/indexController.js';

// Логирование для каждого маршрута
router.get('/', (req, res, next) => {
    console.log('Получен запрос на главную страницу');
    getIndexPage(req, res, next);
});

router.get('/entry', (req, res, next) => {
    console.log('Получен запрос на страницу входа');
    getEntryPage(req, res, next);
});

router.get('/feedback', (req, res, next) => {
    console.log('Получен запрос на страницу обратной связи');
    getFeedbackPage(req, res, next);
});

router.get('/professors', (req, res, next) => {
    console.log('Получен запрос на страницу с преподавателями');
    getProfessorsPage(req, res, next);
});

router.get('/registration', (req, res, next) => {
    console.log('Получен запрос на страницу регистрации');
    getRegistrationPage(req, res, next);
});

router.get('/shedule', (req, res, next) => {
    console.log('Получен запрос на страницу расписания');
    getSchedulePage(req, res, next);
});

export default router;
