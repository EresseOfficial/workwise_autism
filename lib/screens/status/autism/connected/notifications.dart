import 'package:flutter/material.dart';
import '../../../../widgets/color_constants.dart';
import '../../../authentication.dart';
import '../../autism/signup/signing_up/signup.dart';

import 'search.dart' as autism_search;

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // TODO: Write the code to display the notifications: invitations, new comment to a post, mention in someone's post, etc (take Instagram as an example)
        ],
      ),
    );
  }
}