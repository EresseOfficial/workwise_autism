import 'package:flutter/material.dart';
import '../signing_up/signup.dart';
import '../../../../../widgets/color_constants.dart';
import '../../../../profile_management/signup/status.dart';
import 'profile_customization.dart' as job_profile_customization;
// import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.greyDark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 100),

          // logo app
          Container(
            alignment: Alignment.center,
            child: Image.asset('assets/logos/logoApp.png'),
            height: 160,
          ),
          SizedBox(height: 10),

          // search your first person title
          Container(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        "Recherchez votre première personne",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        "Vous pourrez rechercher une personne plus tard sur la page de recherche de votre compte.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w100,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          // carousel
          // Container(
          //   child: Column(
          //     children: [
          //       CarouselSlider(
          //         items: [
          //
          //           //1st Image of Slider
          //           Container(
          //             margin: EdgeInsets.all(6.0),
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(8.0),
          //               image: DecorationImage(
          //                 image: NetworkImage("https://images5.alphacoders.com/487/487003.jpg"),
          //                 fit: BoxFit.cover,
          //               ),
          //             ),
          //           ),
          //
          //           //2nd Image of Slider
          //           Container(
          //             margin: EdgeInsets.all(6.0),
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(8.0),
          //               image: DecorationImage(
          //                 image: NetworkImage("https://images7.alphacoders.com/486/486671.jpg"),
          //                 fit: BoxFit.cover,
          //               ),
          //             ),
          //           ),
          //
          //           //3rd Image of Slider
          //           Container(
          //             margin: EdgeInsets.all(6.0),
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(8.0),
          //               image: DecorationImage(
          //                 image: NetworkImage("https://images5.alphacoders.com/423/423747.jpg"),
          //                 fit: BoxFit.cover,
          //               ),
          //             ),
          //           ),
          //
          //           //4th Image of Slider
          //           Container(
          //             margin: EdgeInsets.all(6.0),
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(8.0),
          //               image: DecorationImage(
          //                 image: NetworkImage("https://images8.alphacoders.com/416/416502.jpg"),
          //                 fit: BoxFit.cover,
          //               ),
          //             ),
          //           ),
          //
          //           //5th Image of Slider
          //           Container(
          //             margin: EdgeInsets.all(6.0),
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(8.0),
          //               image: DecorationImage(
          //                 image: NetworkImage("https://images8.alphacoders.com/416/416499.jpg"),
          //                 fit: BoxFit.cover,
          //               ),
          //             ),
          //           ),
          //
          //         ],
          //
          //         //Slider Container properties
          //         options: CarouselOptions(
          //           height: 180.0,
          //           enlargeCenterPage: true,
          //           autoPlay: true,
          //           aspectRatio: 16 / 9,
          //           autoPlayCurve: Curves.fastOutSlowIn,
          //           enableInfiniteScroll: true,
          //           autoPlayAnimationDuration: Duration(milliseconds: 800),
          //           viewportFraction: 0.8,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          // next and back buttons
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
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => job_profile_customization.ProfileCustomization()),
                      );
                    },
                    child: const Text(
                      'Voir le profil',
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