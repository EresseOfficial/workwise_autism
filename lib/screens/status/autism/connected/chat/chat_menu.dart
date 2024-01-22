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


class ChatMenu extends StatefulWidget {
  @override
  _ChatMenuState createState() => _ChatMenuState();
}



class _ChatMenuState extends State<ChatMenu> {
  // Static data
  List<Map<String, dynamic>> chatData = [
    {
      "name": "User 1",
      "lastMessage": "Hello, how are you?",
      "time": "10:00 PM",
    },
    {
      "name": "User 2",
      "lastMessage": "See you tomorrow.",
      "time": "09:30 PM",
    },

  ];

  User? currentUser;

  @override
  void initState() {
    super.initState();
    currentUser = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 35),

          // "chat" title and new chat icon button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "Chat",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                child: IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChatCreate()));
                  },
                ),
              ),
            ],
          ),

          // Liste des conversations
          Expanded(
            child: ListView.builder(
              itemCount: chatData.length,
              itemBuilder: (context, index) {
                var chat = chatData[index];
                return ListTile(
                  leading: CircleAvatar(child: Icon(Icons.person)), // or replace with user profile image
                  title: Text(chat['name']),
                  subtitle: Text(chat['lastMessage']),
                  trailing: Text(chat['time']),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}