import 'package:complete/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app.dart';

// TODO(codelab user): Get API key
//const clientId = 'YOUR_CLIENT_ID';
//https://firebase.google.com/codelabs/firebase-auth-in-flutter-apps#3

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
