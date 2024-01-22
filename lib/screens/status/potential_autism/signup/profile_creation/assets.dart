import 'package:flutter/material.dart';
import 'package:workwise_autism/screens/status/potential_autism/signup/profile_creation/difficulties.dart';
import '../../../../../widgets/color_constants.dart';
import '../../../../authentication.dart';
import '../signing_up/signup.dart';
import 'profile_customization.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tags_x/flutter_tags_x.dart';

TextEditingController _customAssetsController = TextEditingController();

class Assets extends StatefulWidget {
  final String uid;

  Assets({required this.uid});
  @override
  _AssetsState createState() => _AssetsState();
}

class _AssetsState extends State<Assets> {
  List<String> _selectedAssets = [
    /*
    Liste des différents atouts qui est plus axée sur les intérets et les compétences :
     - Arts visuels (peinture, dessin, photographie, etc.)
     - Musique (jouer d'un instrument, composer, chanter, etc.)
     - Écriture et poésie
     - Programmation et développement de logiciels
     - Sciences (biologie, physique, chimie, etc.)
     - Mathématiques
     - Histoire et géographie
     - Langues étrangères
     - Jeux vidéo et conception de jeux
     - Artisanat et bricolage
     - Cuisine et pâtisserie
     - Jardinage et horticulture
     - Activités sportives et physiques
     - Théâtre et comédie
     - Lecture et littérature
     */
    'Arts visuels',
    'Musique',
    'Écriture et poésie',
    'Programmation et développement de logiciels',
    'Sciences',
    'Mathématiques',
    'Histoire et géographie',
    'Langues étrangères',
    'Jeux vidéo et conception de jeux',
    'Artisanat et bricolage',
    'Cuisine et pâtisserie',
    'Jardinage et horticulture',
    'Activités sportives et physiques',
    'Théâtre et comédie',
    'Lecture et littérature',
  ];
  List<String> _chosenAssets = [];
  String? selectedItem = 'Arts visuels';

  @override
  void dispose() {
    _customAssetsController.dispose();
    super.dispose();
  }

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

          // my assets and difficulties title
          Container(
            child: Column(
              children: [
                Text(
                  "Mes atouts",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),

          // dropdown button
          Container(
            child: DropdownButton<String>(
              hint: Text('Sélectionnez un atout'),
              value: null,
              items: _selectedAssets
                  .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item, style: TextStyle(fontSize: 24)),
              ))
                  .toList(),
              onChanged: (item) {
                if (item != null && !_chosenAssets.contains(item)) {
                  setState(() {
                    _chosenAssets.add(item);
                  });
                }
              },
            ),
          ),

          // custom assets imput
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _customAssetsController,
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    _chosenAssets.add(value);
                    _customAssetsController.clear();
                  });
                }
              },
              decoration: InputDecoration(
                labelText: 'Ajouter un atout personnalisé',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),

          // list of chosen assets
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Tags(
              itemCount: _chosenAssets.length,
              itemBuilder: (index) {
                return ItemTags(
                  index: index,
                  title: _chosenAssets[index],
                  combine: ItemTagsCombine.withTextBefore,
                  onPressed: (item) {
                    if (item != null) {
                      setState(() {
                        _chosenAssets.removeAt(item.index!);
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
                      await updateUserAssets(widget.uid, _chosenAssets);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => Difficulties(uid: FirebaseAuth.instance.currentUser!.uid)),
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