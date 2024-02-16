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
      Interest('Sciences Naturelles et Biologiques', [
        Interest('Biotechnologie et Ingénierie Génétique'),
        Interest('Neurosciences et Comportement'),
        Interest('Écologie et Conservation de la Biodiversité'),
        Interest('Bioinformatique et Biologie Computationnelle'),
        Interest('Pharmacologie et Découverte de Médicaments'),
        Interest('Biologie du Développement et Régénération'),
        Interest('Immunologie et Maladies Infectieuses'),
        Interest(
            'Changement Climatique et Impact sur les Systèmes Biologiques'),
      ]),
      Interest('Physique et Astronomie', [
        Interest('Physique Théorique et Mathématique'),
        Interest('Cosmologie et Astrophysique'),
        Interest('Physique des Particules et Accélérateurs'),
        Interest('Astrophysique des Hautes Énergies'),
        Interest('Observation Astronomique et Instrumentation'),
        Interest('Physique de la Matière Condensée et Matériaux'),
        Interest('Dynamique des Systèmes Planétaires et Exoplanètes'),
        Interest('Climatologie Spatiale et Physique du Soleil'),
      ]),
      Interest('Chimie et Biochimie', [
        Interest('Chimie Organique et Synthèse'),
        Interest('Chimie Inorganique et Matériaux'),
        Interest('Chimie Physique et Théorique'),
        Interest('Biochimie et Biologie Moléculaire'),
        Interest('Chimie Analytique et Instrumentation'),
        Interest('Chimie Verte et Développement Durable'),
        Interest('Nanochimie et Nanotechnologie'),
        Interest('Pharmacochimie et Conception de Médicaments'),
      ]),
      Interest('Mathématiques et Statistiques', [
        Interest('Analyse Mathématique'),
        Interest('Algèbre et Géométrie'),
        Interest('Théorie des Probabilités et Statistiques Mathématiques'),
        Interest('Mathématiques Appliquées et Modélisation'),
        Interest('Cryptographie et Sécurité de l\'Information'),
        Interest('Optimisation et Recherche Opérationnelle'),
        Interest('Statistiques Computationnelles et Science des Données'),
        Interest('Théorie des Nombres et Cryptographie'),
      ]),
      Interest('Sciences de la Terre et Géosciences', [
        Interest('Géologie et Géophysique'),
        Interest('Climatologie et Sciences de l\'Atmosphère'),
        Interest('Hydrologie et Ressources en Eau'),
        Interest('Géochemie et Pétrologie'),
        Interest('Paléontologie et Stratigraphie'),
        Interest('Gestion des Risques Naturels et Géorisques'),
        Interest('Géomatique et Télédétection'),
        Interest('Écologie du Paysage et Géobiologie'),
      ]),
      Interest('Sciences de l\'Environnement et Développement Durable', [
        Interest('Gestion des Ressources Naturelles'),
        Interest('Changement Climatique et Atténuation'),
        Interest('Énergies Renouvelables et Technologies Propres'),
        Interest('Écologie Industrielle et Économie Circulaire'),
        Interest('Pollution Environnementale et Contrôle'),
        Interest('Géographie Environnementale et Analyse Spatiale'),
        Interest('Politiques et Gouvernance Environnementales'),
        Interest('Impact Environnemental et Évaluations de la Durabilité'),
      ]),
      Interest('Informatique et Sciences de l\'Information', [
        /*
1.7.1	Intelligence Artificielle et Apprentissage Automatique
1.7.2	Cybersécurité et Cryptographie
1.7.3	Science des Données et Analytique Big Data
1.7.4	Systèmes Distribués et Cloud Computing
1.7.5	Réseaux de Communication et Internet des Objets (IoT)
1.7.6	Développement de Logiciels et Ingénierie des Systèmes
1.7.7	Interface Homme-Machine et Interaction Utilisateur
1.7.8	Réalité Virtuelle et Augmentée

         */
      ]),
      Interest('Ingénierie et Technologie', [
        /*
1.8.1	Ingénierie Mécanique et Aéronautique
1.8.2	Génie Électrique et Électronique
1.8.3	Ingénierie Informatique et Logicielle
1.8.4	Biotechnologie et Ingénierie Biomédicale
1.8.5	Matériaux Avancés et Nanotechnologie
1.8.6	Énergies Renouvelables et Systèmes Énergétiques Durables
1.8.7	Robotique et Systèmes Autonomes
1.8.8	Ingénierie de l'Environnement et Gestion des Ressources

         */
      ]),
      Interest('Sciences Médicales et Recherche en Santé', [
        /*
1.9.1	Recherche Biomédicale Avancée
1.9.2	Neurosciences et Troubles Cognitifs
1.9.3	Oncologie et Recherche sur le Cancer
1.9.4	Épidémiologie et Santé Publique
1.9.5	Biotechnologie et Thérapie Génique
1.9.6	Pharmacologie Clinique et Développement de Médicaments
1.9.7	Systèmes de Santé et Politiques de Santé
1.9.8	Technologies de l'Information en Santé

         */
      ]),
    ]),
    Interest('Avancées et Recherche', [
      Interest('Recherche en Sciences Fondamentales', [
        /*
2.1.1	Physique Théorique
2.1.2	Chimie Quantique et Spectroscopie
2.1.3	Biologie Moléculaire et Génétique
2.1.4	Mathématiques Pures et Appliquées
2.1.5	Astronomie et Astrophysique
2.1.6	Géosciences et Planétologie
2.1.7	Informatique Théorique et Algorithmique
2.1.8	Sciences des Matériaux et Nanotechnologie

         */
      ]),
      Interest('Innovation Technologique et Ingénierie', [
        /*
2.2.1	Robotique et Automatisation
2.2.2	Intelligence Artificielle et Apprentissage Profond
2.2.3	Énergies Renouvelables et Systèmes Énergétiques Durables
2.2.4	Matériaux Avancés et Nanotechnologie
2.2.5	Technologies de l'Information et Cybersécurité
2.2.6	Génie Biologique et Médical
2.2.7	Technologie Spatiale et Exploration
2.2.8	Innovation en Ingénierie Civile et Construction Durable

         */
      ]),
      Interest('Sciences Informatiques et Analyse de Données', [
        /*
2.3.1	Intelligence Artificielle et Apprentissage Automatique
2.3.2	Science des Données et Big Data
2.3.3	Cybersécurité et Cryptographie
2.3.4	Systèmes Distribués et Cloud Computing
2.3.5	Analytique Web et SEO
2.3.6	Visualisation de Données et Interface Utilisateur
2.3.7	Réseaux Neuronaux et Traitement du Langage Naturel (TAL)
2.3.8	Blockchain et Technologies Distribuées

         */
      ]),
      Interest('Sciences de l\'Environnement et Changement Climatique', [
        /*
2.4.1	Modélisation Climatique et Prévisions
2.4.2	Écologie et Biodiversité
2.4.3	Gestion des Ressources Naturelles
2.4.4	Énergies Renouvelables et Transition Énergétique
2.4.5	Politiques et Gouvernance du Changement Climatique
2.4.6	Vulnérabilité et Adaptation au Changement Climatique
2.4.7	Économie Environnementale et Sociale du Changement Climatique
2.4.8	Innovation Technologique pour la Durabilité

         */
      ]),
      Interest('Recherche Médicale et Santé', [
        /*
2.5.1	Innovations en Biotechnologie et Thérapie Génique
2.5.2	Neurosciences Translationnelles et Troubles Neurodéveloppementaux
2.5.3	Oncologie Moléculaire et Personnalisée
2.5.4	Épidémiologie et Santé Publique Globale
2.5.5	Pharmacologie Clinique et Découverte de Médicaments
2.5.6	Technologies Médicales et Diagnostiques Avancées
2.5.7	Systèmes de Santé et Politiques de Santé
2.5.8	Santé Mentale et Approches Thérapeutiques Innovantes

         */
      ]),
      Interest('Sciences Sociales et Humaines', [
        /*
2.6.1	Psychologie Cognitive et Neuropsychologie
2.6.2	Sociologie et Changement Social
2.6.3	Anthropologie Culturelle et Ethnographie
2.6.4	Études de Genre et Sexualité
2.6.5	Philosophie Éthique et Politique
2.6.6	Histoire Contemporaine et Analyse Critique
2.6.7	Économie Politique et Développement
2.6.8	Communication et Médias

         */
      ]),
      Interest('Économie et Gestion', [
        /*
2.7.1	Économie Théorique et Appliquée
2.7.2	Finance Quantitative et Gestion des Risques
2.7.3	Économie du Développement et Politiques Publiques
2.7.4	Marketing Stratégique et Comportement du Consommateur
2.7.5	Entrepreneuriat et Innovation
2.7.6	Management Stratégique et Leadership
2.7.7	Économie Environnementale et Développement Durable
2.7.8	Analyse de Données et Intelligence d'Affaires

         */
      ]),
      Interest('Arts, Culture et Patrimoine', [
        /*
2.8.1	Conservation et Gestion du Patrimoine
2.8.2	Études Muséales et Curatoriales
2.8.3	Arts Visuels et Performances
2.8.4	Cinématographie et Études Filmiques
2.8.5	Littérature Comparée et Critique Textuelle
2.8.6	Philosophie de l'Art et Esthétique
2.8.7	Anthropologie Culturelle et Études Patrimoniales
2.8.8	Archéologie et Reconstitution Historique

         */
      ]),
      Interest('Projets de Recherche Interdisciplinaires', [
        /*
2.9.1	Innovation en Santé Globale et Médecine
2.9.2	Durabilité Environnementale et Écotechnologies
2.9.3	Technologies Éducatives et Apprentissage Numérique
2.9.4	Art, Technologie et Société
2.9.5	Sciences Cognitives et Intelligence Artificielle
2.9.6	Changement Climatique, Politique et Économie
2.9.7	Éthique, Technologie et Société
2.9.8	Urbanisme, Architecture et Durabilité

         */
      ]),
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
