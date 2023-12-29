import passport from "passport";
import passportLocal from "passport-local";
import loginService from "../../services/loginService.js";

let localStrartegy = passportLocal.Strategy;

async function initPassportLocal() {
    passport.use(new localStrartegy({
        usernameField: "email",
        passwordField: "password",
        passReqToCallback: true,
    }, async (req, email, password, done) => {
        try {
            let message = await loginService.comparePassword(password, email);

            if (message === true) {
                // Пароли совпали
                // Верните пользователя как успешный результат
                let user = await loginService.findUserByEmail(email);
                return done(null, user, null);
            } else {
                // Пароли не совпали, верните сообщение об ошибке
                return done(null, false, req.flash("errors", message));
            }
        } catch (error) {
            console.log(error);
            return done(null, false, error);
        }
    }));
};

passport.serializeUser((user, done) => {
    return done(null, user.id);
});

passport.deserializeUser((id, done) => {
    loginService.findUserById(id)
    .then(user => {
        return done(null, user);
    })
    .catch(error => {
        console.log(error);
        return done(error, null);
    })
});

export default initPassportLocal;