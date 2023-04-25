import 'package:flutter/material.dart';
import '../../../../../widgets/color_constants.dart';
import '../../../../authentication.dart';
import '../signing_up/signup.dart';
import 'profile_customization.dart';
// import 'hypersensivity.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_tags/flutter_tags.dart';

TextEditingController _customInterestController = TextEditingController();

class AutismInterest extends StatefulWidget {
  final String uid;

  AutismInterest({required this.uid});
  @override
  _AutismInterestState createState() => _AutismInterestState();
}

class _AutismInterestState extends State<AutismInterest> {
  List<String> _selectedInterests = [
    'Informatique',
    'Musique',
    'Comptabilité',
    'Jeux vidéo',
    'Cinéma et télevision',
    'Lecture / Littérature',
    'Arts plastiques',
    'Photographie',
    'Théâtre / Comédie',
    'Danse',
    'Cuisine / Pâtisserie',
    'Sports',
    'Activités de plein air',
    'Voyages / Tourisme',
    'Animaux / Soins aux animaux',
    'Jardinage / Horticulture',
    'Bricolage / Travaux manuels',
    'Mode / Beauté',
    'Histoire',
    'Sciences',
    'Langues étrangères',
    'Méditation / Yoga',
    'Collections (timbres, pièces...)',
    'Jeux de société / Cartes',
    'Podcasts / Radio',
    'Écriture (poésie, romans...)'
  ];
  List<String> _chosenInterests = [];
  String? selectedItem = 'Informatique';

  @override
  void dispose() {
    _customInterestController.dispose();
    super.dispose();
  }

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
            child: Image.asset('assets/logoApp.png'),
            height: 160,
          ),
          SizedBox(height: 10),

          // interest title
          Container(
            child: Column(
              children: [
                Text(
                  "Ses centres d'intérêts spécifiques",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),

          // dropdown button
          Container(

          ),

          // interest hashtags
          Container(

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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ProfileCustomization()),
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