import 'package:flutter/material.dart';
import 'signup.dart';
import '../profile_creation/full_name.dart' as job_fullname;
import '../../../../../widgets/color_constants.dart';
import '../../../../profile_management/signup/status.dart';

class MailConfirm extends StatefulWidget {
  @override
  _MailConfirmState createState() => _MailConfirmState();
}

class _MailConfirmState extends State<MailConfirm> {
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

          // verify email address section
          Container(
            child: Column(
              children: [
                Text(
                  "Vérifiez votre adresse e-mail",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        "Nous avons envoyé un e-mail de vérification sur votre adresse e-mail renseigné précedemment. \nPour activer votre compte, veuillez consulter votre adresse e-mail, et cliquez sur le lien d’activation. N’hésitez pas à regarder vos spams. \nVous passerez sur la page suivante automatiquement une fois que votre compte sera activé pour finaliser votre inscription.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
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
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => job_fullname.Fullname()),
                            );
                          },
                          child: const Text(
                            "Ouvrir le mail",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),


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
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Fermer',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}