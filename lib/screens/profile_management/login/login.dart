import 'package:flutter/material.dart';
import '../../../widgets/color_constants.dart';
import '../signup/status.dart';
import '../../status/autism/connected/homepage.dart' as autism_homepage;
import '../../status/companies/connected/homepage.dart' as job_company_homepage;
import '../../status/family/connected/homepage.dart' as family_homepage;
import '../../status/maybe_with_autism/connected/homepage.dart' as maybe_with_autism_homepage;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _auth = FirebaseAuth.instance;

Future<void> _signInWithEmailAndPassword() async {
  try {
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );
    // redirect user to home page
    print("Connexion réussie pour l'utilisateur : ${userCredential.user!.email}");
  } on FirebaseAuthException catch (e) {
    print("Erreur lors de la connexion : $e");
    // display error message to user
  }
}

/* Replace function _signInWithEmailAndPassword() with this below later */
// Future<void> _signInWithEmailAndPassword() async {
//   try {
//     final userCredential = await _auth.signInWithEmailAndPassword(
//       email: _emailController.text,
//       password: _passwordController.text,
//     );
//     // redirect user to home page based on their status
//     Navigator.of(context).pushReplacement(
//       MaterialPageRoute(
//         builder: (context) => Homepage(),
//       ),
//     );
//   } on FirebaseAuthException catch (e) {
//     print("Erreur lors de la connexion : $e");
//     // display error message to user
//   }
// }




class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blueDark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 100),

          // Application logo
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
                  "Connectez-vous",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),

          // email and password fields
          Container(
            child: Column(
              children: [
                Container(
                  width: 300,
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "E-mail",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: "Mot de passe",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // login button and forgot password link
          Container(
            child: Column(
              children: [
                Container(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _signInWithEmailAndPassword,
                    child: Text(
                      "Se connecter",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Mot de passe oublié ?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // don't have an account section + sign up link
          Container(
            child: Column(
              children: [
                Text(
                  "Pas encore de compte ?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => Status()),
                    );
                  },
                  child: Text(
                    "S'inscrire",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}