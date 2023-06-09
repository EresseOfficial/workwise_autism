import 'package:flutter/material.dart';
import '../../../../../widgets/color_constants.dart';
import '../../../../authentication.dart';
import '../signing_up/signup.dart';
import 'profile_customization.dart';
import 'hypersensitivity.dart';
import 'interest.dart';

import 'package:flutter_tags/flutter_tags.dart';

TextEditingController _customSkillController = TextEditingController();


class Skill extends StatefulWidget {
  final String uid;

  Skill({required this.uid});
  @override
  _SkillState createState() => _SkillState();
}

class _SkillState extends State<Skill> {
  List<String> _selectedSkills = [
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
  List<String> _chosenSkills = [];
  String? selectedItem = 'Informatique';

  @override
  void dispose() {
    _customSkillController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blueDark,
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

          // skill title
          Container(
            child: Column(
              children: [
                Text(
                  // justify text to center
                  "Mes ccompétences",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),

          // dropdown button
          Container(
            child: DropdownButton<String>(
              hint: Text('Sélectionnez une compétence'),
              value: null,
              items: _selectedSkills
                  .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item, style: TextStyle(fontSize: 24)),
              ))
                  .toList(),
              onChanged: (item) {
                if (item != null && !_chosenSkills.contains(item)) {
                  setState(() {
                    _chosenSkills.add(item);
                  });
                }
              },
            ),
          ),




          // custom skill input
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _customSkillController,
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    _chosenSkills.add(value);
                    _customSkillController.clear();
                  });
                }
              },
              decoration: InputDecoration(
                labelText: 'Ajouter une compétence personnalisée',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),


          // chosen skill hashtags
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Tags(
              itemCount: _chosenSkills.length,
              itemBuilder: (index) {
                return ItemTags(
                  index: index,
                  title: _chosenSkills[index],
                  combine: ItemTagsCombine.withTextBefore,
                  onPressed: (item) {
                    if (item != null) {
                      setState(() {
                        _chosenSkills.removeAt(item.index);
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
                      await updateUserSkills(widget.uid, _chosenSkills);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Interest(uid: widget.uid),
                        ),
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