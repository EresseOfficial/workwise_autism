import 'package:flutter/material.dart';
import '../../../../widgets/color_constants.dart';
import '../../../authentication.dart';
import '../../autism/signup/signing_up/signup.dart';
import 'profile.dart';

import 'search.dart' as autism_search;

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 0),

          // text accueil and chat icon
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        "Accueil",
                        style: TextStyle(
                          color: ColorConstants.blueDark,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.chat),
                        color: ColorConstants.blueDark,
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
              ],
            ),
            padding: EdgeInsets.only(left: 10, right: 10),
          ),
          SizedBox(height: 10),
          Container(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        "Correspondre aux autres personnes",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorConstants.blueDark,
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Pour afficher des posts sur votre fil d’actualités, commencez à correspondre aux autres personnes.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorConstants.blueDark,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 40,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(ColorConstants.blueLight),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ))),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => autism_search.Search(),
                              ),
                            );
                          },
                          child: Text(
                            "Rechercher",
                            style: TextStyle(
                              color: ColorConstants.blueDark,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),

          // navigation bar fixed at the bottom
          // with 5 icons: home, search, add post, notifications, profile (with profile picture)
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.home),
                        color: ColorConstants.blueDark,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.search),
                        color: ColorConstants.blueDark,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => autism_search.Search(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.add),
                        color: ColorConstants.blueDark,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.notifications),
                        color: ColorConstants.blueDark,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.person),
                        color: ColorConstants.blueDark,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Profile(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}