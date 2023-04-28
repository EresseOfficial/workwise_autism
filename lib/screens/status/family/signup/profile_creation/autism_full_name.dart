import 'package:flutter/material.dart';
import '../signing_up/signup.dart';
import '../../../../../widgets/color_constants.dart';
import '../../../../profile_management/signup/status.dart';
import 'autism_link.dart';
import 'autism_gender.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> saveAutismPersonInfo(String firstName, String lastName) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    await FirebaseFirestore.instance
        .collection('autism_people')
        .doc(user.uid)
        .collection('under_18')
        .doc(user.uid)
        .set({
      'first_name': firstName,
      'last_name': lastName,
    }, SetOptions(merge: true));
  }
}


class AutismFullname extends StatefulWidget {
  @override
  _AutismFullnameState createState() => _AutismFullnameState();
}

class _AutismFullnameState extends State<AutismFullname> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  "Comment la personne s'appelle t-elle ?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),

          // first and last name fields
          Container(
            child: Column(
              children: [
                Container(
                  width: 300,
                  child: TextField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                        hintText: "Nom",
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
                    controller: _firstNameController,
                    decoration: InputDecoration(
                        hintText: "Prénom",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),

          // next button
          Container(
            width: 300,
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                await saveAutismPersonInfo(
                    _firstNameController.text, _lastNameController.text);
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => AutismGender()),
                );
              },
              child: Text(
                "Suivant",
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
        ],
      ),
    );
  }
}