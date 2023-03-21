import 'package:flutter/material.dart';
import '../signing_up/signup.dart';
import '../../../../../widgets/color_constants.dart';
import '../../../../profile_management/signup/status.dart';
import 'job.dart';

class Fullname extends StatefulWidget {
  @override
  _FullnameState createState() => _FullnameState();
}

class _FullnameState extends State<Fullname> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.greyDark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 100),
          Container(
            alignment: Alignment.center,
            child: Image.asset('assets/logoApp.png'),
            height: 160,
          ),
          SizedBox(height: 10),
          Container(
            child: Column(
              children: [
                Text(
                  "Comment vous appelez-vous ?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),

          // first and last name fields
          Container(
            child: Column(
              children: [
                Container(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Nom",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      )
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Prénom",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),

          // next button
          Container(
            width: 300,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => Job()),
                );
              },
              child: Text(
                "Suivant",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}