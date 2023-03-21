import 'package:flutter/material.dart';
import '../../../../../widgets/color_constants.dart';
import '../../../../authentication.dart';
import '../signing_up/signup.dart';

class ProfileCustomization extends StatefulWidget {
  @override
  _ProfileCustomizationState createState() => _ProfileCustomizationState();
}

class _ProfileCustomizationState extends State<ProfileCustomization> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blueLight,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 100),

          // logo profile (TO CHANGE)
          Container(
            alignment: Alignment.center,
            child: Image.asset('assets/logoApp.png'),
            height: 160,
          ),
          SizedBox(height: 10),

          // profile title
          Container(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        "Personnalisez votre profil",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // add picture button
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

                          // popup to change profile picture (TO CHANGE)
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => Signup()),
                            );
                          },
                          child: const Text(
                            'Ajouter une photo',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // biography field (implement framework)
                Container(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Biographie (facultatif)",
                      hintStyle: TextStyle(
                        color: Colors.black,
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

          // next and back buttons
          Container(
            child: Column(
              children: [
                // SizedBox(
                //   width: 200,
                //   height: 40,
                //   child: ElevatedButton(
                //     style: ButtonStyle(
                //         backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //             RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(20),
                //                 side: BorderSide(color: Colors.white)
                //             )
                //         )
                //     ),
                //
                //     // redirection to Homepage after signup (TO CHANGE)
                //     onPressed: () {
                //       Navigator.of(context).push(
                //         MaterialPageRoute(
                //             builder: (context) => Home()),
                //       );
                //     },
                //     child: const Text(
                //       'Terminer',
                //       style: TextStyle(fontSize: 20, color: Colors.black),
                //     ),
                //   ),
                // ),
                SizedBox(height: 18),


                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(ColorConstants.blueLight),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Colors.black)
                          ),
                        )
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Précédent',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}