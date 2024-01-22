import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../profile_management/login/login.dart';
import 'mail_confirm.dart';
import '../../../../../widgets/color_constants.dart';
import '../../../../profile_management/signup/status.dart';

import 'package:firebase_auth/firebase_auth.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();
final confirmPasswordController = TextEditingController();

void sendVerificationEmail() async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null && !user.emailVerified) {
    await user.sendEmailVerification();
  }
}

// bool password
bool _obscurePassword = true;
bool _obscureConfirmPassword = true;

// bool load
bool _isLoading = false;

class AutismSignup extends StatefulWidget {
  final int? status;

  AutismSignup({Key? key, this.status}) : super(key: key);

  @override
  _AutismSignupState createState() => _AutismSignupState();
}

class _AutismSignupState extends State<AutismSignup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  Future<bool> registerUser(String email, String password, int? status) async {
    // Check if email is empty
    if (_emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("L'e-mail ne peut pas être vide."),
        ),
      );
      return Future.value(false);
    }
    // Check if email contains @
    if (!_emailController.text.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("L'e-mail doit contenir un '@'."),
        ),
      );
      return Future.value(false);
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print('User registered: ${userCredential.user}');
      sendVerificationEmail();

      // save status
      FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set({
        'status': status,
      });

      return Future.value(true);

    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'weak-password') {
        message = "Le mot de passe fourni est trop faible.";
      } else if (e.code == 'email-already-in-use') {
        message = "Le compte existe déjà pour cet e-mail.";
      } else if (e.code == 'invalid-email') {
        message = "L'e-mail fourni est invalide.";
      } else {
        message = "Une erreur s'est produite lors de l'inscription.";
      }
      print(message);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
      return Future.value(false);
    }
  }

  bool isValidPassword(String password) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(password);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    print(widget.status);
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
                  "S'inscrire",
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
                Container(
                  width: 300,
                  child: TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: ColorConstants.white,
                    ),
                    decoration: InputDecoration(
                        hintText: "E-mail",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        )
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: TextField(
                    obscureText: _obscurePassword,
                    controller: passwordController,
                    style: TextStyle(
                      color: ColorConstants.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      hintText: "Mot de passe",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility : Icons.visibility_off,
                          color: Colors.white,
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
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: TextField(
                    obscureText: _obscureConfirmPassword,
                    controller: confirmPasswordController,
                    style: TextStyle(
                      color: ColorConstants.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      hintText: "Confirmation du mot de passe",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // sign up button
          Container(
            width: 300,
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                print('Status before registerUser call: ${widget.status}');
                if (passwordController.text == confirmPasswordController.text) {
                  if (isValidPassword(passwordController.text)) {
                    // Le mot de passe est valide, continuer le processus d'inscription
                    try {
                      bool success = await registerUser(_emailController.text, passwordController.text, widget.status);
                      if (success) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => MailConfirm()),
                        );
                      } else {
                        // Gérer l'erreur ici
                      }
                    } catch (e) {
                      print("Erreur lors de l'inscription : $e");
                      // Gérer l'erreur ici
                    }
                  } else {
                    // Le mot de passe n'est pas conforme
                    final snackBar = SnackBar(content: Text('Le mot de passe doit contenir au moins une majuscule, une minuscule, un chiffre et un symbole.'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                } else {
                  // Les mots de passe ne correspondent pas
                  final snackBar = SnackBar(content: Text('Les mots de passe ne correspondent pas.'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: Text(
                "S'inscrire",
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

          // already have an account + sign in link
          Container(
            child: Column(
              children: [
                Text(
                  "Déjà un compte ?",
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
                          builder: (context) => Login()),
                    );
                  },
                  child: Text(
                    "Se connecter",
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