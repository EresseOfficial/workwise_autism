import 'package:flutter/material.dart';
import 'package:workwise_autism/screens/status/autism/connected/chat/chat.dart';
import 'package:workwise_autism/screens/status/autism/connected/chat/chat_create.dart';
import '../../../../../widgets/color_constants.dart';
import '../../../../authentication.dart';

// importing user details
import '../../signup/profile_creation/full_name.dart';
import '../../signup/profile_creation/birthdate.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatDetails extends StatefulWidget {
  @override
  _ChatDetailsState createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // profile picture, name, and status
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              // backgroundImage: AssetImage("assets/images/user.png"),
            ),
            SizedBox(width: 10),
            Text(
              "User 1",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}