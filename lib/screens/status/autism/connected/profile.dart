import 'package:flutter/material.dart';
import '../../../../widgets/color_constants.dart';
import '../../../authentication.dart';

// importing user details
import '../signup/profile_creation/full_name.dart';
import '../signup/profile_creation/birthdate.dart';

import 'homepage.dart';
import 'search.dart' as autism_search;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 0),
          // title and chat icon
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        "Profile",
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

          // profile logo with details include: full name, age, location and country, spoken languages
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        // backgroundImage
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // full name
                          FutureBuilder(
                            future: getUserProfileData(),
                            builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.connectionState == ConnectionState.done) {
                                String firstName = snapshot.data!['firstName'] ?? '';
                                String lastName = snapshot.data!['lastName'] ?? '';
                                return Text(
                                  '$firstName $lastName',
                                  style: TextStyle(
                                    color: ColorConstants.blueDark,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                  ),
                                );
                              } else if (snapshot.connectionState == ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Erreur : ${snapshot.error}');
                              } else {
                                return Text('No data');
                              }
                            },
                          ),
                          FutureBuilder(
                            future: getUserAge(),
                            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                              if (snapshot.connectionState == ConnectionState.done) {
                                int age = snapshot.data!;
                                return Text(
                                  'Age: $age',
                                  style: TextStyle(
                                    color: ColorConstants.blueDark,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                );
                              } else if (snapshot.connectionState == ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Erreur : ${snapshot.error}');
                              } else {
                                return Text('No data');
                              }
                            },
                          ),

                          Text(
                            "Location: London, UK",
                            style: TextStyle(
                              color: ColorConstants.blueDark,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Spoken languages: English, French",
                            style: TextStyle(
                              color: ColorConstants.blueDark,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            padding: EdgeInsets.only(left: 10, right: 10),
          ),

          // button: modifier profile
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    children: [
                      ElevatedButton(
                        child: Text("Modifier profile"),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            padding: EdgeInsets.only(left: 10, right: 10),
          ),
          // details section: Centre d'intérêts spécifiques, compétences, niveau d'études, permis
          // in a blueLight box
          Container(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: 350,
                        decoration: BoxDecoration(
                          color: ColorConstants.blueLight,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Compétences",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // title "Posts"
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        "Posts",
                        style: TextStyle(
                          color: ColorConstants.blueDark,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            padding: EdgeInsets.only(left: 10, right: 10),
          ),

          // posts into an album
          // each album is a blueLight box with a title and a picture (3 columns)
          // when clicking on an album, it opens a new page with multiple posts stored to the album
          // each post is a blueLight box with a picture.
          Container(
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: ColorConstants.blueLight,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: ColorConstants.blueLight,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: ColorConstants.blueLight,
                    borderRadius: BorderRadius.circular(10),
                  ),
                )
              ],
            ),
            padding: EdgeInsets.only(left: 20, right: 20),

          ),
          SizedBox(height: 20),


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
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Homepage(),
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