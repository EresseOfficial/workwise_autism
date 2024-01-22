import 'package:flutter/material.dart';
import '../widgets/color_constants.dart';
import 'profile_management/signup/status.dart';
import 'profile_management/login/login.dart';

import 'package:workwise_autism/widgets/custom_buttons.dart';
// import 'package:workwise_autism/widgets/fast_login_buttons.dart.old';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();
final FirebaseAuth auth = FirebaseAuth.instance; 

// adding education level to user in firestore
Future<void> updateUserEducationLevel(String uid, int educationLevel) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .update({'educationLevel': educationLevel});
}

/* AUTISM SIGN UP DATA */
// adding skills to user in firestore
Future<void> updateUserSkills(String uid, List<String> skills) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  return users
      .doc(uid)
      .update({'skills': skills})
      .then((value) => print("User skills updated"))
      .catchError((error) => print("Failed to update user skills: $error"));
}

// adding interests to user in firestore
Future<void> updateUserInterests(String uid, List<String> interests) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  return users
      .doc(uid)
      .update({'interests': interests})
      .then((value) => print("User interests updated"))
      .catchError((error) => print("Failed to update user interests: $error"));
}

// adding hypersensitivities to user in firestore
Future<void> updateUserHypersensitivities(
    String uid, List<String> hypersensitivities) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  return users
      .doc(uid)
      .update({'hypersensitivities': hypersensitivities})
      .then((value) => print("User hypersensitivities updated"))
      .catchError(
          (error) => print("Failed to update user hypersensitivities: $error"));
}
/* END OF AUTISM SIGN UP DATA */

/* M.W.A SIGN UP DATA */

// adding assets to user in firestore
Future<void> updateUserAssets(String uid, List<String> assets) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  return users
      .doc(uid)
      .update({'assets': assets})
      .then((value) => print("User assets updated"))
      .catchError((error) => print("Failed to update user assets: $error"));
}

// adding difficulties to user in firestore
Future<void> updateUserDifficulties(
    String uid, List<String> difficulties) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  return users
      .doc(uid)
      .update({'difficulties': difficulties})
      .then((value) => print("User difficulties updated"))
      .catchError(
          (error) => print("Failed to update user difficulties: $error"));
}

/* END OF M.W.A SIGN UP DATA */

/* FAMILY SIGN UP DATA */

// adding interests to 'autism_people/uid/under_18/uid' in firestore
Future<void> updateAutismInterests(String uid, List<String> interests) async {
  CollectionReference users =
      FirebaseFirestore.instance.collection('autism_people');

  return users
      .doc(uid)
      .collection('under_18')
      .doc(uid)
      .update({'interests': interests})
      .then((value) => print("Family member interests updated"))
      .catchError(
          (error) => print("Failed to update family member interests: $error"));
}

// adding hypersensitivities to 'autism_people/uid/under_18/uid' in firestore
Future<void> updateAutismHypersensitivities(
    String uid, List<String> hypersensitivities) async {
  CollectionReference users =
      FirebaseFirestore.instance.collection('autism_people');

  return users
      .doc(uid)
      .collection('under_18')
      .doc(uid)
      .update({'hypersensitivities': hypersensitivities})
      .then((value) => print("Family member hypersensitivities updated"))
      .catchError((error) =>
          print("Failed to update family member hypersensitivities: $error"));
}

/* END OF FAMILY SIGN UP DATA */

//
class ExternalAccountInfo {
  final String name;
  final String email;
  final String userId;

  ExternalAccountInfo(
      {required this.name, required this.email, required this.userId});
}

FirebaseFirestore db = FirebaseFirestore.instance;

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  // Google Sign In
  Future<User?> signInWithGoogle(BuildContext context) async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      if (googleUser == null) return null;
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google [UserCredential]
      final UserCredential userCredential =
          await auth.signInWithCredential(credential);

      // Once signed in, return the UserCredential
      final User? user = userCredential.user;
      if (user != null) {
        redirectToStatusPage(context);
      }
      return user;
    } catch (e) {
      print('Erreur lors de la connexion Google : $e');
    }
    return null;
  }

// Facebook Sign In
  Future<void> signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      if (loginResult.status == LoginStatus.success) {
        // Use access token to get user data from Facebook
        final userData = await FacebookAuth.instance.getUserData();
        // Process the user data retrieved from Facebook
        print("Connexion Facebook réussie : $userData");
        redirectToStatusPage(context);
      } else {
        print("Connexion Facebook annulée par l'utilisateur.");
      }
    } on Exception catch (e) {
      print("Erreur lors de la connexion Facebook : $e");
    }
  }

// Apple Sign In
  Future<void> signInWithApple(BuildContext context) async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId: '32DN4HNNXU',
          redirectUri: Uri.parse(
              'https://workwise-autism.com/callbacks/sign_in_with_apple'),
        ),
      );

      // Use the credential information obtained to authenticate with your own system
      print(credential);
      redirectToStatusPage(context);
    } catch (e) {
      print('Erreur lors de la connexion avec Apple : $e');
    }
  }

  // function to redirect to status page once quick connect is done and successful
  void redirectToStatusPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => Status()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.blueDark,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 100),
              Container(
                alignment: Alignment.center,
                child: Image.asset('assets/logos/logoApp.png'),
                height: 160,
              ),
              SizedBox(height: 10),
              Container(
                child: Column(
                  children: [
                    Text(
                      "Workwise Autism",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    CustomButtons.signUpButton(context, Status()),
                    SizedBox(height: 18),
                    CustomButtons.signInButton(context, Login()),
                    SizedBox(height: 20),

                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 1,
                            width: 80,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "ou",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            height: 1,
                            width: 80,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    // fast login buttons (Google, Facebook, Apple)
                    /*
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FastLoginButtons.googleButton(context),
                      SizedBox(width: 20),
                      FastLoginButtons.facebookButton(context),
                      SizedBox(width: 20),
                      FastLoginButtons.appleButton(context),
                    ],
                  ),
                   */

                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Google
                          InkWell(
                            onTap: () async {
                              User? user = await signInWithGoogle(context);
                              if (user != null) {
                                // The user is logged in.
                              } else {
                                // An error occurred during login.
                              }
                            },
                            child: Container(
                              height: 55,
                              width: 55,
                              child: Center(
                                child: Image.asset(
                                    'assets/logos/google_icon.png',
                                    width: 70,
                                    height: 70),
                              ),
                            ),
                          ),

                          SizedBox(width: 20),

                          // Facebook
                          Container(
                            height: 55,
                            width: 55,
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  signInWithFacebook(context);
                                },
                                child: Image.asset(
                                  'assets/logos/facebook_icon.png',
                                  height: 45,
                                  width: 45,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),

                          // Apple
                          Container(
                            height: 55,
                            width: 55,
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  signInWithApple(context);
                                },
                                child: Image.asset(
                                  'assets/logos/apple_icon.png',
                                  height: 45,
                                  width: 45,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ]
        )
    );
  }
}
