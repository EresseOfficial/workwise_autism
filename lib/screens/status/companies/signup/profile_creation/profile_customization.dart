import 'package:flutter/material.dart';
import '../../../../../widgets/color_constants.dart';
import '../../../../authentication.dart';
import '../signing_up/signup.dart';
import '../../connected/homepage.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

import 'package:flutter/foundation.dart';

class ProfileCustomization extends StatefulWidget {
  @override
  _ProfileCustomizationState createState() => _ProfileCustomizationState();
}

class _ProfileCustomizationState extends State<ProfileCustomization> {
  bool isLoading = false;

  // controllers
  final TextEditingController _bioController = TextEditingController();

  // storing user info in firestore
  Future<void> _storeUserInfo() async {
    if (_image != null) {
      String? imageURL;
      String fileName = FirebaseAuth.instance.currentUser!.uid;
      Reference storageRef = FirebaseStorage.instance.ref().child('profile_pictures/$fileName');
      UploadTask uploadTask = storageRef.putFile(_image!);
      TaskSnapshot taskSnapshot = await uploadTask;
      imageURL = await taskSnapshot.ref.getDownloadURL();

      await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).update({
        'bio': _bioController.text,
        'profile_picture': imageURL,
      });
    } else {
      await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).update({
        'bio': _bioController.text,
        'profile_picture': null,
      });
    }
  }

  // image picker
  File? _image;
  final ImagePicker _picker = ImagePicker();

  // function to get image from gallery
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        cropStyle: CropStyle.circle,
        compressQuality: 100,
        maxWidth: 700,
        maxHeight: 700,
        compressFormat: ImageCompressFormat.jpg,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: "Recadrer l'image",
            toolbarColor: Colors.blue,
            statusBarColor: Colors.blue,
            backgroundColor: Colors.white,
          ),
          IOSUiSettings(
            title: "Recadrer l'image",
            cancelButtonTitle: "Annuler",
            doneButtonTitle: "Terminer",
          ),
        ],
      );

      setState(() {
        if (croppedFile != null) {
          _image = File(croppedFile.path);  // Convert CroppedFile to File
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
      backgroundColor: ColorConstants.greyDark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 100),

          // logo profile (TO CHANGE)
          Container(
            alignment: Alignment.center,
            child: _image == null
                ? Image.asset('assets/logos/logoApp.png')
                : ClipOval(
              child: Image.file(
                _image!,
                fit: BoxFit.cover,
                height: 160,
                width: 160,
              ),
            ),
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
                      SizedBox(
                        width: 200,
                        height: 40,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(color: Colors.white)
                                  )
                              )
                          ),

                          // popup to change profile picture (TO CHANGE)
                          onPressed: () {
                            _pickImage();
                          },
                          child: Text(
                            // if no picture is selected, the button will say "add a picture". Otherwise, it will say "change picture"
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
                    controller: _bioController,
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

                    // if the button is pressed, the isLoading variable will be set to true and the button will be disabled
                    onPressed: isLoading
                        ? null
                        : () async {
                      setState(() {
                        isLoading = true;
                      });
                      await _storeUserInfo();
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Homepage()),
                      );
                    },
                    child: isLoading
                    // if the button is pressed, a circular progress indicator will be displayed
                        ? CircularProgressIndicator(
                      color: Colors.black,
                    )
                        : const Text(
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
                        backgroundColor: MaterialStateProperty.all<Color>(ColorConstants.greyDark),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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