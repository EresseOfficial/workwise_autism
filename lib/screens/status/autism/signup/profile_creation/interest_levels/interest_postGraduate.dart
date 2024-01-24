import 'package:flutter/material.dart';
import 'package:workwise_autism/widgets/color_constants.dart';

class InterestPostGraduateAutism extends StatefulWidget {
  @override
  _InterestPostGraduateAutismState createState() =>
      _InterestPostGraduateAutismState();
}

class Interest {
  final String name;
  final List<Interest> subInterests;

  Interest(this.name, [this.subInterests = const []]);
}

class _InterestPostGraduateAutismState
    extends State<InterestPostGraduateAutism> {
  final List<Interest> interests = [
    Interest('Sciences', [
      Interest('Sciences Naturelles et Biologiques'),
      Interest('Physique et Astronomie'),
      Interest('Chimie et Biochimie'),
      Interest('Mathématiques et Statistiques'),
      Interest('Sciences de la Terre et Géosciences'),
      Interest('Sciences de l\'Environnement et Développement Durable'),
      Interest('Informatique et Sciences de l\'Information'),
      Interest('Ingénierie et Technologie'),
      Interest('Sciences Médicales et Recherche en Santé'),
    ]),
    Interest('Avancées et Recherche', [
      Interest('Recherche en Sciences Fondamentales'),
      Interest('Innovation Technologique et Ingénierie'),
      Interest('Sciences Informatiques et Analyse de Données'),
      Interest('Sciences de l\'Environnement et Changement Climatique'),
      Interest('Recherche Médicale et Santé'),
      Interest('Sciences Sociales et Humaines'),
      Interest('Économie et Gestion'),
      Interest('Arts, Culture et Patrimoine'),
      Interest('Projets de Recherche Interdisciplinaires'),
    ]),
    Interest('Technologie et Informatique', [
      Interest('Développement Logiciel et Programmation'),
      Interest('Intelligence Artificielle et Apprentissage Automatique'),
      Interest('Cybersécurité et Sécurité Informatique'),
      Interest('Informatique Théorique et Algorithmique'),
      Interest('Technologies Émergentes et Innovation'),
      Interest('Réseaux et Systèmes de Communication'),
      Interest('Robotique et Automatisation'),
      Interest('Visualisation de Données et Interfaces Utilisateur'),
      Interest('Projets de Recherche et Développement'),
    ]),
    Interest('Arts, Design et Créativité', [
      Interest('Arts Visuels et Peinture'),
      Interest('Design Graphique et Visuel'),
      Interest('Arts Numériques et Multimédia'),
      Interest('Photographie et Vidéographie'),
      Interest('Design d\'Intérieur et Architecture'),
      Interest('Mode et Design Textile'),
      Interest('Théâtre, Danse et Performance'),
      Interest('Musique et Composition'),
      Interest('Artisanat et Métiers d\'Art'),
    ]),
    Interest('Sciences Humaines et Sociales', [
      Interest('Psychologie et Sciences Cognitives'),
      Interest('Sociologie et Anthropologie'),
      Interest('Sciences Politiques et Relations Internationales'),
      Interest('Histoire et Patrimoine Culturel'),
      Interest('Philosophie et Éthique'),
      Interest('Études de Genre et Sexualité'),
      Interest('Économie et Développement'),
      Interest('Médias, Communication et Culture'),
      Interest('Éducation et Pédagogie'),
    ]),
    Interest('Gestion, Économie et Finance', [
      Interest('Management et Leadership d\'Entreprise'),
      Interest('Économie Avancée et Politique Économique'),
      Interest('Finance et Analyse Financière'),
      Interest('Comptabilité et Audit'),
      Interest('Marketing et Recherche de Marché'),
      Interest('Entrepreneuriat et Innovation'),
      Interest('Ressources Humaines et Développement Organisationnel'),
      Interest('Économie Internationale et Commerce Global'),
      Interest('Éthique des Affaires et Responsabilité Sociale'),
    ]),
    Interest('Droit et Études Juridiques', [
      Interest('Droit International et Droits Humains'),
      Interest('Droit des Affaires et Commerce International'),
      Interest('Droit Pénal et Criminologie'),
      Interest('Droit de la Propriété Intellectuelle et de l\'Innovation'),
      Interest('Droit de l\'Environnement et Développement Durable'),
      Interest('Droit Fiscal et Financier'),
      Interest('Droit du Travail et Relations Sociales'),
      Interest('Droit de la Famille et du Patrimoine'),
      Interest('Études Juridiques Interdisciplinaires'),
    ]),
    Interest('Santé, Bien-être et Sciences de la Vie', [
      Interest('Médecine et Sciences Médicales'),
      Interest('Neurosciences et Psychologie'),
      Interest('Santé Publique et Épidémiologie'),
      Interest('Nutrition et Diététique'),
      Interest('Pharmacologie et Pharmacie'),
      Interest('Santé Mentale et Bien-être'),
      Interest('Kinésithérapie et Réadaptation'),
      Interest('Sciences Infirmières et Soins de Santé'),
      Interest('Biologie Cellulaire et Moléculaire'),
    ]),
    Interest('Environnement et Développement Durable', [
      Interest('Écologie et Biodiversité'),
      Interest('Gestion de l\'Environnement et Politiques Écologiques'),
      Interest('Changement Climatique et Atténuation'),
      Interest('Énergie Renouvelable et Technologies Vertes'),
      Interest('Gestion des Ressources Naturelles'),
      Interest('Développement Durable et Planification Urbaine'),
      Interest('Économie Environnementale et Sociale'),
      Interest('Agriculture Durable et Sécurité Alimentaire'),
      Interest('Éducation et Sensibilisation à l\'Environnement'),
    ]),
    Interest('Éducation et Pédagogie', [
      Interest('Théories de l\'Éducation et Approches Pédagogiques'),
      Interest('Éducation Spécialisée et Besoins Particuliers'),
      Interest('Développement Curriculaire et Évaluation'),
      Interest('Formation des Enseignants et Développement Professionnel'),
      Interest('Technologies de l\'Éducation et E-Learning'),
      Interest('Éducation Multiculturelle et Globale'),
      Interest('Éducation pour le Développement Durable'),
      Interest('Psychologie de l\'Éducation et Conseil'),
      Interest('Recherche en Éducation et Politiques Éducatives'),
    ]),
    Interest('Médias, Communication et Culture', [
      Interest('Théorie et Études des Médias'),
      Interest('Communication et Relations Publiques'),
      Interest('Journalisme et Reportage'),
      Interest('Production et Analyse de Contenu'),
      Interest('Culture et Industries Culturelles'),
      Interest('Communication Interculturelle et Globale'),
      Interest('Technologies de l\'Information et de la Communication (TIC)'),
      Interest('Marketing et Communication Commerciale'),
      Interest('Éducation aux Médias et Littératie Numérique'),
    ]),
    Interest('Langues, Littérature et Études Interculturelles', [
      Interest('Linguistique et Philologie'),
      Interest('Littérature et Critique Littéraire'),
      Interest('Études Interculturelles et Transnationales'),
      Interest('Traduction et Interprétation'),
      Interest('Langues Étrangères et Acquisition de Langues'),
      Interest('Études Régionales et Culturelles'),
      Interest('Littérature pour Enfants et Jeunes Adultes'),
      Interest('Médias et Littérature Numérique'),
      Interest('Écriture Créative et Composition'),
    ]),
    Interest('Sciences Politiques et Relations Internationales', [
      Interest('Théorie Politique et Philosophie Politique'),
      Interest('Politique Comparée et Systèmes Politiques'),
      Interest('Relations Internationales et Diplomatie'),
      Interest('Géopolitique et Études Stratégiques'),
      Interest('Économie Politique Internationale'),
      Interest('Politique Environnementale et Développement Durable'),
      Interest('Droits Humains et Justice Globale'),
      Interest('Médias, Opinion Publique et Communication Politique'),
      Interest('Études de Genre et Politique'),
    ]),
    Interest('Études Religieuses et Spirituelles', [
      Interest('Théologie et Textes Sacrés'),
      Interest('Histoire des Religions et Mouvements Religieux'),
      Interest('Spiritualité et Pratiques Méditatives'),
      Interest('Religions et Société'),
      Interest('Philosophie et Éthique Religieuses'),
      Interest('Religions et Environnement'),
      Interest('Psychologie de la Religion'),
      Interest('Art, Culture et Religion'),
      Interest('Religion et Politique'),
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
