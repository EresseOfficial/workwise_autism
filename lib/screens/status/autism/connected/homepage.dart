import 'package:flutter/material.dart';
import 'package:workwise_autism/screens/status/autism/connected/chat/chat_menu.dart';
import '../../../../widgets/color_constants.dart';
import '../../../authentication.dart';
import '../../autism/signup/signing_up/signup.dart';
import 'profile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

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

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currrentIndex = 0;
  final PageController _pageController = PageController();

  List<Widget> _pages = <Widget>[
    autism_homepage.Homepage(),
    autism_search.Search(),
    // autism_create_post.CreatePost(),
    autism_notifications.Notifications(),
    autism_profile.Profile(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currrentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

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
                              builder: (context) => ChatMenu(),
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
                        "Se connecter aux autres personnes",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorConstants.blueDark,
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Pour afficher des posts sur votre fil d’actualités, commencez à vous connecter aux autres personnes.",
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
                      // create post (linkedin style)
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