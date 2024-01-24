import 'package:flutter/material.dart';
import 'package:workwise_autism/widgets/color_constants.dart';

class InterestSchoolAutism extends StatefulWidget {
  @override
  _InterestSchoolAutismState createState() => _InterestSchoolAutismState();
}

class Interest {
  final String name;
  final List<Interest> subInterests;

  Interest(this.name, [this.subInterests = const []]);
}

class _InterestSchoolAutismState extends State<InterestSchoolAutism> {
  final List<Interest> interests = [
    Interest('Découverte des Sciences', [
      Interest('Sciences Naturelles'),
      Interest('Astronomie et Espace'),
      Interest('Physique et Chimie'),
      Interest('Sciences de la vie'),
      Interest('Environnement et Durabilité'),
      Interest('Histoire et Sciences Humaines'),
    ]),
    Interest('Arts et Créativité', [
      Interest('Arts Visuels'),
      Interest('Musique'),
      Interest('Théàtre et Performance'),
      Interest('Arts Manuels et Artisanat'),
      Interest('Photographie et Arts Numériques'),
      Interest('Expression Créative'),
    ]),

    Interest('Nature et Animaux', [
      Interest('Découverte des Animaux'),
      Interest('Observation de la Nature'),
      Interest('Sciences Envirronementales'),
      Interest('Activités Extérieures'),
      Interest('Interations avec les Animaux'),
      Interest('Projets et Expériences'),
      Interest('Education sur la Nature'),
    ]),
    Interest('Sports et Activités Physiques', [
      Interest('Sports Individuels'),
      Interest('Sports d\'Equipe'),
      Interest('Activités de Plein Air'),
      Interest('Gymnastique et Mouvement'),
      Interest('Jeux de Coordination'),
      Interest('Arts Martiaux'),
      Interest('Activités Adaptées'),
    ]),
    Interest('Jeux et Divertissement', [
      Interest('Jeux de Société et Puzzles'),
      Interest('Jeux de Construction'),
      Interest('Jeux d\'Imagination et de Rôle'),
      Interest('Jeux Vidéo et Interactifs'),
      Interest('Activités Créatives et Artistiques'),
      Interest('Jeux Extérieurs et Activités Physiques'),
      Interest('Jeux de Coordination et d\'Adresse'),
    ]),
    Interest('Loisirs Educatifs', [
      Interest('Activités de Lecture et d\'Ecriture'),
      Interest('Activités Scientifiques et de Découverte'),
      Interest('Activités Mathématiques et de Logique'),
      Interest('Arts et Artisanat'),
      Interest('Musique et Rythme'),
      Interest('Technologie et Informatique'),
      Interest('Activités de Découverte Culturelle'),
      Interest('Observation et Astronomie'),
    ]),
    Interest('Langues et Premières Lectures', [
      Interest('Apprentissage de la Lecture'),
      Interest('Écriture et Orthographe'),
      Interest('Langue Seconde et Bi-linguisme'),
      Interest('Livres Interactifs et Multimédias'),
      Interest('Poésie et Chansons'),
      Interest('Activités de Narration'),
      Interest('Jeux de Langage et de Communication'),
    ]),
    Interest('Initiation aux Mathématiques et à la Logique', [
      Interest('Concepts de Base en Mathématiques'),
      Interest('Résolution de Problèmes et Logique'),
      Interest('Mathématiques Appliquées'),
      Interest('Jeux Mathématiques et Interactifs'),
      Interest('Activités de Groupe en Mathématiques'),
      Interest('Introduction aux Statistiques et Données'),
      Interest('Pensée Abstraite et Conceptuelle'),
    ]),
    Interest('Environnement et Planète Terre', [
      Interest('Découverte de l\'Environnement Naturel'),
      Interest('Phénomènes Naturels'),
      Interest('Conservation et Protection de l\'Environnement'),
      Interest('Activité Extérieures et Exploration'),
      Interest('Géographie et Cartographie'),
      Interest('Education sur la Durabilité'),
      Interest('Activités et Projets Pratiques')
    ]),
    Interest('Culture et Traditions', [
      Interest('Découverte des Cultures du Monde'),
      Interest('Arts et Artisanat Culturels'),
      Interest('Musique et Danse Traditionnelles'),
      Interest('Fêtes et Célébrations'),
      Interest('Cuisine et Gastronomie'),
      Interest('Langues et Communication'),
      Interest('Histoire et Civilisations'),
    ]),
    Interest('Cuisine et Découvertes Alimentaires', [
      Interest('Initiation à la Cuisine'),
      Interest('Alimentation et Nutrition'),
      Interest('Découverte des Saveurs et des Aliments'),
      Interest('Cuisine Culturelle et Traditionnelle'),
      Interest('Jardinage et Provenance des Aliments'),
      Interest('Cuisine Sensorielle et Expérimentale'),
      Interest('Sécurité et Hygiène en Cuisine'),
    ]),
  ];

  Interest? selectedInterest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blueDark,
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

          // interest title
          Container(
            child: Column(
              children: [
                Text(
                  // justify text to center
                  "Mes centres d'intérêts spécifiques",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                DropdownButton<Interest>(
                  hint: Text('Sélectionnez un centre d\'intérêt'),
                  value: selectedInterest,
                  onChanged: (Interest? newValue) {
                    setState(() {
                      selectedInterest = newValue;
                    });
                  },
                  items: interests
                      .map<DropdownMenuItem<Interest>>((Interest value) {
                    return DropdownMenuItem<Interest>(
                      value: value,
                      child: Text(value.name),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          // next and back buttons
          Container(
            child: Column(
              children: [
                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(color: Colors.white)))),
                    onPressed: () {
                      // TODO: Implement next button functionality
                    },
                    child: const Text(
                      'Suivant',
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
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Colors.white)),
                        )),
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
