import models from "../models/index.js";
import bcrypt from "bcryptjs";

function findUserByEmail(emailInput) {
    return  new Promise(async (resolve, reject) => {
        try {
            let user = await models.User.findOne({
                where: {
                    email: emailInput
                }
            });

            if (!user) {
                reject(`We can't find a user with such email "${emailInput}"`)
            }

            console.log("User email is correct")

            resolve(user);

        } catch (error) {
            reject(error);
        }
    });
};

async function comparePassword(password, email) {
    try {
        let user = await models.User.findOne({
            where: {
                email: email
            }
        });

        if (!user) {
            return "The email you've entered does not exist.";
        }

        let isMatch = await bcrypt.compare(password, user.password);

        if (isMatch) {
            console.log("User password is correct")
            return true; // Возвращаем true, если пароли совпадают
        } else {
            return "The password you've entered is incorrect.";
        }
    } catch (error) {
        throw new Error(error);
    }
}



function findUserById(idInput) {
    return new Promise(async (resolve, reject) => {
        try {
            let user = await models.User.findOne({
                where: {
                    id: idInput
                }
            });

            if (!user) {
                reject(`User not found by the id: ${idInput}`);
            } else {
                resolve(user);
            }
        } catch (error) {
            reject(error);
        }
    });
};

export default {
    findUserByEmail: findUserByEmail,
    comparePassword: comparePassword,
    findUserById: findUserById
};