import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../widgets/color_constants.dart';
import 'profile_management/signup/status.dart';
import 'profile_management/login/login.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

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



                  // Container(
                  //   height: 55,
                  //   width: 260,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(50),
                  //     color: Colors.white,
                  //   ),
                  //   child: Center(
                  //     child: Text(
                  //       "Sign Up",
                  //       style: TextStyle(
                  //         color: ColorConstants.blueDark,
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.w700,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 20),
                  // Container(
                  //   height: 55,
                  //   width: 260,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(50),
                  //     border: Border.all(
                  //       color: Colors.white,
                  //       width: 2,
                  //     ),
                  //   ),
                  //   child: Center(
                  //     child: Text(
                  //       "Log In",
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.w700,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 20),
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
                        Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              "G",
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