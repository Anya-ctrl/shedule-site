import { join, dirname } from 'path';
import express from 'express';
import { urlencoded, json } from 'express';
import serveStatic from 'serve-static';
import Sequelize from 'sequelize';
import session from 'express-session';
import { config as dotenvConfig } from 'dotenv';
import { fileURLToPath } from 'url';
import connectFlash from 'connect-flash';
import cookieParser from 'cookie-parser';
import indexRouter from './routes/indexRouter.js';
import models from './models/index.js';

// Constants and configurations
const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
dotenvConfig();

const {
  PORT = 3000,
  DB_DATABASE,
  DB_USER,
  DB_PASSWORD,
  DB_HOST,
  DB_DIALECT,
  SESSION_SECRET
} = process.env;

// Express app initialization
const app = express();

// Middleware setup
app.use(cookieParser(SESSION_SECRET));
app.use(urlencoded({ extended: true }));
app.use(json());

// Database connection
const sequelize = new Sequelize(DB_DATABASE, DB_USER, DB_PASSWORD, {
  host: DB_HOST,
  dialect: DB_DIALECT,
});

// Middleware для сессий с использованием MemoryStore для хранения сессий
app.use(session({
    secret: SESSION_SECRET,
    resave: true,
    saveUninitialized: false,
    cookie: {
        maxAge: 1000 * 60 * 60 *24 //1 day
    },
    store: new session.MemoryStore() // Используем MemoryStore для хранения сессий
}));

app.use(connectFlash());

app.get('/logout', (req, res) => {
    console.log('Получен запрос на выход из сессии');
    req.session.isLoggedIn = false;
    res.redirect('/');
});

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

// Обработка ошибок 404 (Not Found)
app.use((req, res, next) => {
    res.status(404).send('404 - Not Found');
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