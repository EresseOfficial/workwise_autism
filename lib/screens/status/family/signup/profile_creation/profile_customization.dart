import 'package:flutter/material.dart';
import '../../../../../widgets/color_constants.dart';
import '../../../../authentication.dart';
import '../signing_up/signup.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

import 'package:flutter/foundation.dart';

class ProfileCustomization extends StatefulWidget {
  @override
  _ProfileCustomizationState createState() => _ProfileCustomizationState();
}

class _ProfileCustomizationState extends State<ProfileCustomization> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.yellow,
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
                          color: Colors.white,
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
                        backgroundColor: MaterialStateProperty.all<Color>(ColorConstants.blueDark),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Colors.white)
                          ),
                        )
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Précédent',
                      style: TextStyle(fontSize: 20, color: Colors.white),
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