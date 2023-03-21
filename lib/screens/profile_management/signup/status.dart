import 'package:flutter/material.dart';
import '../../../../widgets/color_constants.dart';
import '../../authentication.dart';

import '../../status/autism/signup/signing_up/signup.dart' as autism_signup;
import '../../status/companies/signup/signing_up/company.dart' as job_company;
import '../../status/family/signup/signing_up/signup.dart' as family_signup;
import '../../status/maybe_with_autism/signup/signing_up/signup.dart' as maybe_with_autism;

class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blueDark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // iOS back button at the left top corner under the ios status bar
          Container(
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Authentication(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          SizedBox(height: 100),
          Container(
            alignment: Alignment.center,
            child: Image.asset('assets/logoApp.png'),
            height: 160,
          ),
          SizedBox(height: 10),
          Container(
            child: Column(
              children: [
                Text(
                  "Vous êtes une personne :",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          // 4 radio buttons with text
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      value: 1,
                      groupValue: 1,
                      onChanged: (value) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => autism_signup.Signup()),
                        );
                      },
                    ),
                    Text(
                      "Avec autisme",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      value: 2,
                      groupValue: 1,
                      onChanged: (value) {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => maybe_with_autism.Signup())
                        );
                      },
                    ),
                    Text(
                      "Peut-être avec autisme",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      value: 3,
                      groupValue: 1,
                      onChanged: (value) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => job_company.Company())
                        );
                      },
                    ),
                    Text(
                      "Recruteur d'entreprise",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      value: 4,
                      groupValue: 1,
                      onChanged: (value) {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => family_signup.Signup())
                        );
                      },
                    ),
                    Text(
                      "Famille",
                      textAlign: TextAlign.left,
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
                            builder: (context) => autism_signup.Signup()),
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
                      'Fermer',
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