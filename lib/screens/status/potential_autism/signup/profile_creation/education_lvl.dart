import 'package:flutter/material.dart';
import '../../../../../widgets/color_constants.dart';
import '../../../../authentication.dart';
import '../signing_up/signup.dart';
import 'assets.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> saveUserEducationLvl(int educationLvl) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .update({'education_lvl': educationLvl});
  }
}

class EducationLvl extends StatefulWidget {
  @override
  _EducationLvlState createState() => _EducationLvlState();
}

int _selectedEducationLvl = 1;

class _EducationLvlState extends State<EducationLvl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blueLight,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 100),

          // logo app
          Container(
            alignment: Alignment.center,
            child: Image.asset('assets/logos/logoApp.png'),
            height: 160,
          ),
          SizedBox(height: 10),

          // education question title
          Container(
            child: Column(
              children: [
                Text(
                  "Quel est votre niveau de scolarité ?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),

          // 8 radio buttons with text
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: 1,
                      groupValue: _selectedEducationLvl,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedEducationLvl = value!;
                        });
                      },
                    ),
                    Text(
                      "Primaire",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: 2,
                      groupValue: _selectedEducationLvl,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedEducationLvl = value!;
                        });
                      },
                    ),
                    Text(
                      "Collège",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: 3,
                      groupValue: _selectedEducationLvl,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedEducationLvl = value!;
                        });
                      },
                    ),
                    Text(
                      "Lycée",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: 4,
                      groupValue: _selectedEducationLvl,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedEducationLvl = value!;
                        });
                      },
                    ),
                    Text(
                      "Bac +1",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: 5,
                      groupValue: _selectedEducationLvl,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedEducationLvl = value!;
                        });
                      },
                    ),
                    Text(
                      "Bac +2",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: 6,
                      groupValue: _selectedEducationLvl,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedEducationLvl = value!;
                        });
                      },
                    ),
                    Text(
                      "Bac +3",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: 7,
                      groupValue: _selectedEducationLvl,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedEducationLvl = value!;
                        });
                      },
                    ),
                    Text(
                      "Bac +4",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: 8,
                      groupValue: _selectedEducationLvl,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedEducationLvl = value!;
                        });
                      },
                    ),
                    Text(
                      "Bac +5 ou plus",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
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
                    onPressed: () async {
                      await saveUserEducationLvl(_selectedEducationLvl);
                      print("Niveau de scolarité sélectionné : $_selectedEducationLvl");
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => Assets(uid: FirebaseAuth.instance.currentUser!.uid)),
                      );
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