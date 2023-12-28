const express = require('express');
const router = express.Router();
const Feedback = require('../models/feedback');

// Обработка POST запроса с данными отзыва
router.post('/submit', async (req, res) => {
    const { name, email, message } = req.body;
  
    try {
        // Создание записи обратной связи в базе данных
        const feedback = await Feedback.create({ name, email, message });
  
        // Отправка ответа клиенту
        res.status(201).send('Отзыв успешно отправлен');
    } catch (error) {
        console.error('Ошибка при сохранении отзыва:', error);
        res.status(500).send('Произошла ошибка, попробуйте позже');
    }
});
  
module.exports = router;
