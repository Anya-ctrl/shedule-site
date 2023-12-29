import models from '../models/index.js';

export async function getIndexPage(req, res) {
    console.log('Processing request for index page');

    try {
        const faculty = await models.Faculty.findAll();
        const speciality = await models.Speciality.findAll();
        const course = await models.Course.findAll();
        const group = await models.Group.findAll();
        const isLoggedIn = req.session && req.session.isLoggedIn ? req.session.isLoggedIn : false;

        res.render('index', { faculty, speciality, course, group, isLoggedIn });
    } catch (error) {
        console.error('Error fetching data:', error);
        res.status(500).send('Error fetching data');
    }
}

export function getEntryPage(req, res) {
    console.log('Processing request for entry page');
    res.render('entry', { isLoggedIn: req.session && req.session.isLoggedIn ? req.session.isLoggedIn : false });
}

export function getFeedbackPage(req, res) {
    console.log('Processing request for feedback page');
    res.render('feedback', { isLoggedIn: req.session && req.session.isLoggedIn ? req.session.isLoggedIn : false });
}

export function getProfessorsPage(req, res) {
    console.log('Processing request for professors page');
    res.render('professors', { isLoggedIn: req.session && req.session.isLoggedIn ? req.session.isLoggedIn : false });
}

export async function getRegistrationPage(req, res) {
    console.log('Processing request for registration page');
    res.render('registration', { isLoggedIn: req.session && req.session.isLoggedIn ? req.session.isLoggedIn : false });
    console.log('Registration page request processed and rendered');
}

export function getSchedulePage(req, res) {
    console.log('Processing request for schedule page');
    const selectedGroup = req.session.selectedGroup || 'No group selected';
    res.render('schedule', { selectedGroup, isLoggedIn: req.session && req.session.isLoggedIn ? req.session.isLoggedIn : false });
}