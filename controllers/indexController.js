const Faculty = require('../models/faculty');
const Speciality = require('../models/speciality');
const Course = require('../models/course');
const Group = require('../models/group');

exports.getIndexPage = async (req, res) => {
    try {
        const faculty = await Faculty.findAll();
        const speciality = await Speciality.findAll();
        const course = await Course.findAll();
        const group = await Group.findAll();

        const isLoggedIn = req.session && req.session.isLoggedIn ? req.session.isLoggedIn : false;

        res.render('index', { faculty, speciality, course, group, isLoggedIn });
    } catch (error) {
        console.error('Error fetching data:', error);
        res.status(500).send('Error fetching data');
    }
};
