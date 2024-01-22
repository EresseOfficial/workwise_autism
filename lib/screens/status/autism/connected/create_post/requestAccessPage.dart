import 'package:flutter/material.dart';
import '../../../../../../widgets/color_constants.dart';
import '../../../../authentication.dart';

class RequestAccessPage extends StatefulWidget {
  @override
  _RequestAccessPageState createState() => _RequestAccessPageState();
}

class _RequestAccessPageState extends State<RequestAccessPage> {
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
                  "Créer un post",
                  style: TextStyle(
                    color: ColorConstants.blueDark,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          // TODO: Write the text code to ask the user to request access to the device's photo library
        ],
      ),
    );
  }
}