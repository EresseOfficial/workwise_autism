import 'package:flutter/material.dart';
import 'package:workwise_autism/widgets/color_constants.dart';

class InterestHighSchoolAutism extends StatefulWidget {
  @override
  _InterestHighSchoolAutismState createState() =>
      _InterestHighSchoolAutismState();
}

class Interest {
  final String name;
  final List<Interest> subInterests;

  Interest(this.name, [this.subInterests = const []]);
}

class _InterestHighSchoolAutismState extends State<InterestHighSchoolAutism> {
  final List<Interest> interests = [
    Interest('Arts Visuels et Créatifs', [
      Interest('Peinture et Techniques Mixtes'),
      Interest('Dessin et Illustration'),
      Interest('Sculpture et Modelage'),
      Interest('Photographie et Vidéographie'),
      Interest('Arts Numériques et Multimédia'),
      Interest('Histoire de l\'Art et Critique'),
      Interest('Projets Artistiques et Expositions'),
    ]),
    Interest('Musique et Performance', [
      Interest('Pratique Instrumentale'),
      Interest('Chant et Techniques Vocales'),
      Interest('Composition et Théorie Musicale'),
      Interest('Musique Assistée par Ordinateur'),
      Interest('Histoire et Culture Musicale'),
      Interest('Arts de la Scène et Interprétation'),
      Interest('Projets Musicaux et Événements'),
    ]),
    Interest('Nature et Animaux', [
      Interest('Biologie et Écologie'),
      Interest('Sciences de l\'Environnement'),
      Interest('Étude et Soins des Animaux'),
      Interest('Activités de Plein Air et Exploration'),
      Interest('Horticulture et Jardinage'),
      Interest('Photographie et Documentaire sur la Nature'),
      Interest('Sciences Géographiques et Géologiques'),
    ]),
    Interest('Sciences et Exploration', [
      Interest('Sciences Physiques et Naturelles'),
      Interest('Sciences de la Terre et Géologie'),
      Interest('Astronomie et Astrophysique'),
      Interest('Technologies et Innovations'),
      Interest('Mathématiques Appliquées'),
      Interest('Recherche Scientifique et Projets'),
      Interest('Exploration et Expéditions'),
    ]),
    Interest('Activités Physiques et Sportives', [
      Interest('Sports Individuels'),
      Interest('Sports d\'Équipe'),
      Interest('Arts Martiaux et Autodéfense'),
      Interest('Fitness et Entraînement Physique'),
      Interest('Activités de Plein Air et Aventure'),
      Interest('Danse et Expression Corporelle'),
      Interest('Activités Physiques Adaptées'),
    ]),
    Interest('Jeux, Puzzles et Réflexion', [
      Interest('Jeux de Société et de Stratégie'),
      Interest('Puzzles et Casse-têtes'),
      Interest('Jeux de Cartes et de Plateau'),
      Interest('Jeux Vidéo et Informatiques'),
      Interest('Activités de Réflexion et de Logique'),
      Interest('Rôles et Jeux Narratifs'),
      Interest('Activités Créatives avec Puzzles et Jeux'),
    ]),
    Interest('Loisirs et Collections', [
      Interest('Collections Thématiques'),
      Interest('Modélisme et Maquettisme'),
      Interest('Activités Artistiques et Artisanales'),
      Interest('Technologies et Électronique'),
      Interest('Nature et Jardinage'),
      Interest('Musique et Collection de Médias'),
      Interest('Exploration Urbaine et Voyages'),
    ]),
    Interest('Littérature et Langues', [
      Interest('Études Littéraires'),
      Interest('Langues Étrangères'),
      Interest('Écriture Créative'),
      Interest('Théâtre et Dramaturgie'),
      Interest('Poésie et Expression Poétique'),
      Interest('Langue et Communication'),
      Interest('Projets et Événements Littéraires'),
    ]),
    Interest('Développement Personnel et Socialisation', [
      Interest('Compétences Sociales et Communication'),
      Interest('Gestion des Émotions et Résilience'),
      Interest('Développement de l\'Identité et de l\'Estime de Soi'),
      Interest('Compétences de Vie et Autonomie'),
      Interest('Relations et Interaction Sociale'),
      Interest('Mindfulness et Bien-être'),
      Interest('Projets de Développement Personnel'),
    ]),
    Interest('Médias et Communication Numérique', [
      Interest('Littératie Numérique et Médias'),
      Interest('Production et Création de Contenus'),
      Interest('Communication et Réseaux Sociaux'),
      Interest('Journalisme Numérique et Blogging'),
      Interest('Technologies de l\'Information et Informatique'),
      Interest('Photographie et Vidéographie Numérique'),
      Interest('Projets et Ateliers Médias Numériques'),
    ]),
    Interest('Économie et Entrepreneuriat', [
      Interest('Principes de Base de l\'Économie'),
      Interest('Entrepreneuriat et Gestion d\'Entreprise'),
      Interest('Marketing et Communication Commerciale'),
      Interest('Finance et Comptabilité'),
      Interest('Économie Sociale et Développement Durable'),
      Interest('Projets d\'Entreprise et Simulations'),
      Interest('Études de Cas et Recherche en Économie'),
    ]),
    Interest('Sciences Humaines et Études Culturelles', [
      Interest('Histoire et Civilisations'),
      Interest('Sociologie et Sciences Sociales'),
      Interest('Anthropologie et Études Culturelles'),
      Interest('Psychologie et Comportement Humain'),
      Interest('Philosophie et Pensée Critique'),
      Interest('Études des Médias et de la Communication'),
      Interest('Projets de Recherche et Études'),
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
