const { Sequelize, DataTypes } = require('sequelize');
require('dotenv').config();

const sequelize = new Sequelize(process.env.DB_DATABASE, process.env.DB_USER, process.env.DB_PASSWORD, {
  host: process.env.DB_HOST,
  dialect: 'mysql',
});

const Friday = sequelize.define('friday', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  group_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: '_group',
      key: 'group_id',
    },
  },
  firstLesson: {
    type: DataTypes.STRING(255),
  },
  secondLesson: {
    type: DataTypes.STRING(255),
  },
  thirdLesson: {
    type: DataTypes.STRING(255),
  },
  fourthLesson: {
    type: DataTypes.STRING(255),
  },
}, {
  tableName: 'friday',
  timestamps: false
});

module.exports = Friday;