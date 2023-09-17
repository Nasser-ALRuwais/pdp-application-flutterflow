import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCuAoKKkWpwZ1dwV-anZWdxowt76FK_zPM",
            authDomain: "pdp-conference-2023.firebaseapp.com",
            projectId: "pdp-conference-2023",
            storageBucket: "pdp-conference-2023.appspot.com",
            messagingSenderId: "855529549172",
            appId: "1:855529549172:web:ab429210d00a660f2b1021",
            measurementId: "G-DLZXG4Z9GG"));
  } else {
    await Firebase.initializeApp();
  }
}
