import { Router } from 'express';
const router = Router();
import { registerUser, loginUser } from '../controllers/userController.js';
import { body, validationResult } from 'express-validator';

// Валидация данных при регистрации
router.post(
    '/register',
    [
        body('email').isEmail().normalizeEmail(),
        body('password').isLength({ min: 6 }),
        body('name').isLength({ min: 2 }),
        body('surname').isLength({ min: 2 }),
    ],
    registerUser
);

// Маршрут для страницы входа (GET)
router.get('/entry', (req, res) => {
    res.render('entry');
});

// Маршрут для обработки входа (POST)
router.post('/login', loginUser);

export default router;