import 'package:flutter/material.dart';
import '../../../../../widgets/color_constants.dart';
import '../../../../authentication.dart';
import '../signing_up/signup.dart';
import 'education_lvl.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateUserBirthDate(DateTime birthDate) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .update({'birthDate' : birthDate});
  }
}

Future<int> getUserAge() async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    try {
      DocumentSnapshot userData = await users.doc(user.uid).get();
      DateTime birthDate = (userData['birthDate'] as Timestamp).toDate();
      final now = DateTime.now();
      int years = now.year - birthDate.year;
      if (birthDate.month > now.month || (birthDate.month == now.month && birthDate.day > now.day)) {
        years--;
      }
      return years;
    } catch (e) {
      print('Error getting user age: $e');
    }
  }
  throw Exception('No user logged in');
}


class BirthDate extends StatefulWidget {
  @override
  _BirthDateState createState() => _BirthDateState();
}

class _BirthDateState extends State<BirthDate> {
  DateTime? selectedDate;

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
            child: Image.asset('assets/logos/logoApp.png'),
            height: 160,
          ),
          SizedBox(height: 10),

          // birthdate title
          Container(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        "Votre date de naissance :",
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
                      Text(
                        "Seul l'âge sera communiqué",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),



          // birthdate scroller
          Container(
            child: Column(
              children: [
                Container(
                  child: Text(
                    selectedDate == null ? 'Aucune date sélectionnée' : 'Date sélectionnée: ${selectedDate.toString()}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null && pickedDate != selectedDate) {
                      setState(() {
                        selectedDate = pickedDate;
                      });
                    }
                  },
                  child: Text(
                      'Choisir',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black
                      )
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                ),
              ],
            ),
          ),


          // next and back buttons
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
                      if (selectedDate != null) {
                        updateUserBirthDate(selectedDate!);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => EducationLvl()),
                        );
                      }
                    },
                    child: const Text(
                      'Suivant',
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