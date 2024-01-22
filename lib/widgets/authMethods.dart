import 'package:flutter/material.dart';

import '../screens/profile_management/signup/status.dart';
// import 'fast_login_buttons.dart.old';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../screens/authentication.dart';

class AuthMethods {
  static Future<User?> signInWithGoogle(BuildContext context) async {
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
  }

  static Future<void> signInWithApple(BuildContext context) async {
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
  static void redirectToStatusPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => Status()),
    );
  }
}
