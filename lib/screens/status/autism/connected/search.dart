import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:workwise_autism/screens/status/autism/connected/create_post/create_post.dart';
import 'package:workwise_autism/screens/status/autism/connected/homepage.dart';
import '../../../../widgets/color_constants.dart';
import '../../../authentication.dart';
import 'package:workwise_autism/screens/status/autism/connected/chat/chat.dart';
import 'profile.dart';
import 'search_profile.dart';

// bottom pages
import 'homepage.dart' as autism_homepage;
import 'search.dart' as autism_search;
// import 'create_post.dart' as autism_create_post;
import 'notifications.dart' as autism_notifications;
import 'profile.dart' as autism_profile;

import '../connected/create_post/photoPost/photo_select.dart';
import '../connected/create_post/videoPost/video_select.dart';
import '../connected/create_post/requestAccessPage.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';

import 'search.dart' as autism_search;

import 'package:carousel_slider/carousel_slider.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
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

  // users simulation test
  List<Map<String, String>> users = [
    {
      'profilePhoto': 'https://via.placeholder.com/150',
      'fullName': 'John Doe',
      'interest': 'Peinture',
    },
    {
      'profilePhoto': 'https://via.placeholder.com/150',
      'fullName': 'Jane Smith',
      'interest': 'Photographie',
    },
    {
      'profilePhoto': 'https://via.placeholder.com/150',
      'fullName': 'Alex Brown',
      'interest': 'Cuisine',
    },
    // ... Ajoutez autant d'utilisateurs fictifs que vous le souhaitez
  ];

  /*
  // get user details from firestore (first name, last name, profile picture)
  Future<List<String>> getUserDetails() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;
    List<String> userDetails = [];

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      userDetails.add(documentSnapshot.data()['firstName']);
      userDetails.add(documentSnapshot.data()['lastName']);
      userDetails.add(documentSnapshot.data()['profile_picture']);
    });

    return userDetails;
  }
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // text rechercher and chat icon
          // added to a container
          // the container is positioned at the top of the screen
          // and centered horizontally
          // it has spaces at the left and right of 10 pixels
          SizedBox(height: 0),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        "Rechercher",
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
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => ChatPage(),
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
          // search bar and chat icon
          // added to a container
          // it must be fixed ant at the top of the screen
          // and must be centered horizontally
          // it has spaces at the right of 10 pixels (to leave space for the chat icon)
          // the search bar must have a blueLight background color, including the icon
          // it also includes a placeholder "Rechercher"
          // the search bar must have a border radius of 50 pixels
          // and the chat icon with be next to the search bar on the right side
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                          color: ColorConstants.blueLight,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Rechercher",
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: ColorConstants.blueDark,
                            ),
                          ),
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
          ),

          // carousel slider with person details suggested by the app's algorithm
          // added to a container. It contains a carousel slider with a profile picture, the full name, his/her main interest
          // the slider must be fixed at the center of the screen, with arrows on the left and right side
          // the data must be fetched from firestore (firstName, lastName, interests)
          // the carousel slider must have a height of 200 pixels
          // the carousel slider must have a border radius of 20 pixels
          // the carousel slider must have a blueLight background color
          // code

          /* test carousel slider */
          CarouselSlider.builder(
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) {
              var user = users[index];
              return Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(user['profilePhoto']!),
                      radius: 50.0,
                    ),
                    SizedBox(height: 10),
                    Text(user['fullName']!),
                    Text(user['interest']!),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SearchProfile(),
                          ),
                        );
                      },
                      child: Text('Voir le profil'),
                    ),
                  ],
                ),
              );
            },
            options: CarouselOptions(
              height: 300,
              enableInfiniteScroll: true,
              autoPlay: false,
              autoPlayInterval: Duration(seconds: 3),
              enlargeCenterPage: true,
            ),
          ),


        /* final */
          /*
          CarouselSlider.builder(
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) {
              var user = users[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Image.network(user['profile_picture']!), // Image de profil
                    Text(user['fullName']!), // Nom complet
                    Text(user['interest']!), // Centre d'intérêt
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.push(context, route)
                      },
                      child: Text('Voir le profil'),
                    ),
                  ],
                ),
              );
            },
            options: CarouselOptions(
              height: 200,
              enableInfiniteScroll: true,
            ),
          ),
           */
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