import 'package:flutter/material.dart';
import '../../../../../widgets/color_constants.dart';
import '../../../../authentication.dart';
import '../signing_up/signup.dart';
import 'autism_interest.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> saveAutismPersonEducationLvl(int educationLvl) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    await FirebaseFirestore.instance
        .collection('autism_people')
        .doc(user.uid)
        .collection('under_18')
        .doc(user.uid)
        .update({'education_lvl': educationLvl});
  }
}

class AutismEducationLvl extends StatefulWidget {
  @override
  _AutismEducationLvlState createState() => _AutismEducationLvlState();
}

int _selectedEducationLvl = 1;

class _AutismEducationLvlState extends State<AutismEducationLvl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.yellow,
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
                  "Quel est son niveau de scolarité ?",
                  style: TextStyle(
                    color: Colors.white,
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
                        color: Colors.white,
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
                        color: Colors.white,
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
                        color: Colors.white,
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
                        color: Colors.white,
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
                        color: Colors.white,
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
                        color: Colors.white,
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
                        color: Colors.white,
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
                        color: Colors.white,
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
                      await saveAutismPersonEducationLvl(_selectedEducationLvl);
                      print("Niveau de scolarité sélectionné : $_selectedEducationLvl");
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => AutismInterest(uid: FirebaseAuth.instance.currentUser!.uid)),
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