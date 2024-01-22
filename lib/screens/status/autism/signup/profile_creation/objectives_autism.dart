import 'package:flutter/material.dart';
import 'package:workwise_autism/screens/status/autism/signup/profile_creation/company_qualities.dart';
import '../../../../../widgets/color_constants.dart';
import 'package:workwise_autism/widgets/custom_buttons.dart';

import '../../../../authentication.dart';
import '../signing_up/signup.dart';
import 'hypersensitivity.dart';
import 'interest.dart';
import 'package:flutter_tags_x/flutter_tags_x.dart';

class ObjectiveAutism extends StatefulWidget {

  @override
  _ObjectiveAutismState createState() => _ObjectiveAutismState();
}

class _ObjectiveAutismState extends State<ObjectiveAutism> {
  bool _searchSocialLinks = false;
  bool _searchProfessionalOpportunities = false;
  bool _searchBoth = false;

  @override
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

          // objective question title
          Container(
            child: Column(
              children: [
                Text(
                  // justify text to center
                  "Vos objectifs sur Workwise Autism",
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

          // objective checkboxes
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text("Recherche de liens sociaux", style: TextStyle(color: Colors.white)),
            subtitle: Text(
              "Cochez cette option si vous cherchez à établir des liens avec d'autres personnes ayant des profils similaires ou partageant des centres d'intérêt communs.",
              style: TextStyle(color: Colors.white70),
            ),
            value: _searchSocialLinks,
            checkColor: Colors.blue,
            activeColor: Colors.white,
            onChanged: (bool? value) {
              setState(() {
                _searchSocialLinks = value!;
              });
            },
          ),

          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text("Recherche d'opportunités professionnelles", style: TextStyle(color: Colors.white)),
            subtitle: Text(
              "Cochez cette option si vous êtes à la recherche d'opportunités d'emploi et souhaitez être mis en relation avec des entreprises.",
              style: TextStyle(color: Colors.white70),
            ),
            value: _searchProfessionalOpportunities,
            checkColor: Colors.blue,
            activeColor: Colors.white,
            onChanged: (bool? value) {
              setState(() {
                _searchProfessionalOpportunities = value!;
              });
            },
          ),

          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text("Recherche de liens sociaux et professionnels", style: TextStyle(color: Colors.white)),
            subtitle: Text(
              "Cochez cette option si vous souhaitez à la fois établir des liens sociaux et explorer des opportunités professionnelles.",
              style: TextStyle(color: Colors.white70),
            ),
            value: _searchBoth,
            checkColor: Colors.blue,
            activeColor: Colors.white,
            onChanged: (bool? value) {
              setState(() {
                _searchBoth = value!;
              });
            },
          ),

          // next button
          CustomButtons.nextButton(context, CompanyQualities()),

          // back button
          CustomButtons.backButton(context),
        ],
      )
    );
  }
}