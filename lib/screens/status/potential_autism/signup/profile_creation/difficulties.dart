import 'package:flutter/material.dart';
import '../../../../../widgets/color_constants.dart';
import '../../../../authentication.dart';
import '../signing_up/signup.dart';
import 'profile_customization.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tags_x/flutter_tags_x.dart';

TextEditingController _customDifficultiesController = TextEditingController();

class Difficulties extends StatefulWidget {
  final String uid;

  Difficulties({required this.uid});
  @override
  _DifficultiesState createState() => _DifficultiesState();
}

class _DifficultiesState extends State<Difficulties> {
  List<String> _selectedDifficulties = [
    /*
    Liste de différentes difficultés :
    - Communication verbale et non verbale
    - Compréhension des expressions et du langage corporel
    - Interactions et relations sociales
    - Sensibilité sensorielle
    - Adaptation aux changements
    - Compréhension des normes sociales
    - Organisation et planification
    - Concentration et attention
    - Rigidité dans les pensées et comportements
    - Comportements répétitifs
    - Régulation émotionnelle
    - Compréhension des nuances et second degré
     */

    'Communication verbale et non verbale',
    'Compréhension des expressions et du langage corporel',
    'Interactions et relations sociales',
    'Sensibilité sensorielle',
    'Adaptation aux changements',
    'Compréhension des normes sociales',
    'Organisation et planification',
    'Concentration et attention',
    'Rigidité dans les pensées et comportements',
    'Comportements répétitifs',
    'Régulation émotionnelle',
    'Compréhension des nuances et second degré',
  ];
  List<String> _chosenDifficulties = [];
  String? selectedItem = 'Communication verbale et non verbale';

  @override
  void dispose() {
    _customDifficultiesController.dispose();
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

          // my difficulties title
          Container(
            child: Column(
              children: [
                Text(
                  "Mes difficultés",
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
              hint: Text('Sélectionnez une dificulté'),
              value: null,
              items: _selectedDifficulties
                  .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item, style: TextStyle(fontSize: 24)),
              ))
                  .toList(),
              onChanged: (item) {
                if (item != null && !_chosenDifficulties.contains(item)) {
                  setState(() {
                    _chosenDifficulties.add(item);
                  });
                }
              },
            ),
          ),

          // custom difficulties imput
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _customDifficultiesController,
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    _chosenDifficulties.add(value);
                    _customDifficultiesController.clear();
                  });
                }
              },
              decoration: InputDecoration(
                labelText: 'Ajouter une difficulté personnalisé',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),

          // list of chosen difficulties
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Tags(
              itemCount: _chosenDifficulties.length,
              itemBuilder: (index) {
                return ItemTags(
                  index: index,
                  title: _chosenDifficulties[index],
                  combine: ItemTagsCombine.withTextBefore,
                  onPressed: (item) {
                    if (item != null) {
                      setState(() {
                        _chosenDifficulties.removeAt(item.index!);
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
                      await updateUserDifficulties(widget.uid, _chosenDifficulties);
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