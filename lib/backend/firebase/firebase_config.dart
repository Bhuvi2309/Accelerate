import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA90wW7LU2_kDAl8mKFjOUwVCuyMdImDW8",
            authDomain: "accelerate-d0a77.firebaseapp.com",
            projectId: "accelerate-d0a77",
            storageBucket: "accelerate-d0a77.appspot.com",
            messagingSenderId: "524709420894",
            appId: "1:524709420894:web:2cb10b52e4e9c717d5b9cf",
            measurementId: "G-GB2B1T5V13"));
  } else {
    await Firebase.initializeApp();
  }
}
