import 'package:flutter/material.dart';
import '../../../../../widgets/color_constants.dart';
import '../../../../authentication.dart';
import '../signing_up/signup.dart';
import 'profile_customization.dart';
import 'autism_hypersensitivity.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_tags_x/flutter_tags_x.dart';

TextEditingController _customInterestController = TextEditingController();

class AutismInterest extends StatefulWidget {
  // uid of the user
  final String uid;

  AutismInterest({required this.uid});
  @override
  _AutismInterestState createState() => _AutismInterestState();
}

class _AutismInterestState extends State<AutismInterest> {
  // list of interests
  List<String> _selectedAutismInterests = [
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
  List<String> _chosenAutismInterests = [];
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
            child: Image.asset('assets/logos/logoApp.png'),
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

          Container(
            child: DropdownButton<String>(
              hint: Text('Sélectionnez un centre d\'intérêt'),
              value: null,
              items: _selectedAutismInterests
                  .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item, style: TextStyle(fontSize: 24)),
              ))
                  .toList(),
              onChanged: (item) {
                if (item != null && !_chosenAutismInterests.contains(item)) {
                  setState(() {
                    _chosenAutismInterests.add(item);
                  });
                }
              },
            ),
          ),




          // custom interest input
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _customInterestController,
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    _chosenAutismInterests.add(value);
                    _customInterestController.clear();
                  });
                }
              },
              decoration: InputDecoration(
                labelText: 'Ajouter un centre d\'intérêt personnalisé',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),


          // chosen interest hashtags
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Tags(
              itemCount: _chosenAutismInterests.length,
              itemBuilder: (index) {
                return ItemTags(
                  index: index,
                  title: _chosenAutismInterests[index],
                  combine: ItemTagsCombine.withTextBefore,
                  onPressed: (item) {
                    if (item != null) {
                      setState(() {
                        _chosenAutismInterests.removeAt(item.index!);
                      });
                    }
                  },
                  active: true,
                  textActiveColor: Colors.white,
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(8),
                );
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
                      await updateAutismInterests(widget.uid, _chosenAutismInterests);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => AutismHypersensitivity(uid: widget.uid)),
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