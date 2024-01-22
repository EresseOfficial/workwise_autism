import 'package:flutter/material.dart';
import '../../../../../widgets/color_constants.dart';
import '../../../../authentication.dart';
import '../signing_up/signup.dart';
import 'profile_customization.dart';

import 'package:flutter_tags_x/flutter_tags_x.dart';

TextEditingController _customAutismHypersensitivityController = TextEditingController();


class AutismHypersensitivity extends StatefulWidget {
  final String uid;

  AutismHypersensitivity({required this.uid});
  @override
  _AutismHypersensitivityState createState() => _AutismHypersensitivityState();
}

class _AutismHypersensitivityState extends State<AutismHypersensitivity> {
  List<String> _selectedAutismHypersensitivities = [
    'Hypersensibilité auditive',
    'Hypersensibilité vestibulaire',
    'Hypersensibilité proprioceptive',
    'Hypersensibilité tactile',
    'Hypersensibilité gustative',
    'Hypersensibilité visuelle',
    'Je ne sais pas'
  ];
  List<String> _chosenAutismHypersensitivities = [];
  String? selectedItem = 'Informatique';

  @override
  void dispose() {
    _customAutismHypersensitivityController.dispose();
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

          // hypersensitivity title
          Container(
            child: Column(
              children: [
                Text(
                  // justify text to center
                  "Mes hypersensibilités",
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
              hint: Text('Sélectionnez une hypersensibilité'),
              value: null,
              items: _selectedAutismHypersensitivities
                  .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item, style: TextStyle(fontSize: 24)),
              ))
                  .toList(),
              onChanged: (item) {
                if (item != null && !_chosenAutismHypersensitivities.contains(item)) {
                  setState(() {
                    _chosenAutismHypersensitivities.add(item);
                  });
                }
              },
            ),
          ),




          // custom hypersensitivity input
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _customAutismHypersensitivityController,
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    _chosenAutismHypersensitivities.add(value);
                    _customAutismHypersensitivityController.clear();
                  });
                }
              },
              decoration: InputDecoration(
                labelText: 'Ajouter une hypersensibilité personnalisée',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),


          // chosen hypersensitivity hashtags
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Tags(
              itemCount: _chosenAutismHypersensitivities.length,
              itemBuilder: (index) {
                return ItemTags(
                  index: index,
                  title: _chosenAutismHypersensitivities[index],
                  combine: ItemTagsCombine.withTextBefore,
                  onPressed: (item) {
                    if (item != null) {
                      setState(() {
                        _chosenAutismHypersensitivities.removeAt(item.index!);
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
                      await updateAutismHypersensitivities(widget.uid, _chosenAutismHypersensitivities);
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