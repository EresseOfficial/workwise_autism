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

class Chat {
  final String id;
  final String lastMessage;
  final DateTime lastMessageTimestamp;
  final List<String> participants;

  Chat({
    required this.id,
    required this.lastMessage,
    required this.lastMessageTimestamp,
    required this.participants,
  });
}

// Données de chat factices
List<Chat> sampleChats = [
  Chat(
    id: '1',
    lastMessage: 'Salut, comment ça va?',
    lastMessageTimestamp: DateTime.now(),
    participants: ['User1', 'User2'],
  ),
  Chat(
    id: '2',
    lastMessage: 'Bonjour!',
    lastMessageTimestamp: DateTime.now(),
    participants: ['User1', 'User3'],
  ),
  // Ajoutez plus de chats ici...
];

class _ChatMenuState extends State<ChatMenu> {
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
                    color: Colors.black, // Remplacez cela avec votre couleur personnalisée
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                child: IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.black, // Remplacez cela avec votre couleur personnalisée
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChatCreate()));
                  },
                ),
              ),
            ],
          ),

          // Liste des conversations
          /*
          ListView.builder(
            itemCount: sampleChats.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(sampleChats[index].participants.join(', ')),
                subtitle: Text(sampleChats[index].lastMessage),
              );
            },
          ),
          */
        ],
      ),
    );
  }
}