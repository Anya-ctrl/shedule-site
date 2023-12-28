const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');
const { body, validationResult } = require('express-validator');

// Валидация данных при регистрации
router.post(
    '/register',
    [
        body('email').isEmail().normalizeEmail(),
        body('password').isLength({ min: 6 }),
        body('name').isLength({ min: 2 }),
        body('surname').isLength({ min: 2 }),
    ],
    userController.registerUser
);

// Маршрут для страницы входа (GET)
router.get('/entry', (req, res) => {
    res.render('entry');
});

// Маршрут для обработки входа (POST)
router.post('/login', userController.loginUser);

module.exports = router;