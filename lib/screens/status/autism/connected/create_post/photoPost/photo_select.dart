import 'package:flutter/material.dart';
import '../../../../../../widgets/color_constants.dart';
import '../../../../../authentication.dart';

class PhotoSelect extends StatefulWidget {
  @override
  _PhotoSelectState createState() => _PhotoSelectState();
}

class _PhotoSelectState extends State<PhotoSelect> {
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
                // post creation using insta_assets_picker dependency
                // making the photo selection page look like instagram
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Authentication(),
                      ),
                    );
                  },
                  child: Text(
                    "Suivant",
                    style: TextStyle(
                      color: ColorConstants.blueDark,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
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