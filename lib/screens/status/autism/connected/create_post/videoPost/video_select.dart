import 'package:flutter/material.dart';
import '../../../../../../widgets/color_constants.dart';
import '../../../../../authentication.dart';

class VideoSelect extends StatefulWidget {
  @override
  _VideoSelectState createState() => _VideoSelectState();
}

class _VideoSelectState extends State<VideoSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 0),
          // title "Créer un post"
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
          // TODO: if no album detected, show the "Create album" page. Otherwise, go to the select album page to choose an album
        ],
      ),
    );
  }
}