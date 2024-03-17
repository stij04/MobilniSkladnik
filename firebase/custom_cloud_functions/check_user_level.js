const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.checkUserLevel = functions
  .region("europe-west3")
  .firestore.document("users/{uid}")
  .onUpdate(async (change, context) => {
    // Write your code below!

    const newValue = change.after.data();
    const oldValue = change.before.data();
    const uid = context.params.uid;

    const levels = await admin.firestore().collection("uroven").get();
    let newLevel = null;

    levels.docs.forEach((doc) => {
      const level = doc.data();

      if (
        newValue.UziBody >= level.UroHranice &&
        (!oldValue.UziBody || oldValue.UziBody < level.UroHranice)
      ) {
        if (!newLevel || level.UroPoradi > newLevel) {
          newLevel = level.UroPoradi;
        }
      }
    });

    if (newLevel) {
      const token = newValue.fcmToken;

      if (token) {
        const message = {
          notification: {
            title: "Nová úroveň dosažena!",
            body: `Gratulujeme, dosáhli jste úrovně: ${newLevel}!`,
          },
          data: {
            route: "LevelPage",
          },
          token: token,
        };

        return admin
          .messaging()
          .send(message)
          .then((response) => {
            console.log("Úspěšně odeslaná notifikace:", response);

            const notificationData = {
              uid: uid,
              title: message.notification.title,
              body: message.notification.body,
              timestamp: admin.firestore.FieldValue.serverTimestamp(),
            };

            return admin
              .firestore()
              .collection("notifications")
              .add(notificationData);
          })
          .catch((error) => {
            console.log("Chyba při odesílání notifikace:", error);
            return null;
          });
      } else {
        console.log("Uživatel nemá FCM token.");
        return null;
      }
    }

    return null;
    // Write your code above!
  });
