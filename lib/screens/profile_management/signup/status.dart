import 'package:flutter/material.dart';
import '../../../../widgets/color_constants.dart';
import '../../authentication.dart';

import '../../status/autism/signup/signing_up/signup.dart';
import '../../status/companies/signup/signing_up/signup.dart';
import '../../status/companies/signup/signing_up/company.dart';
import '../../status/family/signup/signing_up/signup.dart' as family_signup;
import '../../status/potential_autism/signup/signing_up/signup.dart' as potential_autism;


class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  int? _selectedStatus;
  int? _selectedAgeGroup;

  void _setStatus(int value) {
    setState(() {
      _selectedStatus = value;
    });
  }

  void _navigateToNextPage(BuildContext context) {
    Widget nextPage = Container();

    switch (_selectedStatus) {
      case 1:
        nextPage = AutismSignup(status: _selectedStatus);
        break;
    }
    // switch (_selectedStatus) {
    //   case 2:
    //     nextPage = potential_autism.Signup(status: _selectedStatus);
    //     break;
    // }
    switch (_selectedStatus) {
      case 3:
        nextPage = CompanySignup(status: _selectedStatus);
        break;
    }
    // switch (_selectedStatus) {
    //   case 4:
    //     nextPage = family_signup.Signup(status: _selectedStatus);
    //     break;
    // }

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => nextPage),
    );
  }

  void _showDisabledFeatureMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Cette fonctionnalité est en cours de développement."),
        duration: Duration(seconds: 2),
      ),
    );
  }

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
            child: Image.asset('assets/logos/logoApp.png'),
            height: 160,
          ),
          SizedBox(height: 10),
          Container(
            child: Column(
              children: [
                Text(
                  "Vous êtes :",
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
                      groupValue: _selectedStatus,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedStatus = value;
                        });
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
                Visibility(
                  visible: _selectedStatus == 1,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Radio(
                          value: 1, // Valeur pour Majeur
                          groupValue: _selectedAgeGroup,
                          onChanged: (int? value) {
                            setState(() {
                              _selectedAgeGroup = value;
                            });
                          },
                        ),
                        title: Text("Majeur : 18 ans et +", style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        leading: Radio(
                          value: 2, // Valeur pour Mineur
                          groupValue: _selectedAgeGroup,
                          onChanged: (int? value) {
                            setState(() {
                              _selectedAgeGroup = value;
                            });
                          },
                        ),
                        title: Text("Mineur : Moins de 18 ans", style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Radio(
                    //   value: 2,
                    //   groupValue: _selectedStatus,
                    //   onChanged: (int? value) {
                    //     setState(() {
                    //       _selectedStatus = value;
                    //     });
                    //   },
                    // ),
                    // Text(
                    //   "Peut-être avec autisme",
                    //   textAlign: TextAlign.left,
                    //   style: TextStyle(
                    //     color: Colors.white.withOpacity(0.5),
                    //     fontSize: 20,
                    //     fontWeight: FontWeight.w700,
                    //   ),
                    // ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      value: 3,
                      groupValue: _selectedStatus,
                      onChanged: (int? value) {
                        // _showDisabledFeatureMessage();
                        setState(() {
                          _selectedStatus = value;
                        });
                      },
                    ),
                    Text(
                      "Recruteur d'entreprise",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white, // Grisé pour indiquer l'inactivité
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Radio(
                    //   value: 4,
                    //   groupValue: _selectedStatus,
                    //   onChanged: (int? value) {
                    //     _showDisabledFeatureMessage();
                    //   },
                    // ),
                    // Text(
                    //   "Famille",
                    //   textAlign: TextAlign.left,
                    //   style: TextStyle(
                    //     color: Colors.white.withOpacity(0.5), // Grisé pour indiquer l'inactivité
                    //     fontSize: 20,
                    //     fontWeight: FontWeight.w700,
                    //   ),
                    // ),
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
                      if (_selectedStatus != null) {
                        _navigateToNextPage(context);
                      }
                    },

                    /* BACKUP CODE (if new one doesn't work)
                    onPressed: () {
                      if (_selectedStatus != null) {
                        switch (_selectedStatus) {
                          case 1:
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => autism_signup.Signup(),
                            ));
                            break;
                          case 2:
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => potential_autism.Signup(),
                            ));
                            break;
                          // case 3:
                          //   Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => job_company.Company(),
                          //   ));
                          //   break;
                          case 4:
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => family_signup.Signup(),
                            ));
                            break;
                          default:
                            break;
                        }
                      }
                    },
                    */
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