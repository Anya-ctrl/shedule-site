import { Sequelize, DataTypes } from 'sequelize';
import dotenv from 'dotenv';
dotenv.config();

const sequelize = new Sequelize(process.env.DB_DATABASE, process.env.DB_USER, process.env.DB_PASSWORD, {
  host: process.env.DB_HOST,
  dialect: 'mysql',
});

const Student = sequelize.define('student', {
    student_id: {
      type: DataTypes.BIGINT,
      primaryKey: true,
      autoIncrement: true,
    },
    name: {
      type: DataTypes.STRING(255),
    },
    surname: {
      type: DataTypes.STRING(255),
    },
    phone: {
      type: DataTypes.STRING(255),
    },
}, {
  tableName: 'student',
  timestamps: false
});
  
export default Student;