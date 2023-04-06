import 'package:flutter/material.dart';
import '../../connected/homepage.dart';
import '../../../../../widgets/color_constants.dart';
import '../../../../authentication.dart';
import '../signing_up/signup.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ProfileCustomization extends StatefulWidget {
  @override
  _ProfileCustomizationState createState() => _ProfileCustomizationState();
}

class _ProfileCustomizationState extends State<ProfileCustomization> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _getImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        cropStyle: CropStyle.circle,
        compressQuality: 100,
        maxWidth: 700,
        maxHeight: 700,
        compressFormat: ImageCompressFormat.jpg,
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: "Recadrer l'image",
          toolbarColor: Colors.blue,
          statusBarColor: Colors.blue,
          backgroundColor: Colors.white,
        ),
        iosUiSettings: IOSUiSettings(
          title: "Recadrer l'image",
          cancelButtonTitle: "Annuler",
          doneButtonTitle: "Terminer",
        ),
      );

      setState(() {
        if (croppedFile != null) {
          _image = croppedFile;
        } else {
          print('No image selected.');
        }
      });
    } else {
      print('No image selected.');
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blueDark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 100),

          // logo profile (TO CHANGE)
          Container(
            alignment: Alignment.center,
            child: _image == null
                ? Image.asset('assets/logoApp.png')
                : Image.file(_image!),
            height: 160,
          ),
          SizedBox(height: 10),

          // profile title
          Container(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        "Personnalisez votre profil",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // add picture button
                Container(
                  child: Column(
                    children: [
                      // button to add profile picture. When clicked, the OS system will open the gallery or the camera
                      SizedBox(
                        width: 200,
                        height: 40,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<
                                  Color>(Colors.white),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(color: Colors.white)
                                  )
                              )
                          ),

                          // popup to change profile picture (TO CHANGE)
                          onPressed: () {
                            _getImage();
                          },
                          child: Text(
                            _image == null ? 'Ajouter une photo' : 'Changer de photo',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 20),

                // biography field (implement framework)
                Container(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Biographie (facultatif)",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          // next and back buttons
          Container(
            child: Column(
              children: [
                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.white),
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(color: Colors.white)
                            )
                        )
                    ),

                    // redirection to Homepage after signup (TO CHANGE)
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => Homepage()),
                      );
                    },
                    child: const Text(
                      'Terminer',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 18),


                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            ColorConstants.blueDark),
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Colors.white)
                          ),
                        )
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Précédent',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}