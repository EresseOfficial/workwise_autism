import 'package:flutter/material.dart';
import '../../../../profile_management/login/login.dart';
import 'mail_confirm.dart';
import '../../../../../widgets/color_constants.dart';
import '../../../../profile_management/signup/status.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

class FamilySignup extends StatefulWidget {
  final int? status;

  FamilySignup({Key? key, this.status}) : super(key: key);

  @override
  _FamilySignupState createState() => _FamilySignupState();
}

class _FamilySignupState extends State<FamilySignup> {
  bool _isLoading = false;
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

  @override
  Widget build(BuildContext context) {
    print(widget.status);
    return Scaffold(
      backgroundColor: ColorConstants.yellow,
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
                    color: Colors.black,
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
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "E-mail",
                      hintStyle: TextStyle(
                        color: Colors.black,
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
                    decoration: InputDecoration(
                        hintText: "Mot de passe",
                        hintStyle: TextStyle(
                          color: Colors.black,
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
                    decoration: InputDecoration(
                      hintText: "Confirmation du mot de passe",
                      hintStyle: TextStyle(
                        color: Colors.black,
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
                  try {
                    bool success = await registerUser(_emailController.text, passwordController.text, widget.status);
                    if (success) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => MailConfirm()),
                      );
                    } else {
                      // Handle the error here
                    }
                  } catch (e) {
                    print("Erreur lors de l'inscription : $e");
                    // Handle the error (if any) here
                  }
                } else {
                  // Passwords do not match
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
                    color: Colors.black,
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
                      color: Colors.black,
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