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

Future<void> registerUser(String email, String password, int? status) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    print('User registered: ${userCredential.user}');
    sendVerificationEmail();

    // save status
    FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set({
      'status': status,
    });

  } on FirebaseAuthException catch (e) {
    print('Error: $e');
  }
}


// bool password
bool _obscurePassword = true;
bool _obscureConfirmPassword = true;

// bool load
bool _isLoading = false;

class Signup extends StatefulWidget {
  final int? status;

  Signup({Key? key, this.status}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
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
              onPressed: () {
                print('Status before registerUser call: ${widget.status}');
                if (passwordController.text == confirmPasswordController.text) {
                  registerUser(_emailController.text, passwordController.text, widget.status);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => MailConfirm()),
                  );
                } else {
                  // Afficher un message d'erreur pour informer l'utilisateur que les mots de passe ne correspondent pas
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