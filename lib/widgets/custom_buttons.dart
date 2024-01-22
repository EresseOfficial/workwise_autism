// custom_buttons.dart
import 'package:flutter/material.dart';
import './color_constants.dart'; // Assurez-vous d'ajuster le chemin d'accès si nécessaire

class CustomButtons {
  static Widget nextButton(BuildContext context, Widget nextPage) {
    return Container(
      width: 200,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => nextPage),
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
    );
  }

  static Widget backButton(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 40,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(ColorConstants.blueDark),
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
    );
  }

  static Widget signUpButton(BuildContext context, Widget signUpPage) {
    return SizedBox(
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
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => signUpPage),
          );
        },
        child: const Text(
          "S'inscrire",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }

  static Widget signInButton(BuildContext context, Widget loginPage) {
    return SizedBox(
      width: 200,
      height: 40,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(ColorConstants.blueDark),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.white)
              ),
            )
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => loginPage),
          );
        },
        child: const Text(
          "Se connecter",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
