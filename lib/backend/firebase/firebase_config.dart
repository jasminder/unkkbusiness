import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBoPFBsEw-z9d7L0Ti8idFBuddhuhsockM",
            authDomain: "unkk-kl1611.firebaseapp.com",
            projectId: "unkk-kl1611",
            storageBucket: "unkk-kl1611.appspot.com",
            messagingSenderId: "21002556204",
            appId: "1:21002556204:web:4b41cc2f2b38bbd5e79289"));
  } else {
    await Firebase.initializeApp();
  }
}
