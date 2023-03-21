import 'package:flutter/material.dart';
import 'screens/authentication.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// initialize firebase
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      debugShowCheckedModeBanner: false,
      title: 'WorkWise Autism',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Authentication(),
    );
  }
}
