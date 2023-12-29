import { Sequelize, DataTypes } from 'sequelize';
import dotenv from 'dotenv';
import Group from './group.js';

dotenv.config();

const sequelize = new Sequelize(process.env.DB_DATABASE, process.env.DB_USER, process.env.DB_PASSWORD, {
    host: process.env.DB_HOST,
    dialect: 'mysql',
});

const Course = sequelize.define('course', {
    course_id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    course: {
        type: DataTypes.INTEGER,
    },
}, {
    tableName: 'course',
    timestamps: false
});

Course.belongsTo(Group, { foreignKey: 'course_id' });

// Logging
console.log('Course model defined.');

export default Course;
