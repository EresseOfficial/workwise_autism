import 'package:flutter/material.dart';
import 'package:workwise_autism/screens/auth_story.dart';
import 'package:workwise_autism/screens/profile_management/signup/status.dart';
import 'package:workwise_autism/screens/status/autism/signup/profile_creation/company_qualities.dart';
import 'package:workwise_autism/screens/status/autism/signup/profile_creation/education_lvl.dart';
import 'package:workwise_autism/screens/status/autism/signup/profile_creation/find_work.dart';
import 'package:workwise_autism/screens/status/autism/signup/profile_creation/gender.dart';
import 'package:workwise_autism/screens/status/autism/signup/profile_creation/interest.dart';
import 'package:workwise_autism/screens/status/autism/signup/profile_creation/interest_levels/interest_college.dart';
import 'package:workwise_autism/screens/status/autism/signup/profile_creation/interest_levels/interest_highSchool.dart';
import 'package:workwise_autism/screens/status/autism/signup/profile_creation/interest_levels/interest_postGraduate.dart';
import 'package:workwise_autism/screens/status/autism/signup/profile_creation/interest_levels/interest_school.dart';
import 'package:workwise_autism/screens/status/autism/signup/profile_creation/interest_levels/interest_university.dart';
import 'package:workwise_autism/screens/status/autism/signup/profile_creation/objectives_autism.dart';
import 'package:workwise_autism/screens/status/autism/signup/profile_creation/skill.dart';
import 'screens/authentication.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'package:sentry_flutter/sentry_flutter.dart';

// initialize firebase
void main() async {
  await SentryFlutter.init(
        (options) {
      options.dsn = 'https://8a5583a49bc235f68f5edbd9c4cf7bca@o4506637194756096.ingest.sentry.io/4506637195935744';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(workwise_autism()),
  );
  // Sentry.captureException(Exception('Sentry Test'));
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
