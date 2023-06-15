import 'package:flutter/material.dart';
import 'package:workwise_autism/screens/status/autism/connected/homepage.dart';
import '../../../../widgets/color_constants.dart';
import '../../../authentication.dart';
import 'profile.dart';

// bottom pages
import 'homepage.dart' as autism_homepage;
import 'search.dart' as autism_search;
// import 'create_post.dart' as autism_create_post;
import 'notifications.dart' as autism_notifications;
import 'profile.dart' as autism_profile;

import '../connected/create_post/photoPost/photo_select.dart';
import '../connected/create_post/videoPost/video_select.dart';
import '../connected/create_post/linkPost/link_select.dart';
import '../connected/create_post/requestAccessPage.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import 'search.dart' as autism_search;

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Asset> _images = <Asset>[];

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];

    try {
      resultList = await MultiImagePicker.pickImages(
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
          // text rechercher and chat icon
          // added to a container
          // the container is positioned at the top of the screen
          // and centered horizontally
          // it has spaces at the left and right of 10 pixels
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
          Container(
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    color: ColorConstants.blueLight,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: ColorConstants.blueLight,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Voir le profil",
                      style: TextStyle(
                        color: ColorConstants.blueDark,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
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
                              builder: (BuildContext bc) {
                                return SafeArea(
                                  child: Container(
                                    child: new Wrap(
                                      children: <Widget>[
                                        new ListTile(
                                          leading: new Icon(Icons.photo_library),
                                          title: new Text('Photo'),
                                          onTap: () {
                                            loadAssets();
                                          },
                                        ),

                                        new ListTile(
                                            leading: new Icon(Icons.videocam),
                                            title: new Text('Vidéo'),
                                            onTap: () {
                                              // Ajoutez ici votre code pour la sélection de vidéo
                                            }
                                        ),
                                        new ListTile(
                                            leading: new Icon(Icons.link),
                                            title: new Text('Lien'),
                                            onTap: () {
                                              // Ajoutez ici votre code pour la sélection de lien
                                            }
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
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