import 'package:flutter/material.dart';
import 'package:workwise_autism/widgets/color_constants.dart';

class InterestUniversityAutism extends StatefulWidget {
  @override
  _InterestUniversityAutismState createState() =>
      _InterestUniversityAutismState();
}

class Interest {
  final String name;
  final List<Interest> subInterests;

  Interest(this.name, [this.subInterests = const []]);
}

class _InterestUniversityAutismState extends State<InterestUniversityAutism> {
  final List<Interest> interests = [
    Interest('Sciences et Recherche', [
      Interest('Recherche Fondamentale et Appliquée'),
      Interest('Sciences de la Vie et Biomédicales'),
      Interest('Sciences de l\'Environnement et Écologie'),
      Interest('Astronomie et Sciences Spatiales'),
      Interest('Sciences Mathématiques et Informatiques'),
      Interest('Chimie et Sciences des Matériaux'),
      Interest('Projets de Recherche Interdisciplinaires'),
      Interest('Séminaires, Conférences et Ateliers'),
    ]),
    Interest('Technologie et Informatique', [
      Interest('Développement Logiciel et Programmation'),
      Interest('Systèmes d\'Information et Bases de Données'),
      Interest('Réseaux et Sécurité Informatique'),
      Interest('Intelligence Artificielle et Machine Learning'),
      Interest('Développement Web et Conception UX/UI'),
      Interest('Technologies Émergentes et Innovations'),
      Interest('Projets et Ateliers Technologiques'),
    ]),
    Interest('Arts et Design', [
      Interest('Beaux-Arts et Arts Visuels'),
      Interest('Design Graphique et Multimédia'),
      Interest('Photographie et Vidéographie'),
      Interest('Design d\'Espace et d\'Intérieur'),
      Interest('Mode et Design Textile'),
      Interest('Arts Numériques et Nouveaux Médias'),
      Interest('Théorie et Critique d\'Art'),
      Interest('Projets et Expositions Artistiques'),
    ]),
    Interest('Langues et Littérature', [
      Interest('Littérature et Analyse Textuelle'),
      Interest('Langues Étrangères et Linguistique'),
      Interest('Traduction et Interprétation'),
      Interest('Littérature Comparée et Études Interculturelles'),
      Interest('Écriture Créative et Composition'),
      Interest('Études Théâtrales et Narratives'),
      Interest('Projets et Recherches en Langues et Littérature'),
    ]),
    Interest('Sciences Humaines et Sociales', [
      Interest('Psychologie et Comportement Humain'),
      Interest('Sociologie et Études Sociales'),
      Interest('Anthropologie et Études Culturelles'),
      Interest('Économie et Sciences Politiques'),
      Interest('Philosophie et Éthique'),
      Interest('Histoire et Études Patrimoniales'),
      Interest('Communication et Médias'),
      Interest('Projets de Recherche et Engagement Communautaire'),
    ]),
    Interest('Gestion et Économie', [
      Interest('Théorie Économique et Applications'),
      Interest('Gestion d\'Entreprise et Administration'),
      Interest('Finance et Comptabilité'),
      Interest('Marketing et Communication Commerciale'),
      Interest('Économie Internationale et Commerce'),
      Interest('Entrepreneuriat et Innovation'),
      Interest('Ressources Humaines et Comportement Organisationnel'),
      Interest('Projets et Études de Cas en Gestion'),
    ]),
    Interest('Droit et Études Juridiques', [
      Interest('Droit Civil et Commercial'),
      Interest('Droit Pénal et Criminologie'),
      Interest('Droit Public et Constitutionnel'),
      Interest('Droit International et Droits de l\'Homme'),
      Interest('Droit de la Propriété Intellectuelle et Technologie'),
      Interest('Études Juridiques Théoriques et Méthodologie'),
      Interest('Droit de l\'Environnement et Développement Durable'),
      Interest('Pratique Juridique et Cliniques de Droit'),
    ]),
    Interest('Santé et Bien-être', [
      Interest('Sciences Médicales et Recherche en Santé'),
      Interest('Santé Mentale et Psychologie Clinique'),
      Interest('Santé Publique et Épidémiologie'),
      Interest('Nutrition et Diététique'),
      Interest('Activité Physique et Kinésiologie'),
      Interest('Médecines Alternatives et Thérapies Complémentaires'),
      Interest('Gestion et Administration de la Santé'),
      Interest('Projets de Recherche et Pratiques en Santé'),
    ]),
    Interest('Environnement et Développement Durable', [
      Interest('Écologie et Sciences de l\'Environnement'),
      Interest('Changement Climatique et Études Atmosphériques'),
      Interest('Développement Durable et Politiques Environnementales'),
      Interest('Gestion des Déchets et Économie Circulaire'),
      Interest('Énergie Renouvelable et Technologies Propres'),
      Interest('Agriculture Durable et Sécurité Alimentaire'),
      Interest('Urbanisme Durable et Aménagement du Territoire'),
      Interest('Éducation et Sensibilisation à l\'Environnement'),
    ]),
    Interest('Médias et Communication', [
      Interest('Journalisme et Reportage'),
      Interest('Communication et Relations Publiques'),
      Interest('Médias Numériques et Technologie de l\'Information'),
      Interest('Théorie des Médias et Études Culturelles'),
      Interest('Production Audiovisuelle et Cinématographique'),
      Interest('Communication Interculturelle et Internationale'),
      Interest('Rédaction et Écriture Créative'),
      Interest('Projets et Expériences en Médias'),
    ]),
    Interest('Loisirs et Hobbies', [
      Interest('Arts et Artisanat'),
      Interest('Musique et Performance'),
      Interest('Photographie et Vidéographie'),
      Interest('Cuisine et Gastronomie'),
      Interest('Activités en Plein Air et Nature'),
      Interest('Jeux, Puzzles et Divertissements'),
      Interest('Lecture et Littérature'),
      Interest('Sports et Activités Physiques'),
      Interest('Technologie et Informatique'),
    ]),
    Interest('Activités Communautaires et Engagement Social', [
      Interest('Volontariat et Bénévolat'),
      Interest('Activisme et Plaidoyer'),
      Interest('Participation Communautaire et Leadership'),
      Interest('Éducation et Sensibilisation'),
      Interest('Travail avec des Groupes Spécifiques'),
      Interest('Développement Durable et Projets Écologiques'),
      Interest('Art et Culture dans la Communauté'),
      Interest('Soutien aux Initiatives Locales et Régionales'),
    ]),
    Interest('Études Religieuses et Spirituelles', [
      Interest('Traditions et Histoire Religieuses'),
      Interest('Théologie et Philosophie Religieuse'),
      Interest('Pratiques Spirituelles et Méditatives'),
      Interest('Religions et Société'),
      Interest('Textes Sacrés et Littérature Religieuse'),
      Interest('Rituel, Cérémonie et Pratique Religieuse'),
      Interest('Études Interdisciplinaires en Religion'),
      Interest('Projets et Recherches en Études Religieuses'),
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
