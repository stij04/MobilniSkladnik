const admin = require("firebase-admin/app");
admin.initializeApp();

const checkUserLevel = require("./check_user_level.js");
exports.checkUserLevel = checkUserLevel.checkUserLevel;
