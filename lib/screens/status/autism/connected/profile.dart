import 'package:flutter/material.dart';

import 'package:workwise_autism/screens/status/autism/connected/chat/chat_menu.dart';
import 'package:workwise_autism/screens/status/autism/connected/create_post/create_post.dart';
import 'package:workwise_autism/screens/status/autism/connected/profile_settings/main_settings.dart';
import '../../../../widgets/color_constants.dart';
import '../../../authentication.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

// importing user details
import '../signup/profile_creation/full_name.dart';
import '../signup/profile_creation/birthdate.dart';

import 'homepage.dart';
import 'search.dart' as autism_search;

import '../connected/create_post/photoPost/photo_select.dart';
import '../connected/create_post/videoPost/video_select.dart';
import '../connected/create_post/requestAccessPage.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';

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

// get user education level from firestore
Future<String> getUserEducationLevel() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = auth.currentUser;
  final uid = user!.uid;

  String educationLevel = "";

  await FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      educationLevel = documentSnapshot.get('education_lvl');
    }
  });

  return educationLevel;
}

class _ProfileState extends State<Profile> {
  List<Asset> _images = <Asset>[];

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];

    try {
      resultList = await MultipleImagesPicker.pickImages(
        maxImages: 1,
      );
    } on Exception catch (e) {
      print(e);
    }

    if (!mounted) return;

    setState(() {
      _images = resultList;
    });

    if (_images.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PhotoSelect(
            image: _images[0],
          ),
        ),
      );
    }
  }


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
                              builder: (context) => ChatMenu(),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.settings),
                        color: ColorConstants.blueDark,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => MainSettings(),
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
                              // profile picture
                              CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(data['profile_picture']),
                              ),
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
                              builder: (context) => ChatMenu(),
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
                // Centres d'intérêts spécifiques
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Centres d'intérêts spécifiques",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      FutureBuilder(
                        future: getUserInterests(),
                        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            List<String> interests = snapshot.data!;
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: interests.length,
                              itemBuilder: (context, index) {
                                return Text(
                                  interests[index],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                );
                              },
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
                    ],
                  ),
                ),
                Divider(), // Séparation

                // Compétences
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ... Structure similaire à celle des centres d'intérêts ...
                      Text(
                        "Compétences",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      FutureBuilder(
                        future: getUserSkills(),
                        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            List<String> interests = snapshot.data!;
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: interests.length,
                              itemBuilder: (context, index) {
                                return Text(
                                  interests[index],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                );
                              },
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
                    ],
                  ),
                ),
                Divider(), // Séparation

                // Niveau d'études
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ... Structure similaire à celle des centres d'intérêts ...
                      Text(
                        "Niveau d'études",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
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
                          Navigator.of(context).pushReplacement(
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
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return Container(
                                height: MediaQuery.of(context).size.height,
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.close),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.send),
                                          onPressed: () {

                                          },
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: TextField(
                                        keyboardType: TextInputType.multiline,
                                        maxLines: null,
                                        expands: true,
                                        decoration: InputDecoration(
                                          hintText: 'Ecrivez quelque chose ici...',
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(Icons.photo_camera),
                                          onPressed: () async {
                                            final status = await Permission.camera.request();
                                            if (status.isGranted) {
                                              final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
                                              if (pickedFile != null) {
                                                print('Image Path ${pickedFile.path}');
                                              } else {
                                                print('No image selected.');
                                              }
                                            } else {
                                              // Handle when the permission is not granted
                                              print('Camera permission is not granted');
                                            }
                                          },
                                        ),

                                        IconButton(
                                          icon: Icon(Icons.photo_library),
                                          onPressed: () async {
                                            final status = await Permission.camera.request();
                                            if (status.isGranted) {
                                              final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                                              if (pickedFile != null) {
                                                print('Image Path ${pickedFile.path}');
                                              } else {
                                                print('No image selected.');
                                              }
                                            } else {
                                              // Handle when the permission is not granted
                                              print('Gallery permission is not granted');
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
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
                          Navigator.of(context).pushReplacement(
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