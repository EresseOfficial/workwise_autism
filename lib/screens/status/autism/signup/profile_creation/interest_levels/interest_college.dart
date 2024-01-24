import 'package:flutter/material.dart';
import 'package:workwise_autism/widgets/color_constants.dart';

class InterestCollegeAutism extends StatefulWidget {
  @override
  _InterestCollegeAutismState createState() => _InterestCollegeAutismState();
}

class Interest {
  final String name;
  final List<Interest> subInterests;

  Interest(this.name, [this.subInterests = const []]);
}

class _InterestCollegeAutismState extends State<InterestCollegeAutism> {
  final List<Interest> interests = [
    Interest('Sciences et Exploration', [
      Interest('Sciences Naturelles'),
      Interest('Physique et Chimie'),
      Interest('Astronomie et Espace'),
      Interest('Technologie et Ingénierie'),
      Interest('Sciences de l\'Environnement'),
      Interest('Mathématiques Appliquées'),
      Interest('Exploration et Expéditions'),
    ]),
    Interest('Technologie et Informatique', [
      Interest('Programmation Informatique'),
      Interest('Robotique et Automatisation'),
      Interest('Conception et Graphisme'),
      Interest('Informatique et Matériel'),
      Interest('Réseaux et Cybersécurité'),
      Interest('Technologies Émergentes'),
      Interest('Projets et Expériences Pratiques'),
    ]),
    Interest('Arts et Expression Créative', [
      Interest('Arts Visuels'),
      Interest('Arts du Spectacle'),
      Interest('Musique et Son'),
      Interest('Arts Numériques et Multimédia'),
      Interest('Artisanat et Projets Créatifs'),
      Interest('Expression et Communication Créative'),
      Interest('Projets de Groupe et Collaborations'),
    ]),
    Interest('Nature et Environnement', [
      Interest('Étude des Écosystèmes'),
      Interest('Sciences de la Terre'),
      Interest('Environnement et Durabilité'),
      Interest('Botanique et Horticulture'),
      Interest('Faune et Observation des Animaux'),
      Interest('Activités et Exploration en Plein Air'),
      Interest('Sciences Environnementales Appliquées'),
    ]),
    Interest('Sports et Activités Physiques', [
      Interest('Sports Individuels'),
      Interest('Sports d\'Équipe'),
      Interest('Activités de Plein Air'),
      Interest('Arts Martiaux et Autodéfense'),
      Interest('Gymnastique et Yoga'),
      Interest('Jeux et Activités Ludiques'),
      Interest('Forme Physique et Entraînement'),
    ]),
    Interest('Animaux et Soins des Animaux', [
      Interest('Étude des Animaux'),
      Interest('Soins des Animaux Domestiques'),
      Interest('Animaux de Ferme et Élevage'),
      Interest('Faune Sauvage et Conservation'),
      Interest('Aquariums et Aquariophilie'),
      Interest('Activités Pratiques et Projets'),
      Interest('Santé et Bien-être Animal'),
    ]),
    Interest('Loisirs et Hobbies', [
      Interest('Collection et Exploration'),
      Interest('Activités Artistiques et Artisanales'),
      Interest('Jeux et Divertissements'),
      Interest('Musique et Instruments'),
      Interest('Activités de Plein Air'),
      Interest('Photographie et Vidéographie'),
      Interest('Lecture et Écriture'),
      Interest('Modélisme et Construction'),
    ]),
    Interest('Langues et Littérature', [
      Interest('Apprentissage des Langues'),
      Interest('Littérature et Lecture'),
      Interest('Écriture et Expression Créative'),
      Interest('Étude de la Langue'),
      Interest('Littérature Mondiale et Culturelle'),
      Interest('Projets et Présentations'),
      Interest('Analyse et Critique Littéraire'),
    ]),
    Interest('Histoire et Sciences Humaines', [
      Interest('Histoire Mondiale'),
      Interest('Histoire Locale et Nationale'),
      Interest('Géographie et Sociétés'),
      Interest('Sciences Politiques et Économie'),
      Interest('Anthropologie et Archéologie'),
      Interest('Histoire des Arts et de la Culture'),
      Interest('Projets de Recherche en Histoire et Sciences Humaines'),
    ]),
    Interest('Médias et Communication', [
      Interest('Littératie des Médias'),
      Interest('Compétences en Communication'),
      Interest('Médias Numériques et Réseaux Sociaux'),
      Interest('Journalisme et Reportage'),
      Interest('Production Audiovisuelle'),
      Interest('Publicité et Marketing'),
      Interest('Technologie de Communication'),
    ]),
    Interest('Cuisine et Gastronomie', [
      Interest('Techniques de Cuisine de Base'),
      Interest('Cuisine Internationale'),
      Interest('Pâtisserie et Boulangerie'),
      Interest('Nutrition et Alimentation Saine'),
      Interest('Arts de la Table et Présentation'),
      Interest('Expérimentation et Créativité en Cuisine'),
      Interest('Culture et Histoire Gastronomique'),
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
