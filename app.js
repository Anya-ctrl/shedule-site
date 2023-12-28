const path = require('path');
const express = require('express');
const Sequelize = require('sequelize');
const session = require('express-session');
const indexRouter = require('./routes/indexRouter');
const userRoutes = require('./routes/userRoutes');
const feedbackRouter = require('./routes/feedbackRouter');
const dbConfig = require('./config/db.config');
const models = require('./models');
require('dotenv').config();

const app = express();
const port = process.env.PORT || 3000;

// Middleware для разбора URL-кодированных данных (обычно данные формы)
app.use(express.urlencoded({ extended: true }));

// Middleware для разбора JSON-данных
app.use(express.json());

// Подключение к базе данных
const sequelize = new Sequelize(dbConfig.DATABASE, dbConfig.USER, dbConfig.PASSWORD, {
    host: dbConfig.HOST,
    dialect: dbConfig.DIALECT,
});

// Middleware для проверки авторизации
const checkAuth = (req, res, next) => {
    if (req.session && req.session.isLoggedIn) {
        res.locals.isLoggedIn = true;
    } else {
        res.locals.isLoggedIn = false;
    }
    next();
};

// Проверка соединения с базой данных
sequelize
    .authenticate()
    .then(() => {
        console.log('Connection has been established successfully.');
    })
    .catch((err) => {
        console.error('Unable to connect to the database:', err);
    });

// Синхронизация моделей с базой данных
sequelize.sync({ alter: true })
    .then(() => {
        console.log('All models were synchronized successfully.');
    })
    .catch((err) => {
        console.error('Unable to synchronize models:', err);
    });

// Настройка приложения Express
app.use(express.static(path.join(__dirname, 'public')));
app.set('view engine', 'ejs');

app.use('/', indexRouter);
app.use('/users', userRoutes);
app.use('/feedback', feedbackRouter); // Использование маршрута для обработки отзывов

app.use(session({
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: true
}));

app.use(checkAuth);

// Обработка ошибок 404 (Not Found)
app.use((req, res, next) => {
    const error = new Error('Not Found');
    error.status = 404;
    next(error);
});

// Обработка ошибок сервера 500 (Internal Server Error)
app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(err.status || 500).send('Something went wrong!');
});

// Запуск сервера на указанном порту
sequelize.sync({ force: false })
    .then(() => {
        console.log('Database synced');
        app.listen(port, () => {
            console.log(`Server is running on port ${port}`);
        });
    })
    .catch((error) => {
        console.error('Unable to sync database:', error);
    });
