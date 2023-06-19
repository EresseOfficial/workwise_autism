import 'package:flutter/material.dart';
import 'package:workwise_autism/screens/status/autism/connected/chat/chat_create.dart';
import '../../../../../widgets/color_constants.dart';
import '../../../../authentication.dart';

// importing user details
import '../../signup/profile_creation/full_name.dart';
import '../../signup/profile_creation/birthdate.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ChatMenu extends StatefulWidget {
  @override
  _ChatMenuState createState() => _ChatMenuState();
}

class _ChatMenuState extends State<ChatMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 0),

          // "chat" title and new chat icon button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Text(
                      "Chat",
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
                      icon: Icon(Icons.add),
                      color: ColorConstants.blueDark,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ChatCreate(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              // Tabs menu: "All", "Unread" and "Requests"

            ],
          ),
        ],
      ),
    );
  }
}