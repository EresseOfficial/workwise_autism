import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../widgets/color_constants.dart';
import 'profile_management/signup/status.dart';
import 'profile_management/login/login.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();
final FirebaseAuth auth = FirebaseAuth.instance;

//
Future<User?> signInWithGoogle() async {
  try {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    if (googleUser == null) return null;
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign in to Firebase with the Google [UserCredential]
    final UserCredential userCredential = await auth.signInWithCredential(credential);

    // Once signed in, return the UserCredential
    return userCredential.user;
  } catch (error) {
    print("Error during Google sign in: $error");
    return null;
  }
}

// adding education level to user in firestore
Future<void> updateUserEducationLevel(String uid, int educationLevel) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .update({'educationLevel': educationLevel});
}

/* AUTISM SIGN UP DATA */
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
Future<void> updateUserHypersensitivities(String uid, List<String> hypersensitivities) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  return users
      .doc(uid)
      .update({'hypersensitivities': hypersensitivities})
      .then((value) => print("User hypersensitivities updated"))
      .catchError((error) => print("Failed to update user hypersensitivities: $error"));
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
Future<void> updateUserDifficulties(String uid, List<String> difficulties) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  return users
      .doc(uid)
      .update({'difficulties': difficulties})
      .then((value) => print("User difficulties updated"))
      .catchError((error) => print("Failed to update user difficulties: $error"));
}

/* END OF M.W.A SIGN UP DATA */

/* FAMILY SIGN UP DATA */

// adding interests to 'autism_people/uid/under_18/uid' in firestore
Future<void> updateAutismInterests(String uid, List<String> interests) async {
  CollectionReference users = FirebaseFirestore.instance.collection('autism_people');

  return users
      .doc(uid)
      .collection('under_18')
      .doc(uid)
      .update({'interests': interests})
      .then((value) => print("Family member interests updated"))
      .catchError((error) => print("Failed to update family member interests: $error"));
}

// adding hypersensitivities to 'autism_people/uid/under_18/uid' in firestore
Future<void> updateAutismHypersensitivities(String uid, List<String> hypersensitivities) async {
  CollectionReference users = FirebaseFirestore.instance.collection('autism_people');

  return users
      .doc(uid)
      .collection('under_18')
      .doc(uid)
      .update({'hypersensitivities': hypersensitivities})
      .then((value) => print("Family member hypersensitivities updated"))
      .catchError((error) => print("Failed to update family member hypersensitivities: $error"));
}

/* END OF FAMILY SIGN UP DATA */

FirebaseFirestore db = FirebaseFirestore.instance;

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
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
        child: Image.asset('assets/logoApp.png'),
        height: 160,
      ),
            SizedBox(height: 10),
            Container(
              child: Column(
                children: [
                  Text(
                    "WorkWise Autism",
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
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(color: Colors.white)
                              )
                          )
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => Status()),
                        );
                      },
                      child: const Text(
                        "S'inscrire",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 18),


                  SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(ColorConstants.blueDark),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(color: Colors.white)
                            ),
                          )
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => Login()),
                        );
                      },
                      child: const Text(
                        "Se connecter",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
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
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            User? user = await signInWithGoogle();
                            if (user != null) {
                              // L'utilisateur s'est connecté avec succès, fais ce que tu veux avec l'objet `user`.
                            } else {
                              // Une erreur s'est produite lors de la connexion.
                            }
                          },
                          child: Container(
                            height: 55,
                            width: 55,
                            child: Center(
                              child: Image.asset('assets/google_icon.png', width: 70, height: 70), // Remplacer par le nom de ton fichier d'icône Google
                            ),
                          ),
                        ),

                        SizedBox(width: 20),
                        Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              "F",
                              style: TextStyle(
                                color: ColorConstants.blueDark,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              "A",
                              style: TextStyle(
                                color: ColorConstants.blueDark,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
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