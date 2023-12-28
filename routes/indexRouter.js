const express = require('express');
const router = express.Router();

const indexController = require('../controllers/indexController');
const entryController = require('../controllers/entryController');
const feedbackController = require('../controllers/feedbackController');
const professorsController = require('../controllers/professorsController');
const registrationController = require('../controllers/registrationController');
const sheduleController = require('../controllers/sheduleController');


// Обработчики маршрутов для разных страниц
router.get('/', indexController.getIndexPage);
router.get('/entry', entryController.getIndexPage);
router.get('/feedback', feedbackController.getIndexPage);
router.get('/professors', professorsController.getIndexPage);
router.get('/registration', registrationController.getIndexPage);
router.get('/shedule', sheduleController.getIndexPage);

module.exports = router;