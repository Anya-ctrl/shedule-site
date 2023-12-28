const User = require('../models/user');

exports.registerUser = async (req, res) => {
    try {
        const { email, password, name, surname } = req.body;
        const newUser = await User.create({ email, password, name, surname });
        res.status(201).send(newUser); // или редирект на страницу после регистрации
    } catch (error) {
        res.status(500).send('Registration failed');
    }
};

exports.loginUser = (req, res) => {
    const { email, password } = req.body; // Получаем данные из формы

    User.findOne({ where: { email } })
        .then(user => {
            if (!user || !user.comparePassword(password)) {
                return res.status(401).send('Invalid email or password');
            }

            req.session.user = user; // Устанавливаем данные пользователя в сессию
            res.redirect('/');
        })
        .catch(error => {
            console.error('Ошибка при поиске пользователя:', error);
            res.status(500).send('Ошибка аутентификации');
        });
};