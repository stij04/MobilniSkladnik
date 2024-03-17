import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAx2uqGc52gKEZ8y-0Kn9OPu1XD7GOCdXk",
            authDomain: "mobilniskladnik-32a85.firebaseapp.com",
            projectId: "mobilniskladnik-32a85",
            storageBucket: "mobilniskladnik-32a85.appspot.com",
            messagingSenderId: "254777759671",
            appId: "1:254777759671:web:d45d3955d79fba86b23a32",
            measurementId: "G-FTSY37CQJ8"));
  } else {
    await Firebase.initializeApp();
  }
}
