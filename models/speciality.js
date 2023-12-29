import { Sequelize, DataTypes } from 'sequelize';
import dotenv from 'dotenv';
dotenv.config();

let Faculty, Group;

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

Promise.all([
    import('./faculty.js').then((module) => { Faculty = module.default; }),
    import('./group.js').then((module) => { Group = module.default; })
]).then(() => {
  if (Faculty && Group) {
    Speciality.belongsTo(Faculty, { foreignKey: 'faculty_id' });
    Speciality.belongsTo(Group, { foreignKey: 'speciality_id' });
  } else {
    console.error('Failed to import required modules');
  }
});

export default Speciality;
