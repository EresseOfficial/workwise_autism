import 'package:flutter/material.dart';
import '../signing_up/signup.dart';
import '../../../../../widgets/color_constants.dart';
import '../../../../profile_management/signup/status.dart';
import 'gender.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final TextEditingController firstNameController = TextEditingController();
final TextEditingController lastNameController = TextEditingController();


Future<void> saveFullName(String lastName, String firstName) async {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    try {
      await users.doc(user.uid).set({
        'lastName': lastName,
        'firstName': firstName,
      }, SetOptions(merge: true));
      print('Full name saved: $lastName $firstName');
    } catch (e) {
      print('Error saving full name: $e');
    }
  }
}

Future<DocumentSnapshot> getUserProfileData() async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    try {
      DocumentSnapshot userData = await users.doc(user.uid).get();
      return userData;
    } catch (e) {
      print('Error getting user profile data: $e');
    }
  }
  throw Exception('No user logged in');
}



final TextEditingController _lastNameController = TextEditingController();
final TextEditingController _firstNameController = TextEditingController();



class Fullname extends StatefulWidget {
  @override
  _FullnameState createState() => _FullnameState();
}

class _FullnameState extends State<Fullname> {
  @override
  void initState() {
    super.initState();
    _getUserFullName();
  }
  Future<void> _getUserFullName() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      CollectionReference users = FirebaseFirestore.instance.collection('users');
      try {
        DocumentSnapshot userData = await users.doc(user.uid).get();
        setState(() {
          _lastNameController.text = userData['lastName'] ?? '';
          _firstNameController.text = userData['firstName'] ?? '';
        });
      } catch (e) {
        print('Error getting user full name: $e');
      }
    }
  }

  Widget build(BuildContext context) {
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
                  "Comment vous appelez-vous ?",
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
                    style: TextStyle(
                      color: ColorConstants.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
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
                    style: TextStyle(
                      color: ColorConstants.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
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
              onPressed: () {
                saveFullName(_lastNameController.text, _firstNameController.text);
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => Gender()),
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