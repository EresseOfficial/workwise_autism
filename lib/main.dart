import 'package:flutter/material.dart';
import 'package:workwise_autism/screens/auth_story.dart';
import 'screens/authentication.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

// initialize firebase
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(workwise_autism());
}

// void main() {
//   runApp(const workwise_autism());
// }





class workwise_autism extends StatelessWidget {
  const workwise_autism({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'WorkWise Autism',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Authentication(),
    );
  }
}
