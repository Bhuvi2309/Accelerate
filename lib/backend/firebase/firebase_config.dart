import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDhFw3jO4xIFYFZB5YkPlzHDGwQUv7ObIg",
            authDomain: "accelerate-conference-2024.firebaseapp.com",
            projectId: "accelerate-conference-2024",
            storageBucket: "accelerate-conference-2024.appspot.com",
            messagingSenderId: "738572524315",
            appId: "1:738572524315:web:43c1a226278c31a14d91be",
            measurementId: "G-CWYB2X7S76"));
  } else {
    await Firebase.initializeApp();
  }
}
