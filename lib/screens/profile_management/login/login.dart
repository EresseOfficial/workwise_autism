import 'package:flutter/material.dart';
import '../../../widgets/color_constants.dart';
import '../signup/status.dart';
import '../../status/autism/connected/homepage.dart' as autism_homepage;
import '../../status/companies/connected/homepage.dart' as job_company_homepage;
import '../../status/family/connected/homepage.dart' as family_homepage;
import '../../status/potential_autism/connected/homepage.dart' as potential_autism_homepage;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _auth = FirebaseAuth.instance;

bool _obscurePassword = true;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _obscurePassword = true;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signInWithEmailAndPassword() async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // redirect user to home page
      // Fetch the user's status from Firestore
      final doc = await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).get();
      final userStatus = doc.get('status') as int;

      // Based on userStatus, redirect user to different home pages
      if (userStatus == 1) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => autism_homepage.Homepage()),
        );
      } else if (userStatus == 2) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => potential_autism_homepage.Homepage()),
        );
      } /* else if (userStatus == 3) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => job_company_homepage.Homepage()),
      );
    } */ else if (userStatus == 4) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => family_homepage.Homepage()),
        );
      }
      print("Connexion réussie pour l'utilisateur : ${userCredential.user!.email}");
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'user-not-found') {
        message = "Aucun utilisateur trouvé pour cet email.";
      } else if (e.code == 'wrong-password') {
        message = "Mot de passe incorrect.";
      } else {
        message = "Une erreur s'est produite lors de la connexion.";
      }
      print(message);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }
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
                    color: ColorConstants.white,
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
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: ColorConstants.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      hintText: "E-mail",
                      hintStyle: TextStyle(
                        color: ColorConstants.white,
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
                    obscureText: _obscurePassword,
                    controller: _passwordController,
                    style: TextStyle(
                      color: ColorConstants.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      hintText: "Mot de passe",
                      hintStyle: TextStyle(
                        color: ColorConstants.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility : Icons.visibility_off,
                          color: ColorConstants.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
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
                        color: ColorConstants.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: ColorConstants.white,
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
                      color: ColorConstants.white,
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
                    color: ColorConstants.white,
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
                      color: ColorConstants.white,
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