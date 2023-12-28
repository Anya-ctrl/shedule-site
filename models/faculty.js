const { Sequelize, DataTypes } = require('sequelize');
require('dotenv').config();

const sequelize = new Sequelize(process.env.DB_DATABASE, process.env.DB_USER, process.env.DB_PASSWORD, {
    host: process.env.DB_HOST,
    dialect: 'mysql',
});

const Faculty = sequelize.define('faculty', {
    faculty_id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    faculty: {
        type: DataTypes.STRING(100),
    },
}, {
    tableName: 'faculty',
    timestamps: false
});

module.exports = Faculty; // Экспорт модели Faculty
