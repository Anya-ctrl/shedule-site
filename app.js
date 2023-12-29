import { join } from 'path';
import express, { urlencoded, json } from 'express';
import serveStatic from 'serve-static'; // Изменим импорт на serve-static
import Sequelize from 'sequelize';
import session from 'express-session';
import indexRouter from './routes/indexRouter.js';
import userRoutes from './routes/userRoutes.js';
import feedbackRouter from './routes/feedbackRouter.js';
import models from './models/index.js'
import { config as dotenvConfig } from 'dotenv';

import { fileURLToPath } from 'url';
import { dirname } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

dotenvConfig(); // Используем метод config из пакета dotenv для загрузки переменных окружения

const {
    PORT = 3000,
    DB_DATABASE,
    DB_USER,
    DB_PASSWORD,
    DB_HOST,
    DB_DIALECT,
    SESSION_SECRET
} = process.env;

const app = express();

// Middleware для разбора URL-кодированных данных (обычно данные формы)
app.use(urlencoded({ extended: true }));

// Middleware для разбора JSON-данных
app.use(json());

// Подключение к базе данных
const sequelize = new Sequelize(DB_DATABASE, DB_USER, DB_PASSWORD, {
    host: DB_HOST,
    dialect: DB_DIALECT,
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
        console.log('Connection to the database has been established successfully.');
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
app.use(serveStatic(join(__dirname, 'public')));
app.set('view engine', 'ejs');

app.use('/', indexRouter);
app.use('/users', userRoutes);
app.use('/feedback', feedbackRouter);

// Middleware для сессий с использованием MemoryStore для хранения сессий
app.use(session({
    secret: SESSION_SECRET,
    resave: false,
    saveUninitialized: true,
    store: new session.MemoryStore() // Используем MemoryStore для хранения сессий
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
    res.status(err.status || 500).send(`Error: ${err.message}`);
});

// Завершение работы сервера при выключении
process.on('SIGINT', () => {
    sequelize.close()
        .then(() => {
            console.log('Database connection closed.');
            process.exit(0);
        })
        .catch((err) => {
            console.error('Error closing database connection:', err);
            process.exit(1);
        });
});

// Запуск сервера на указанном порту
sequelize.sync({ force: false })
    .then(() => {
        console.log('Database synced');
        app.listen(PORT, () => {
            console.log(`Server is running on port ${PORT}`);
        });
    })
    .catch((error) => {
        console.error('Unable to sync database:', error);
    });