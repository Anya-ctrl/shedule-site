import { Sequelize, DataTypes } from 'sequelize';
import dotenv from 'dotenv';
dotenv.config();

let Speciality, Course;

const sequelize = new Sequelize(process.env.DB_DATABASE, process.env.DB_USER, process.env.DB_PASSWORD, {
  host: process.env.DB_HOST,
  dialect: 'mysql',
});

const Group = sequelize.define('_group', {
  group_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  group_name: {
    type: DataTypes.STRING(10),
  },
}, {
  tableName: '_group',
  timestamps: false
});

Promise.all([
  import('./speciality.js').then((module) => { Speciality = module.default; }),
  import('./course.js').then((module) => { Course = module.default; })
]).then(() => {
  if (Speciality && Course) {
    Group.hasMany(Speciality, { foreignKey: 'speciality_id' });
    Group.hasMany(Course, { foreignKey: 'course_id' });

    Speciality.belongsTo(Group, { foreignKey: 'speciality_id' });
    Course.belongsTo(Group, { foreignKey: 'course_id' });
  } else {
    console.error('Failed to import required modules');
  }
});

export default Group;
