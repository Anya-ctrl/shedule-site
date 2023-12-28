const { Sequelize, DataTypes } = require('sequelize');
require('dotenv').config();

const sequelize = new Sequelize(process.env.DB_DATABASE, process.env.DB_USER, process.env.DB_PASSWORD, {
  host: process.env.DB_HOST,
  dialect: 'mysql',
});

const Speciality = sequelize.define('speciality', {
    speciality_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    speciality: {
      type: DataTypes.STRING(100),
    },
}, {
  tableName: 'speciality',
  timestamps: false
});
  
module.exports = Speciality;