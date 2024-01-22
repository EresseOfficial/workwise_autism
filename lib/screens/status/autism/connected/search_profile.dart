import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:workwise_autism/screens/status/autism/connected/create_post/create_post.dart';
import 'package:workwise_autism/screens/status/autism/connected/homepage.dart';
import 'package:workwise_autism/screens/status/autism/connected/chat/chat_menu.dart';
import 'package:workwise_autism/screens/status/autism/connected/notifications.dart';
import 'package:workwise_autism/screens/status/autism/connected/profile_settings/main_settings.dart';
import '../../../../widgets/color_constants.dart';
import '../../../authentication.dart';
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

class SearchProfile extends StatefulWidget {
  // final String uid;
  // final String profileUid;
  //
  // SearchProfile({required this.uid, required this.profileUid});

  @override
  _SearchProfileState createState() => _SearchProfileState();
}

class _SearchProfileState extends State<SearchProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 0),
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

          // // profile logo with details include: full name, age, location and country, spoken languages
          // Container(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Container(
          //         child: Row(
          //           children: [
          //             Container(
          //               child: CircleAvatar(
          //                 radius: 30,
          //                 backgroundImage: AssetImage('assets/images/autism/autism1.jpg'),
          //               ),
          //             ),
          //             SizedBox(width: 10),
          //             Container(
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text(
          //                     "John Doe",
          //                     style: TextStyle(
          //                       color: ColorConstants.blueDark,
          //                       fontSize: 18,
          //                       fontWeight: FontWeight.w700,
          //                     ),
          //                   ),
          //                   SizedBox(height: 5),
          //                   Text(
          //                     "Age: 25",
          //                     style: TextStyle(
          //                       color: ColorConstants.blueDark,
          //                       fontSize: 14,
          //                       fontWeight: FontWeight.w400,
          //                     ),
          //                   ),
          //                   SizedBox(height: 5),
          //                   Text(
          //                     "Location: Paris, France",
          //                     style: TextStyle(
          //                       color: ColorConstants.blueDark,
          //                       fontSize: 14,
          //                       fontWeight: FontWeight.w400,
          //                     ),
          //                   ),
          //                   SizedBox(height: 5),
          //                   Text(
          //                     "Spoken languages: French, English",
          //                     style: TextStyle(
          //                       color: ColorConstants.blueDark,
          //                       fontSize: 14,
          //                       fontWeight: FontWeight.w400,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       Container(
          //         child: Row(
          //           children: [
          //             IconButton(
          //               icon: Icon(Icons.chat),
          //               color: ColorConstants.blueDark,
          //               onPressed: () {
          //                 Navigator.of(context).push(
          //                   MaterialPageRoute(
          //                     builder: (context) => ChatMenu(),
          //                   ),
          //                 );
          //               },
          //             ),
          //             IconButton(
          //               icon: Icon(Icons.settings),
          //               color: ColorConstants.blueDark,
          //               onPressed: () {
          //                 Navigator.of(context).push(
          //                   MaterialPageRoute(
          //                     builder: (context) => MainSettings(),
          //                   ),
          //                 );
          //               },
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

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
                                                // Ici, vous pouvez traiter l'image capturée et l'ajouter au post
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
                                            final status = await Permission.photos.request();
                                            if (status.isGranted) {
                                              final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                                              if (pickedFile != null) {
                                                // Ici, vous pouvez traiter l'image sélectionnée et l'ajouter au post
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