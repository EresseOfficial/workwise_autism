import 'package:flutter/material.dart';
import '../../../../../widgets/color_constants.dart';
import '../../../../authentication.dart';
import '../signing_up/signup.dart';
import 'profile_customization.dart';
import 'hypersensitivity.dart';
import 'package:flutter_tags_x/flutter_tags_x.dart';

TextEditingController _customInterestController = TextEditingController();


class Interest extends StatefulWidget {
  final String uid;

  Interest({required this.uid});
  @override
  _InterestState createState() => _InterestState();
}

class _InterestState extends State<Interest> {
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

          // interest title
          Container(
            child: Column(
              children: [
                Text(
                  // justify text to center
                  "Mes centres d'intérêts spécifiques",
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

          // interest input (autocomplete). Once the user has selected an interest, it is added to the list of chosen interests
          Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              } else {
                List<String> matches = <String>[];
                matches.addAll(_selectedInterests);

                matches.retainWhere((s) {
                  return s.toLowerCase().contains(textEditingValue.text.toLowerCase());
                });
                return matches;
              }
            },
            fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
              return TextField(
                controller: textEditingController,
                style: TextStyle(
                  color: ColorConstants.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                focusNode: focusNode,
                onSubmitted: (value) {
                  if (value != null && !_chosenInterests.contains(value)) {
                    setState(() {
                      _chosenInterests.add(value);
                    });
                  }
                },
              );
            },
            onSelected: (String selection) {
              if (selection != null && !_chosenInterests.contains(selection)) {
                setState(() {
                  _chosenInterests.add(selection);
                });
              }
            },
          ),

          SizedBox(height: 10),


          // chosen interests
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Tags(
              itemCount: _chosenInterests.length,
              itemBuilder: (index) {
                return ItemTags(
                  index: index,
                  title: _chosenInterests[index],
                  combine: ItemTagsCombine.withTextBefore,
                  onPressed: (item) {
                    if (item != null) {
                      setState(() {
                        _chosenInterests.removeAt(item.index!);
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
          SizedBox(height: 10),


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
                      await updateUserInterests(widget.uid, _chosenInterests);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => Hypersensitivity(uid: widget.uid),
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