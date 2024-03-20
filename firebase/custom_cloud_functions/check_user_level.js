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

    if (newValue.UziBody === oldValue.UziBody) {
      console.log("Změna se netýkala pole UziBody.");
      return null;
    }

    const uid = context.params.uid;

    const levels = await admin.firestore().collection("uroven").get();
    let newLevel = null;

    levels.docs.forEach((doc) => {
      const level = doc.data();

      if (
        newValue.UziBody >= level.UroHranice &&
        (!oldValue.UziBody || oldValue.UziBody < level.UroHranice)
      ) {
        if (!newLevel || level.UroPoradi > newLevel.UroPoradi) {
          newLevel = level;
        }
      }
    });

    if (newLevel) {
      const token = newValue.fcmToken;

      if (token) {
        const message = {
          notification: {
            title: "Nová úroveň dosažena",
            body: `Gratulujeme!\nDosáhli jste úrovně ${newLevel.UroPoradi} – ${newLevel.UroNazev}\nZískáváte ${newLevel.UroMena} MS`,
          },
          data: {
            route: "HomePage",
          },
          token: token,
        };

        return admin
          .messaging()
          .send(message)
          .then((response) => {
            console.log("Úspěšně odeslaná notifikace: ", response);

            const notificationData = {
              uid: uid,
              UziId: oldValue.UziId,
              UroId: newLevel.UroId,
              hidden: false,
              timestamp: admin.firestore.FieldValue.serverTimestamp(),
            };

            return admin
              .firestore()
              .collection("notifications")
              .add(notificationData);
          })
          .catch((error) => {
            console.log("Chyba při odesílání notifikace: ", error);
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
