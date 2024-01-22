import 'package:flutter/material.dart';
import 'package:workwise_autism/screens/status/family/signup/profile_creation/autism_full_name.dart';
import '../signing_up/signup.dart';
import '../../../../../widgets/color_constants.dart';
import '../../../../profile_management/signup/status.dart';
import 'certificate.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

String? _currentAutismLink;

List<String> _autismLinkOptions = [
  "Parent",
  "Frère ou soeur",
  "Autre membre de la famille",
  "Ami",
  "Professionnel",
  "Autre"
];

Future<void> updateAutismLink(String? autismLink) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null && autismLink != null) {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .update({'autism_link': autismLink});
  }
}

class AutismLink extends StatefulWidget {
  @override
  _AutismLinkState createState() => _AutismLinkState();
}

class _AutismLinkState extends State<AutismLink> {
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

          // link with autism title
          Container(
            child: Column(
              children: [
                Text(
                  "Quel est votre lien avec l’autisme ?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),

          // dropdown menu
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: DropdownButton<String>(
              isExpanded: true,
              value: _currentAutismLink,
              hint: Text("Sélectionnez votre lien"),
              items: _autismLinkOptions.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _currentAutismLink = newValue;
                });
              },
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
                      await updateAutismLink(_currentAutismLink);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => AutismFullname()),
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
                        backgroundColor: MaterialStateProperty.all<Color>(ColorConstants.greyDark),
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