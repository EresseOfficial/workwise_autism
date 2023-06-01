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

// get user interests from firestore
Future<List<String>> getUserInterests() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = auth.currentUser;
  final uid = user!.uid;

  List<String> interests = [];

  await FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      interests = List.from(documentSnapshot.get('interests'));
    }
  });

  return interests;
}

// get user skills from firestore
Future<List<String>> getUserSkills() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = auth.currentUser;
  final uid = user!.uid;

  List<String> skills = [];

  await FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      skills = List.from(documentSnapshot.get('skills'));
    }
  });

  return skills;
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
                FutureBuilder(
                    future: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).get(),
                    builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasData) {
                        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                        return Container(
                          child: Row(
                            children: [
                              // CircleAvatar(
                              //   radius: 50,
                              //   backgroundImage: NetworkImage(data['profile_picture']),
                              // ),
                            ],
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }
                ),
                SizedBox(width: 15),

                // user details
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // get full name from firestore
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
                                fontSize: 22,
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

                      // get user age from firestore
                      FutureBuilder(
                        future: getUserAge(),
                        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            int age = snapshot.data!;
                            return Text(
                              'Age : $age',
                              style: TextStyle(
                                color: ColorConstants.blueDark,
                                fontSize: 14,
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

                      // get user location from firestore (city, country)
                      Text(
                        "France",
                        style: TextStyle(
                          color: ColorConstants.blueDark,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      // get user spoken languages from firestore
                      Text(
                        "Langues parlées : Français, Anglais",
                        style: TextStyle(
                          color: ColorConstants.blueDark,
                          fontSize: 14,
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

          // buttons: modifier profile, partager, chat
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        color: ColorConstants.blueDark,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Authentication(),
                            ),
                          );
                        },
                      ),
                      Text(
                        "Modifier",
                        style: TextStyle(
                          color: ColorConstants.blueDark,
                          fontSize: 14,
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
                        icon: Icon(Icons.share),
                        color: ColorConstants.blueDark,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Authentication(),
                            ),
                          );
                        },
                      ),
                      Text(
                        "Partager",
                        style: TextStyle(
                          color: ColorConstants.blueDark,
                          fontSize: 14,
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
                      Text(
                        "Chat",
                        style: TextStyle(
                          color: ColorConstants.blueDark,
                          fontSize: 14,
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
                        child: Column(
                          children: [
                            Text(
                              // textAlign: TextAlign.left,
                              "Centres d'intérêts spécifiques",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            // list of interests from firestore
                            FutureBuilder(
                              future: getUserInterests(),
                              builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
                                if (snapshot.connectionState == ConnectionState.done) {
                                  List<String> interests = snapshot.data!;
                                  return Container(
                                    child: Wrap(
                                      children: [
                                        for (var interest in interests)
                                          Container(
                                            child: Text(
                                              interest,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            padding: EdgeInsets.all(5),
                                          ),
                                      ],
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
                            SizedBox(height: 10),
                            Text(
                              // textAlign: TextAlign.left,
                              "Compétences",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            // list of skills from firestore
                            // FutureBuilder(
                            //   future: getUserSkills(),
                            //   builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
                            //     if (snapshot.connectionState == ConnectionState.done) {
                            //       List<String> skills = snapshot.data!;
                            //       return Container(
                            //         child: Wrap(
                            //           children: [
                            //             for (var skill in skills)
                            //               Container(
                            //                 child: Text(
                            //                   skill,
                            //                   style: TextStyle(
                            //                     fontSize: 14,
                            //                     fontWeight: FontWeight.w400,
                            //                   ),
                            //                 ),
                            //                 padding: EdgeInsets.all(5),
                            //               ),
                            //           ],
                            //         ),
                            //       );
                            //     } else if (snapshot.connectionState == ConnectionState.waiting) {
                            //       return CircularProgressIndicator();
                            //     } else if (snapshot.hasError) {
                            //       return Text('Erreur : ${snapshot.error}');
                            //     } else {
                            //       return Text('No data');
                            //     }
                            //   },
                            // ),

                            Text(
                              textAlign: TextAlign.left,
                              "Niveau d'études",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )
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