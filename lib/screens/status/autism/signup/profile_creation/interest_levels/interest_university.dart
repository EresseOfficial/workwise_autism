import 'package:flutter/material.dart';
import 'package:workwise_autism/screens/status/autism/signup/profile_creation/profile_customization.dart';
import 'package:workwise_autism/widgets/color_constants.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class InterestUniversityAutism extends StatefulWidget {
  @override
  _InterestUniversityAutismState createState() => _InterestUniversityAutismState();
}

class Interest {
  final String name;
  final List<Interest> subInterests;

  Interest(this.name, [this.subInterests = const []]);
}

class _InterestUniversityAutismState extends State<InterestUniversityAutism> {
  final List<Interest> interests = [
    Interest('Sciences et Recherche', [
      Interest('Recherche Fondamentale et Appliquée', [
        Interest('Théories et Modèles Scientifiques'),
        Interest('Méthodologies de Recherche Avancées'),
        Interest('Développement Technologique et Innovation'),
        Interest('Études Interdisciplinaires'),
        Interest('Publication et Communication Scientifique'),
        Interest('Collaboration Internationale et Réseaux de Recherche'),
        Interest('Éthique et Responsabilité en Recherche'),
        Interest('Financement et Gestion de Projets de Recherche'),
      ]),
      Interest('Sciences de la Vie et Biomédicales', [
        Interest('Biologie Moléculaire et Cellulaire'),
        Interest('Génétique et Génomique'),
        Interest('Biotechnologie et Ingénierie Génétique'),
        Interest('Neurosciences et Comportement'),
        Interest('Physiologie et Anatomie Humaine'),
        Interest('Immunologie et Maladies Infectieuses'),
        Interest('Pharmacologie et Thérapeutique'),
        Interest('Santé Publique et Épidémiologie'),
        Interest('Recherche en Cancérologie'),
        Interest('Bioéthique et Réglementation Biomédicale'),
      ]),
      Interest('Sciences de l\'Environnement et Écologie', [
        Interest('Écologie Fondamentale'),
        Interest('Changement Climatique et Impact Environnemental'),
        Interest('Conservation et Gestion des Ressources Naturelles'),
        Interest('Pollution et Contrôle de la Qualité de l\'Environnement'),
        Interest('Écologie Urbaine et Paysages Modifiés par l\'Homme'),
        Interest('Agriculture Durable et Systèmes Alimentaires'),
        Interest('Écologie Marine et Aquatique'),
        Interest('Énergie Renouvelable et Technologies Environnementales'),
        Interest('Éthique Environnementale et Justice Sociale'),
        Interest('Modélisation Environnementale et Analyse de Données'),
      ]),
      Interest('Astronomie et Sciences Spatiales', [
        Interest('Observation et Télescopes'),
        Interest('Système Solaire et Planétologie'),
        Interest('Étoiles et Galaxies'),
        Interest('Cosmologie et Univers'),
        Interest('Astrophysique'),
        Interest('Exploration Spatiale et Satellites'),
        Interest('Exobiologie et Habitabilité'),
        Interest('Physique des Hautes Énergies et Particules'),
        Interest('Technologie et Instrumentation Spatiales'),
        Interest('Ateliers et Projets de Recherche'),
      ]),
      Interest('Sciences Mathématiques et Informatiques', [
        Interest('Théorie des Nombres et Algèbre'),
        Interest('Analyse Mathématique'),
        Interest('Géométrie et Topologie'),
        Interest('Statistiques et Probabilités'),
        Interest('Informatique Théorique'),
        Interest('Programmation et Développement Logiciel'),
        Interest('Intelligence Artificielle et Apprentissage Automatique'),
        Interest('Systèmes d\'Information et Bases de Données'),
        Interest('Cybersécurité et Cryptographie'),
        Interest('Projets de Recherche en Mathématiques et Informatique'),
      ]),
      Interest('Chimie et Sciences des Matériaux', [
        Interest('Chimie Organique et Inorganique'),
        Interest('Chimie Physique et Théorique'),
        Interest('Biochimie et Biologie Moléculaire'),
        Interest('Nanotechnologie et Nanosciences'),
        Interest('Matériaux Avancés et Ingénierie des Matériaux'),
        Interest('Chimie Analytique et Instrumentation'),
        Interest('Chimie Verte et Chimie Durable'),
        Interest('Électrochimie et Chimie des Surfaces'),
        Interest('Spectroscopie et Cristallographie'),
      ]),
      Interest('Projets de Recherche Interdisciplinaires', [
        Interest('Innovation en Technologie et Science'),
        Interest('Études Environnementales Intégrées'),
        Interest('Santé Globale et Médecine'),
        Interest('Neurosciences et Psychologie'),
        Interest('Économie et Société'),
        Interest('Arts, Culture et Technologie'),
        Interest('Éducation et Apprentissage'),
        Interest('Éthique, Droit et Technologie'),
        Interest('Développement Urbain et Planification'),
      ]),
      Interest('Séminaires, Conférences et Ateliers', [
        Interest('Séminaires Académiques'),
        Interest('Conférences Interdisciplinaires'),
        Interest('Ateliers Pratiques'),
        Interest('Séries de Webinaires'),
        Interest('Groupes de Discussion et Panels'),
        Interest('Symposiums et Colloques'),
        Interest('Ateliers de Développement de Carrière'),
        Interest('Rencontres avec des Professionnels et Mentors'),
      ]),
    ]),
    Interest('Technologie et Informatique', [
      Interest('Développement Logiciel et Programmation', [
        Interest('Langages de Programmation'),
        Interest('Développement Front-End'),
        Interest('Développement Back-End'),
        Interest('Développement de Logiciels Embarqués'),
        Interest('Ingénierie Logicielle'),
        Interest('Développement d\'Applications Mobiles'),
        Interest('Intelligence Artificielle et Apprentissage Automatique'),
        Interest('Développement de Jeux Vidéo'),
        Interest('Sécurité Informatique dans le Développement'),
        Interest('Projets Collaboratifs et Open Source'),
      ]),
      Interest('Systèmes d\'Information et Bases de Données', [
        Interest('Conception et Modélisation de Bases de Données'),
        Interest('Administration de Bases de Données'),
        Interest('Systèmes de Gestion de Bases de Données (SGBD)'),
        Interest('Entrepôts de Données et Data Mining'),
        Interest('Big Data et Technologies de Traitement'),
        Interest('Systèmes d\'Information Géographique (SIG)'),
        Interest('Systèmes d\'Information d\'Entreprise'),
        Interest('Cybersécurité des Données et des Systèmes d\'Information'),
        Interest('Visualisation de Données et Tableaux de Bord'),
        Interest('Intégration de Systèmes et Middleware'),
      ]),
      Interest('Réseaux et Sécurité Informatique', [
        Interest('Fondamentaux des Réseaux Informatiques'),
        Interest('Cryptographie et Sécurité des Données'),
        Interest('Sécurité des Réseaux et Protocoles'),
        Interest('Détection des Intrusions et Réponse aux Incidents'),
        Interest('Gestion des Identités et des Accès'),
        Interest('Audit de Sécurité et Conformité'),
        Interest('Sécurité des Applications Web et Mobiles'),
        Interest('Sécurité Cloud et Virtualisation'),
        Interest('Formation et Sensibilisation à la Sécurité'),
        Interest('Recherche en Sécurité Informatique'),
      ]),
      Interest('Intelligence Artificielle et Machine Learning', [
        Interest('Fondamentaux de l\'IA et du ML'),
        Interest('Réseaux de Neurones et Deep Learning'),
        Interest('Traitement Naturel du Langage (NLP)'),
        Interest('Vision par Ordinateur'),
        Interest('Robotique et Systèmes Autonomes'),
        Interest('Ethique et IA Responsable'),
        Interest('Projets Pratiques en IA'),
        Interest('Innovation et Tendances en IA'),
        Interest('Apprentissage par Projets'),
        Interest('Outils et Technologies en IA'),
      ]),
      Interest('Développement Web et Conception UX/UI', [
        Interest('Fondamentaux du Développement Web'),
        Interest('Framework et Bibliothèques'),
        Interest('Conception UX/UI'),
        Interest('Prototypage et Wireframing'),
        Interest('Développement Backend'),
        Interest('Gestion de Projet et Collaboration'),
        Interest('Accessibilité et Conception Inclusive'),
        Interest('Sécurité Web et Meilleures Pratiques'),
        Interest('Développement Mobile et Responsive Design'),
        Interest('Tests Utilisateur et Évaluation UX'),
      ]),
      Interest('Technologies Émergentes et Innovations', [
        Interest('Intelligence Artificielle (IA) et Apprentissage Automatique'),
        Interest('Blockchain et Cryptomonnaies'),
        Interest('Robotique et Automatisation'),
        Interest('Réalité Virtuelle (RV) et Réalité Augmentée (RA)'),
        Interest('Internet des Objets (IoT)'),
        Interest('Technologies Vertes et Durables'),
        Interest('Nanotechnologie et Matériaux Avancés'),
        Interest('Biotechnologie et Ingénierie Génétique'),
        Interest('Impression 3D et Fabrication Numérique'),
        Interest('Cybersécurité et Protection des Données'),
      ]),
      Interest('Projets et Ateliers Technologiques', [
        Interest('Développement de Logiciels et Applications'),
        Interest('Robotique et Systèmes Embarqués'),
        Interest('Intelligence Artificielle et Machine Learning'),
        Interest('Sécurité Informatique et Cybersécurité'),
        Interest('Data Science et Analyse de Données'),
        Interest('Conception Web et UX/UI'),
        Interest('Réalité Virtuelle (VR) et Réalité Augmentée (AR)'),
        Interest('Blockchain et Technologies Décisionnelles'),
        Interest('Électronique et IoT (Internet des Objets)'),
        Interest('Technologies Vertes et Durabilité'),
      ]),
    ]),
    Interest('Arts et Design', [
      Interest('Beaux-Arts et Arts Visuels', [
        Interest('Techniques de Peinture et de Dessin'),
        Interest('Sculpture et Installation'),
        Interest('Photographie Artistique'),
        Interest('Art Numérique et Multimédia'),
        Interest('Gravure et Techniques d\'Impression'),
        Interest('Théorie et Critique d\'Art'),
        Interest('Ateliers et Séminaires d\'Artistes'),
        Interest('Expositions et Présentations'),
        Interest('Art et Technologie'),
        Interest('Pratiques Interdisciplinaires'),
      ]),
      Interest('Design Graphique et Multimédia', [
        Interest('Fondamentaux du Design Graphique'),
        Interest('Design Web et Interface Utilisateur (UI)'),
        Interest('Animation et Effets Visuels'),
        Interest('Design Multimédia et Interactif'),
        Interest('Branding et Identité Visuelle'),
        Interest('Design de Publication et Édition'),
        Interest('Photographie Numérique et Composition'),
        Interest('Projets de Design Collaboratif'),
        Interest('Critique et Théorie du Design'),
        Interest('Portfolio et Présentation Professionnelle'),
      ]),
      Interest('Photographie et Vidéographie', [
        Interest('Techniques de Photographie'),
        Interest('Post-production et Retouche Photo'),
        Interest('Vidéographie et Montage Vidéo'),
        Interest('Direction de Photographie'),
        Interest('Documentaire Photographique et Vidéo'),
        Interest('Photographie d\'Art et Expérimentale'),
        Interest('Vidéo Artistique et Performance'),
        Interest('Critique et Théorie de la Photographie et de la Vidéo'),
        Interest('Projets Collaboratifs et Expositions'),
        Interest('Développement Professionnel et Portfolios'),
      ]),
      Interest('Design d\'Espace et d\'Intérieur', [
        Interest('Principes Fondamentaux du Design d\'Intérieur'),
        Interest('Design Durable et Écologique'),
        Interest('Ergonomie et Conception Adaptative'),
        Interest('Histoire et Théorie du Design d\'Intérieur'),
        Interest('Visualisation et Modélisation 3D'),
        Interest('Design d\'Espaces Commerciaux et de Détail'),
        Interest('Rénovation et Restauration d\'Intérieurs'),
        Interest('Design d\'Exposition et Scénographie'),
        Interest('Projets de Design d\'Intérieur Collaboratifs'),
        Interest(
            'Portfolios de Design d\'Intérieur et Présentations Professionnelles'),
      ]),
      Interest('Mode et Design Textile', [
        Interest('Théories et Histoire de la Mode'),
        Interest('Techniques de Conception Textile'),
        Interest('Création et Développement de Collection'),
        Interest('Durabilité en Mode et Textile'),
        Interest('Marketing et Branding dans la Mode'),
        Interest('Technologie de la Mode et Innovation'),
        Interest('Gestion de la Production de Mode'),
        Interest('Stylisme et Photographie de Mode'),
        Interest('Critique et Analyse de Mode'),
        Interest('Projets Collaboratifs et Interdisciplinaires'),
      ]),
      Interest('Arts Numériques et Nouveaux Médias', [
        Interest('Création Numérique et Infographie'),
        Interest('Animation et Effets Visuels'),
        Interest('Art Vidéo et Multimédia'),
        Interest('Développement de Jeux Vidéo'),
        Interest('Art Interactif et Installations'),
        Interest('Réalité Virtuelle et Réalité Augmentée'),
        Interest('Son Numérique et Musique Électronique'),
        Interest('Performance et Théâtre Numérique'),
        Interest('Critique et Théorie des Médias Numériques'),
        Interest('Projets Collaboratifs en Arts Numériques'),
      ]),
      Interest('Théorie et Critique d\'Art', [
        Interest('Fondements de la Théorie de l\'Art'),
        Interest('Histoire de l\'Art et Mouvements Culturels'),
        Interest('Critique d\'Art Pratique'),
        Interest('Esthétique et Philosophie de l\'Art'),
        Interest('Art Contemporain et Nouveaux Médias'),
        Interest('Relations entre Art, Société et Politique'),
        Interest('Méthodologies de Recherche en Art'),
        Interest('Séminaires et Ateliers'),
        Interest('Expositions et Critique Curatoriale'),
        Interest('Éthique et Responsabilité dans l\'Art'),
      ]),
      Interest('Projets et Expositions Artistiques', [
        Interest('Planification et Gestion de Projets Artistiques'),
        Interest('Création et Développement d\'Expositions'),
        Interest('Collaborations Interdisciplinaires'),
        Interest('Critique et Réflexion sur l\'Art'),
        Interest('Engagement Communautaire et Art Social'),
        Interest('Documentation et Archivage'),
        Interest('Présentations et Performances'),
        Interest('Financement et Soutien des Projets Artistiques'),
        Interest('Analyse Post-Projet et Feedback'),
        Interest('Portfolios Artistiques et Professionnels'),
      ]),
    ]),
    Interest('Langues et Littérature', [
      Interest('Littérature et Analyse Textuelle', [
        Interest('Théorie Littéraire et Critique'),
        Interest('Genres et Formes Littéraires'),
        Interest('Littérature Comparée'),
        Interest('Histoire de la Littérature'),
        Interest('Analyse Textuelle Avancée'),
        Interest('Littérature et Identité'),
        Interest('Écriture Créative et Ateliers'),
        Interest('Littérature et Autres Médias'),
        Interest('Séminaires et Groupes de Lecture'),
        Interest('Recherche et Méthodologie en Littérature'),
      ]),
      Interest('Langues Étrangères et Linguistique', [
        Interest('Acquisition de Langues Étrangères'),
        Interest('Fondements de la Linguistique'),
        Interest('Linguistique Appliquée'),
        Interest('Études Comparatives et Historiques'),
        Interest('Sociolinguistique et Psycholinguistique'),
        Interest('Langues et Technologies'),
        Interest('Projets de Recherche en Linguistique'),
        Interest('Traduction et Interprétation'),
      ]),
      Interest('Traduction et Interprétation', [
        Interest('Fondamentaux de la Traduction'),
        Interest('Interprétation Simultanée et Consécutive'),
        Interest('Traduction Audiovisuelle'),
        Interest('Localisation de Logiciels et de Sites Web'),
        Interest('Traduction Spécialisée'),
        Interest('Éthique et Déontologie de la Traduction'),
        Interest('Ateliers et Projets Pratiques'),
        Interest('Développement Professionnel et Réseautage'),
      ]),
      Interest('Littérature Comparée et Études Interculturelles', [
        Interest('Théories de la Littérature Comparée'),
        Interest('Genres Littéraires à Travers les Cultures'),
        Interest('Littérature Mondiale et Globalisation'),
        Interest('Traduction et Médiation Culturelle'),
        Interest('Identité, Altérité et Postcolonialisme'),
        Interest('Intersections de la Littérature et d\'Autres Disciplines'),
        Interest('Séminaires et Ateliers d\'Écriture'),
        Interest('Projets de Recherche Interdisciplinaires'),
      ]),
      Interest('Écriture Créative et Composition', [
        Interest('Ateliers d\'Écriture Créative'),
        Interest('Techniques Narratives et Stylistiques'),
        Interest('Poésie et Formes Poétiques'),
        Interest('Écriture de Scénario et Dramaturgie'),
        Interest('Publication et Diffusion'),
        Interest('Écriture Numérique et Multimédia'),
        Interest('Littérature et Société'),
        Interest('Recherche et Projet de Thèse en Écriture Créative'),
      ]),
      Interest('Études Théâtrales et Narratives', [
        Interest('Histoire et Théorie du Théâtre'),
        Interest('Dramaturgie et Écriture de Pièces'),
        Interest('Mise en Scène et Direction'),
        Interest('Performance et Techniques d\'Acteur'),
        Interest('Analyse et Critique de Spectacles'),
        Interest('Théâtre Appliqué et Thérapie par le Théâtre'),
        Interest('Narration Multimédia et Numérique'),
        Interest('Projets de Recherche en Études Théâtrales'),
      ]),
      Interest('Projets et Recherches en Langues et Littérature', [
        Interest('Analyse Littéraire Avancée'),
        Interest('Linguistique Appliquée et Théorique'),
        Interest('Comparaison Littéraire et Interculturelle'),
        Interest('Traduction et Adaptation'),
        Interest('Écriture Créative et Ateliers'),
        Interest('Études Narratives et Genres Littéraires'),
        Interest('Histoire de la Littérature et Contextes Culturels'),
        Interest('Projets de Recherche Individuels et de Groupe'),
      ]),
    ]),
    Interest('Sciences Humaines et Sociales', [
      Interest('Psychologie et Comportement Humain', [
        Interest('Théories Psychologiques Fondamentales'),
        Interest('Psychologie du Développement'),
        Interest('Neuropsychologie'),
        Interest('Psychologie Sociale'),
        Interest('Psychopathologie et Thérapies'),
        Interest('Psychologie Expérimentale et Méthodes de Recherche'),
        Interest('Psychologie de la Santé'),
        Interest('Psychologie Appliquée'),
      ]),
      Interest('Sociologie et Études Sociales', [
        Interest('Théorie Sociologique'),
        Interest('Sociologie de la Famille'),
        Interest('Inégalités Sociales et Stratification'),
        Interest('Sociologie Urbaine et Rurale'),
        Interest('Sociologie de l\'Éducation'),
        Interest('Sociologie du Travail et des Organisations'),
        Interest('Médias, Culture, et Société'),
        Interest('Méthodes de Recherche en Sociologie'),
        Interest('Mouvements Sociaux et Changement Social'),
      ]),
      Interest('Anthropologie et Études Culturelles', [
        Interest('Anthropologie Sociale et Culturelle'),
        Interest('Anthropologie Biologique'),
        Interest('Ethnographie et Méthodes de Terrain'),
        Interest('Théories Postcoloniales et Décolonisation'),
        Interest('Globalisation et Mondialisation'),
        Interest('Identité, Genre, et Sexualité'),
        Interest('Religions et Systèmes de Croyance'),
        Interest('Patrimoine Culturel et Muséologie'),
        Interest('Diasporas et Transnationalisme'),
      ]),
      Interest('Économie et Sciences Politiques', [
        Interest('Théories Économiques'),
        Interest('Politique Comparée'),
        Interest('Relations Internationales'),
        Interest('Économie du Développement'),
        Interest('Politiques Publiques et Administration'),
        Interest('Économie Politique'),
        Interest('Théorie Politique'),
        Interest('Globalisation et Mondialisation'),
        Interest('Finance Internationale et Marchés'),
        Interest('Droits Humains et Justice Sociale'),
      ]),
      Interest('Philosophie et Éthique', [
        Interest('Histoire de la Philosophie'),
        Interest('Logique et Pensée Critique'),
        Interest('Éthique et Morale'),
        Interest('Philosophie Politique et Sociale'),
        Interest('Métaphysique et Ontologie'),
        Interest('Épistémologie et Théorie de la Connaissance'),
        Interest('Éthique Appliquée'),
        Interest('Philosophie de l\'Esprit et de la Conscience'),
        Interest('Philosophie des Sciences'),
        Interest('Séminaires et Ateliers Philosophiques'),
      ]),
      Interest('Histoire et Études Patrimoniales', [
        Interest('Histoire Ancienne et Civilisations'),
        Interest('Histoire Médiévale et Renaissance'),
        Interest('Histoire Moderne et Contemporaine'),
        Interest('Études Patrimoniales et Conservation'),
        Interest('Histoire Locale et Régionale'),
        Interest('Archéologie et Paléontologie'),
        Interest('Histoire de l\'Art et Architecture'),
        Interest('Histoire des Idées et Philosophie'),
        Interest('Méthodologie de la Recherche Historique'),
        Interest('Séminaires et Ateliers sur l\'Histoire'),
      ]),
      Interest('Communication et Médias', [
        Interest('Théories de la Communication'),
        Interest('Médias Numériques et Nouvelles Technologies'),
        Interest('Journalisme et Reportage'),
        Interest('Relations Publiques et Communication d\'Entreprise'),
        Interest('Publicité et Marketing Média'),
        Interest('Culture Médiatique et Société'),
        Interest('Études Cinématographiques et Télévisuelles'),
        Interest('Analyse des Médias et Critique'),
        Interest('Communication Interculturelle'),
        Interest('Projets et Recherches en Communication'),
      ]),
      Interest('Projets de Recherche et Engagement Communautaire', [
        Interest('Développement et Conduite de Projets de Recherche'),
        Interest('Participation à des Projets de Recherche Collaboratifs'),
        Interest('Engagement Communautaire et Service Social'),
        Interest('Études sur le Terrain et Immersion Culturelle'),
        Interest('Projets de Sensibilisation et d\'Advocacy'),
        Interest(
            'Volontariat et Stages dans des Organisations Non Gouvernementales'),
        Interest('Évaluation et Amélioration des Programmes Communautaires'),
        Interest('Participation à des Conférences et Ateliers'),
        Interest('Publication et Diffusion de Recherches'),
        Interest('Développement de Compétences Transférables'),
      ]),
    ]),
    Interest('Gestion et Économie', [
      Interest('Théorie Économique et Applications', [
        Interest('Principes de Microéconomie et Macroéconomie'),
        Interest('Économie Internationale et Commerce'),
        Interest('Économie du Développement'),
        Interest('Théorie des Jeux et Stratégie Économique'),
        Interest('Économie Comportementale'),
        Interest('Finance et Économie Financière'),
        Interest('Économie de l\'Environnement et des Ressources'),
        Interest('Politique Économique et Évaluation'),
      ]),
      Interest('Gestion d\'Entreprise et Administration', [
        Interest('Théories de la Gestion'),
        Interest('Comportement Organisationnel'),
        Interest('Stratégie d\'Entreprise'),
        Interest('Gestion des Ressources Humaines'),
        Interest('Finance d\'Entreprise'),
        Interest('Marketing et Gestion des Ventes'),
        Interest('Entrepreneuriat et Innovation'),
        Interest('Éthique des Affaires et Responsabilité Sociale'),
      ]),
      Interest('Finance et Comptabilité', [
        Interest('Principes de Comptabilité'),
        Interest('Analyse Financière'),
        Interest('Gestion de la Trésorerie'),
        Interest('Planification Fiscale et Fiscalité'),
        Interest('Audit et Contrôle Interne'),
        Interest('Finance d\'Entreprise'),
        Interest('Investissements et Marchés Financiers'),
        Interest('Éthique en Finance et Comptabilité'),
      ]),
      Interest('Marketing et Communication Commerciale', [
        Interest('Fondamentaux du Marketing'),
        Interest('Marketing Numérique et Médias Sociaux'),
        Interest('Communication d\'Entreprise'),
        Interest('Comportement du Consommateur'),
        Interest('Stratégies de Marque et Gestion de la Marque'),
        Interest('Publicité et Promotion des Ventes'),
        Interest('Marketing International'),
        Interest('Éthique et Responsabilité Sociale en Marketing'),
      ]),
      Interest('Économie Internationale et Commerce', [
        Interest('Théories de l\'Économie Internationale'),
        Interest('Systèmes et Organisations Commerciales Mondiales'),
        Interest('Finance Internationale et Marchés des Changes'),
        Interest('Stratégies d\'Expansion Globale des Entreprises'),
        Interest('Commerce et Développement Durable'),
        Interest('Économie des Pays Émergents'),
        Interest('Politique Commerciale et Négociations'),
        Interest('Impact du Numérique sur le Commerce International'),
      ]),
      Interest('Entrepreneuriat et Innovation', [
        Interest('Fondements de l\'Entrepreneuriat'),
        Interest('Innovation et Développement de Produits'),
        Interest('Stratégies d\'Entreprise et Modélisation des Affaires'),
        Interest('Financement de l\'Entreprise et Levée de Fonds'),
        Interest('Entrepreneuriat Social et Entreprises Durables'),
        Interest('Gestion des Risques et Échec Entrepreneurial'),
        Interest('Marketing et Stratégies de Marque pour Startups'),
        Interest('Droit des Affaires et Propriété Intellectuelle'),
      ]),
      Interest('Ressources Humaines et Comportement Organisationnel', [
        Interest('Théories du Comportement Organisationnel'),
        Interest('Gestion des Talents et Développement des Compétences'),
        Interest('Psychologie du Travail et Bien-être au Travail'),
        Interest('Diversité et Inclusion dans le Milieu de Travail'),
        Interest('Formation et Développement du Personnel'),
        Interest('Gestion du Changement Organisationnel'),
        Interest('Leadership et Gestion d\'Équipe'),
        Interest('Éthique et Responsabilité Sociale des Entreprises'),
      ]),
      Interest('Projets et Études de Cas en Gestion', [
        Interest('Analyse Stratégique d\'Entreprise'),
        Interest('Gestion de Projet'),
        Interest('Innovation et Développement de Produits'),
        Interest('Marketing et Analyse de Marché'),
        Interest('Finance d\'Entreprise et Investissement'),
        Interest('Gestion des Ressources Humaines'),
        Interest('Leadership et Comportement Organisationnel'),
        Interest('Éthique des Affaires et Responsabilité Sociale'),
      ]),
    ]),
    Interest('Droit et Études Juridiques', [
      Interest('Droit Civil et Commercial', [
        Interest('Principes Fondamentaux du Droit Civil'),
        Interest('Droit des Contrats'),
        Interest('Droit des Sociétés'),
        Interest('Propriété Intellectuelle et Droit Commercial'),
        Interest('Règlement des Litiges Commerciaux'),
        Interest('Droit de la Consommation'),
        Interest('Droit du Travail en Relation avec le Commerce'),
        Interest(
            'Éthique des Affaires et Responsabilité Sociale des Entreprises'),
      ]),
      Interest('Droit Pénal et Criminologie', [
        Interest('Fondements du Droit Pénal'),
        Interest('Procédure Pénale'),
        Interest('Criminologie et Sociologie du Crime'),
        Interest('Justice Pénale et Réforme'),
        Interest('Droit Pénal International'),
        Interest('Victimologie'),
        Interest('Cybercriminalité et Droit Pénal'),
        Interest('Pratiques et Études de Cas'),
      ]),
      Interest('Droit Public et Constitutionnel', [
        Interest('Principes Fondamentaux du Droit Constitutionnel'),
        Interest('Droits de l\'Homme et Libertés Fondamentales'),
        Interest('Droit Administratif et Gouvernance'),
        Interest('Contrôle Constitutionnel et Justice Constitutionnelle'),
        Interest('Fédéralisme et Décentralisation'),
        Interest('Politiques Publiques et Analyse Législative'),
        Interest('Droit de l\'Union Européenne et Intégration Régionale'),
        Interest('Séminaires et Études de Cas'),
      ]),
      Interest('Droit International et Droits de l\'Homme', [
        Interest('Principes Fondamentaux du Droit International'),
        Interest('Organisations Internationales et Gouvernance Globale'),
        Interest('Droits de l\'Homme et Instruments Juridiques'),
        Interest('Droit Humanitaire et Droit des Conflits Armés'),
        Interest('Justice Internationale et Tribunaux'),
        Interest('Droit International de l\'Environnement'),
        Interest('Droit International Économique et Commerce'),
        Interest('Droits des Peuples et Autochtones'),
      ]),
      Interest('Droit de la Propriété Intellectuelle et Technologie', [
        Interest('Fondements du Droit de la Propriété Intellectuelle'),
        Interest('Droit des Brevets et Innovations'),
        Interest('Marques et Stratégies de Branding'),
        Interest('Droit d\'Auteur et Industries Créatives'),
        Interest('Gestion des Droits Numériques'),
        Interest('Cyberdroit et Sécurité en Ligne'),
        Interest('Propriété Intellectuelle et Commerce International'),
        Interest('Innovation, Start-ups et Droit de la Technologie'),
      ]),
      Interest('Études Juridiques Théoriques et Méthodologie', [
        Interest('Théorie du Droit'),
        Interest('Méthodes de Recherche Juridique'),
        Interest('Histoire du Droit'),
        Interest('Philosophie du Droit'),
        Interest('Droit Comparé'),
        Interest('Sociologie du Droit'),
        Interest('Critique Juridique'),
        Interest('Éthique Juridique et Professionnelle'),
      ]),
      Interest('Droit de l\'Environnement et Développement Durable', [
        Interest('Principes Fondamentaux du Droit de l\'Environnement'),
        Interest('Législation et Politiques Environnementales'),
        Interest('Droit de la Biodiversité et Conservation'),
        Interest('Gestion des Ressources Naturelles'),
        Interest('Changement Climatique et Droit'),
        Interest('Droit de l\'Eau et Gestion des Eaux'),
        Interest('Pollution et Contrôle des Polluants'),
        Interest('Éthique Environnementale et Justice Climatique'),
      ]),
      Interest('Pratique Juridique et Cliniques de Droit', [
        Interest('Participation aux Cliniques Juridiques'),
        Interest('Simulation de Procès et Moot Courts'),
        Interest('Stages en Cabinet d\'Avocats ou Institutions Juridiques'),
        Interest('Ateliers de Rédaction Juridique et de Recherche'),
        Interest('Conseil Juridique Pro Bono'),
        Interest('Analyse et Gestion de Cas'),
        Interest('Éthique Professionnelle et Responsabilité'),
        Interest('Préparation à l\'Examen du Barreau'),
      ]),
    ]),
    Interest('Santé et Bien-être', [
      Interest('Sciences Médicales et Recherche en Santé', [
        Interest('Anatomie et Physiologie Humaines'),
        Interest('Biochimie Médicale'),
        Interest('Pharmacologie et Thérapeutique'),
        Interest('Microbiologie et Immunologie'),
        Interest('Recherche Clinique et Méthodes Épidémiologiques'),
        Interest('Santé Publique et Prévention des Maladies'),
        Interest('Neurosciences et Psychiatrie'),
        Interest('Innovation en Sciences Médicales et Biotechnologie'),
      ]),
      Interest('Santé Mentale et Psychologie Clinique', [
        Interest('Fondements de la Psychologie Clinique'),
        Interest('Thérapies Comportementales et Cognitives'),
        Interest('Psychopathologie'),
        Interest('Psychologie de l\'Enfant et de l\'Adolescent'),
        Interest('Psychologie Gérontologique'),
        Interest('Interventions en Crise et Traumatologie'),
        Interest('Approches Thérapeutiques Diversifiées'),
        Interest('Recherche en Psychologie Clinique'),
      ]),
      Interest('Santé Publique et Épidémiologie', [
        Interest('Principes de Santé Publique'),
        Interest('Épidémiologie'),
        Interest('Prévention et Contrôle des Maladies'),
        Interest('Politiques de Santé et Systèmes de Santé'),
        Interest('Santé Environnementale'),
        Interest('Santé Globale'),
        Interest('Évaluation des Interventions en Santé Publique'),
        Interest('Recherche en Santé Publique'),
      ]),
      Interest('Nutrition et Diététique', [
        Interest('Fondements de la Nutrition'),
        Interest('Nutrition Clinique'),
        Interest('Diététique et Planification des Repas'),
        Interest('Nutrition Sportive'),
        Interest('Sécurité Alimentaire et Hygiène'),
        Interest('Politiques Alimentaires et Systèmes Alimentaires'),
        Interest('Nutrition Communautaire et Santé Publique'),
        Interest('Recherche en Nutrition et Diététique'),
      ]),
      Interest('Activité Physique et Kinésiologie', [
        Interest('Principes Fondamentaux de la Kinésiologie'),
        Interest('Évaluation de la Condition Physique'),
        Interest('Prescription de l\'Exercice'),
        Interest('Kinésiologie Appliquée et Thérapie par l\'Exercice'),
        Interest('Nutrition pour l\'Activité Physique'),
        Interest('Psychologie du Sport et de l\'Exercice'),
        Interest('Gestion et Administration des Services Sportifs'),
        Interest(
            'Recherche en Kinésiologie et Sciences de l\'Activité Physique'),
      ]),
      Interest('Médecines Alternatives et Thérapies Complémentaires', [
        Interest('Acupuncture et Médecine Traditionnelle Chinoise'),
        Interest('Naturopathie et Phytothérapie'),
        Interest('Aromathérapie et Huiles Essentielles'),
        Interest('Thérapies Corporelles et Massages'),
        Interest('Yoga et Méditation'),
        Interest('Nutrition Holistique et Alimentation Équilibrée'),
        Interest('Thérapies Énergétiques'),
        Interest(
            'Intégration des Thérapies Alternatives dans la Pratique Clinique'),
      ]),
      Interest('Gestion et Administration de la Santé', [
        Interest('Gestion et Administration de la Santé'),
        Interest('Politiques de Santé Publique'),
        Interest('Économie de la Santé'),
        Interest('Management des Établissements de Santé'),
        Interest('Systèmes d\'Information en Santé'),
        Interest('Qualité et Sécurité des Soins'),
        Interest('Ressources Humaines en Santé'),
        Interest('Éthique et Légalité en Santé'),
        Interest('Innovation en Santé et Changement Organisationnel'),
      ]),
      Interest('Projets de Recherche et Pratiques en Santé', [
        Interest('Projets de Recherche et Pratiques en Santé'),
        Interest('Méthodologies de Recherche en Santé'),
        Interest('Innovation en Technologies de Santé'),
        Interest('Épidémiologie et Surveillance des Maladies'),
        Interest('Santé Globale et Initiatives Internationales'),
        Interest('Prévention et Promotion de la Santé'),
        Interest('Gestion des Soins de Santé et Politiques'),
        Interest('Pratiques Basées sur des Preuves'),
        Interest('Éthique et Jurisprudence en Santé'),
      ]),
    ]),
    Interest('Environnement et Développement Durable', [
      Interest('Écologie et Sciences de l\'Environnement', [
        Interest('Biodiversité et Conservation'),
        Interest('Changement Climatique et Impact Environnemental'),
        Interest('Gestion Durable des Ressources'),
        Interest('Pollution et Toxicologie Environnementale'),
        Interest('Écologie Urbaine et Paysages Anthropiques'),
        Interest('Énergies Renouvelables et Technologies Vertes'),
        Interest('Études d\'Impact Environnemental et Évaluation'),
        Interest('Éducation Environnementale et Sensibilisation'),
      ]),
      Interest('Changement Climatique et Études Atmosphériques', [
        Interest('Modélisation Climatique'),
        Interest('Phénomènes Météorologiques Extrêmes'),
        Interest('Politiques et Économie du Changement Climatique'),
        Interest('Impact du Changement Climatique sur la Biodiversité'),
        Interest(
            'Énergies Renouvelables et Atténuation du Changement Climatique'),
        Interest('Adaptation au Changement Climatique'),
        Interest('Communication et Sensibilisation au Changement Climatique'),
        Interest('Science Atmosphérique et Qualité de l\'Air'),
      ]),
      Interest('Développement Durable et Politiques Environnementales', [
        Interest('Développement Durable et Politiques Environnementales'),
        Interest('Principes du Développement Durable'),
        Interest('Gouvernance Environnementale'),
        Interest('Économie Verte et Circulaire'),
        Interest('Gestion des Ressources Naturelles'),
        Interest('Changement Climatique et Atténuation'),
        Interest('Adaptation aux Changements Environnementaux'),
        Interest('Éducation et Sensibilisation Environnementales'),
        Interest('Politiques de Conservation et Biodiversité'),
      ]),
      Interest('Gestion des Déchets et Économie Circulaire', [
        Interest('Principes et Pratiques de l\'Économie Circulaire'),
        Interest('Technologies de Traitement des Déchets'),
        Interest('Gestion des Déchets Urbains'),
        Interest('Stratégies de Réduction des Déchets'),
        Interest('Recyclage et Valorisation des Matériaux'),
        Interest('Politiques et Réglementations sur les Déchets'),
        Interest('Conception Durable et Éco-conception'),
        Interest('Économie Circulaire et Développement Durable'),
      ]),
      Interest('Énergie Renouvelable et Technologies Propres', [
        Interest('Sources d\'Énergie Renouvelable'),
        Interest('Technologies Solaires'),
        Interest('Énergie Éolienne'),
        Interest('Hydroélectricité et Énergies Maritimes'),
        Interest('Biomasse et Biocarburants'),
        Interest('Réseaux Électriques Intelligents et Stockage d\'Énergie'),
        Interest('Efficacité Énergétique et Conservation'),
        Interest('Politiques et Cadres Réglementaires'),
      ]),
      Interest('Agriculture Durable et Sécurité Alimentaire', [
        Interest('Principes d\'Agriculture Durable'),
        Interest('Systèmes Agroécologiques'),
        Interest('Gestion Intégrée des Nuisibles'),
        Interest('Aquaponie et Hydroponie'),
        Interest('Permaculture et Design de Systèmes Alimentaires'),
        Interest('Sécurité Alimentaire et Accès à l\'Alimentation'),
        Interest('Politiques Agricoles et Alimentaires'),
        Interest('Innovation et Technologie en Agriculture'),
      ]),
      Interest('Urbanisme Durable et Aménagement du Territoire', [
        Interest('Principes d\'Urbanisme Durable'),
        Interest('Gestion des Ressources Naturelles'),
        Interest('Transports et Mobilité Durable'),
        Interest('Énergie et Constructions Écologiques'),
        Interest('Planification et Design Participatif'),
        Interest('Adaptation au Changement Climatique'),
        Interest('Politiques d\'Aménagement du Territoire'),
        Interest('Projets d\'Urbanisme Innovants'),
      ]),
      Interest('Éducation et Sensibilisation à l\'Environnement', [
        Interest('Théories et Modèles d\'Éducation Environnementale'),
        Interest('Programmes de Sensibilisation et Campagnes'),
        Interest('Méthodes d\'Enseignement Innovantes'),
        Interest('Outils et Technologies Éducatives'),
        Interest('Évaluation de l\'Impact Éducatif'),
        Interest('Intégration de l\'Environnement dans les Curriculums'),
        Interest('Développement Durable dans l\'Enseignement Supérieur'),
        Interest('Réseaux et Partenariats Éducatifs'),
      ]),
    ]),
    Interest('Médias et Communication', [
      Interest('Journalisme et Reportage', [
        Interest('Fondamentaux du Journalisme'),
        Interest('Journalisme Multimédia'),
        Interest('Reportage d\'Investigation'),
        Interest('Journalisme de Données'),
        Interest('Couverture de l\'Actualité et Reportage sur le Terrain'),
        Interest('Critique et Analyse Média'),
        Interest('Journalisme Spécialisé'),
        Interest('Éthique et Régulation Média'),
      ]),
      Interest('Communication et Relations Publiques', [
        Interest('Théories de la Communication'),
        Interest('Stratégies de Relations Publiques'),
        Interest('Gestion des Médias Sociaux'),
        Interest('Rédaction et Production de Contenu'),
        Interest('Communication Interculturelle'),
        Interest('Événementiel et Planification de Campagnes'),
        Interest('Analyse et Mesure de l\'Impact'),
        Interest('Éthique et Droit de la Communication'),
      ]),
      Interest('Médias Numériques et Technologie de l\'Information', [
        Interest('Conception et Développement Web'),
        Interest('Création de Contenu Numérique'),
        Interest('Gestion des Systèmes d\'Information'),
        Interest('Sécurité Informatique et Protection des Données'),
        Interest('Intelligence Artificielle et Apprentissage Automatique'),
        Interest('Développement de Logiciels et Programmation'),
        Interest('Réseaux Sociaux et Stratégies de Marketing Numérique'),
        Interest('Analyse des Données et Big Data'),
      ]),
      Interest('Théorie des Médias et Études Culturelles', [
        Interest('Fondements de la Théorie des Médias'),
        Interest('Analyse des Contenus Médias'),
        Interest('Médias Numériques et Société'),
        Interest('Communication Interculturelle'),
        Interest('Politique des Médias et Régulation'),
        Interest('Représentation dans les Médias'),
        Interest('Médias et Mouvements Sociaux'),
        Interest('Culture Populaire et Médias'),
      ]),
      Interest('Production Audiovisuelle et Cinématographique', [
        Interest('Scénarisation et Développement de Contenu'),
        Interest('Techniques de Réalisation et Mise en Scène'),
        Interest('Production et Gestion de Projets'),
        Interest('Cinématographie et Composition Visuelle'),
        Interest('Montage et Post-production'),
        Interest('Son pour le Cinéma et l\'Audiovisuel'),
        Interest('Analyse et Critique Cinématographique'),
        Interest('Distribution et Marketing Cinématographique'),
      ]),
      Interest('Communication Interculturelle et Internationale', [
        Interest('Fondamentaux de la Communication Interculturelle'),
        Interest('Barrières à la Communication Interculturelle'),
        Interest('Communication Globale et Médias'),
        Interest('Étiquette et Protocole International'),
        Interest(
            'Compétences en Communication pour le Développement International'),
        Interest('Langue et Identité'),
        Interest('Projets de Communication Interculturelle'),
        Interest('Communication Interculturelle dans le Cadre Professionnel'),
      ]),
      Interest('Rédaction et Écriture Créative', [
        Interest('Fondamentaux de l\'Écriture Créative'),
        Interest('Ateliers d\'Écriture et Critiques'),
        Interest('Rédaction Avancée et Genres Littéraires'),
        Interest('Narration Numérique et Multimédia'),
        Interest('Écriture Non-Fictionnelle'),
        Interest('Publication et Édition'),
        Interest('Écriture pour les Médias Numériques'),
        Interest('Projets Créatifs Indépendants'),
      ]),
      Interest('Projets et Expériences en Médias', [
        Interest('Production Médiatique Multimodale'),
        Interest('Analyse Critique des Médias'),
        Interest('Journalisme d\'Investigation'),
        Interest('Création de Documentaires'),
        Interest('Développement de Campagnes de Communication'),
        Interest('Gestion des Médias Sociaux'),
        Interest('Technologies de Médias Émergents'),
        Interest('Ateliers et Séminaires Professionnels'),
      ]),
    ]),
    Interest('Loisirs et Hobbies', [
      Interest('Arts et Artisanat', [
        Interest('Techniques Traditionnelles et Contemporaines'),
        Interest('Artisanat et Métiers d\'Art'),
        Interest('Arts Numériques et Multimédia'),
        Interest('Pratiques Artistiques Interdisciplinaires'),
        Interest('Photographie Avancée et Vidéographie'),
        Interest('Sculpture et Installation'),
        Interest('Critique d\'Art et Théorie'),
        Interest('Projets Collectifs et Expositions'),
      ]),
      Interest('Musique et Performance', [
        Interest('Théorie et Composition Musicale'),
        Interest('Histoire de la Musique'),
        Interest('Psychologie de la Musique'),
        Interest('Performance Musicale'),
        Interest('Technologie Musicale'),
        Interest('Ethnomusicologie'),
        Interest('Gestion et Entrepreneuriat Musical'),
        Interest('Musicothérapie'),
      ]),
      Interest('Photographie et Vidéographie', [
        Interest('Techniques de Photographie'),
        Interest('Histoire de la Photographie'),
        Interest('Post-Production et Retouche'),
        Interest('Vidéographie et Cinématographie'),
        Interest('Photographie Documentaire et Journalistique'),
        Interest('Art Conceptuel et Photographie Expérimentale'),
        Interest('Gestion de Projets Visuels'),
        Interest('Photographie Sociale et Engagement Communautaire'),
      ]),
      Interest('Cuisine et Gastronomie', [
        Interest('Techniques Culinaires Avancées'),
        Interest('Histoire et Cultures Alimentaires'),
        Interest('Nutrition et Gastronomie'),
        Interest('Gastronomie Moléculaire'),
        Interest('Gestion et Marketing en Restauration'),
        Interest('Cuisine Durable et Éthique'),
        Interest('Pâtisserie et Boulangerie'),
        Interest('Cuisine du Monde'),
      ]),
      Interest('Activités en Plein Air et Nature', [
        Interest('Randonnée et Trekking'),
        Interest('Observation de la Faune et de la Flore'),
        Interest('Camping et Survie en Milieu Sauvage'),
        Interest('Photographie Naturelle'),
        Interest('Sports Aquatiques et Nautiques'),
        Interest('Cyclisme et VTT'),
        Interest('Escalade et Alpinisme'),
        Interest('Jardinage et Horticulture'),
      ]),
      Interest('Jeux, Puzzles et Divertissements', [
        Interest('Jeux de Société et Stratégie'),
        Interest('Jeux Vidéo et Ludification'),
        Interest('Puzzles et Casse-Têtes'),
        Interest('Jeux de Rôle et Aventure'),
        Interest('Magie et Illusionnisme'),
        Interest('Construction et Modélisme'),
        Interest('Art et Création Numérique'),
        Interest('Échecs et Jeux de Réflexion'),
      ]),
      Interest('Lecture et Littérature', [
        Interest('Littérature Classique et Contemporaine'),
        Interest('Poésie et Composition Poétique'),
        Interest('Théorie et Critique Littéraire'),
        Interest('Littérature pour Enfants et Adolescents'),
        Interest('Narratives Multimédia et Littérature Numérique'),
        Interest('Littératures du Monde et Traduction'),
        Interest('Écriture Créative et Ateliers d\'Écriture'),
        Interest('Bibliothérapie'),
      ]),
      Interest('Sports et Activités Physiques', [
        Interest('Fitness et Entraînement Personnel'),
        Interest('Sports d\'Équipe'),
        Interest('Sports Individuels'),
        Interest('Arts Martiaux et Autodéfense'),
        Interest('Sports de Plein Air et Aventure'),
        Interest('Danse et Expression Corporelle'),
        Interest('Yoga et Mindfulness'),
        Interest('Adaptation et Accessibilité dans le Sport'),
      ]),
      Interest('Technologie et Informatique', [
        Interest('Programmation et Développement Logiciel'),
        Interest('Intelligence Artificielle et Machine Learning'),
        Interest('Cybersécurité et Protection des Données'),
        Interest('Réseaux et Administration Systèmes'),
        Interest('Base de Données et Big Data'),
        Interest('Développement de Jeux Vidéo'),
        Interest('Technologie Blockchain et Cryptomonnaies'),
        Interest('Accessibilité et Conception Inclusive'),
      ]),
    ]),
    Interest('Activités Communautaires et Engagement Social', [
      Interest('Volontariat et Bénévolat', [
        Interest('Volontariat Environnemental'),
        Interest('Bénévolat dans les Organisations Caritatives'),
        Interest('Assistance aux Personnes Âgées et à Mobilité Réduite'),
        Interest('Tutorat et Mentorat Éducatif'),
        Interest('Engagement dans des Projets de Santé Publique'),
        Interest('Volontariat Artistique et Culturel'),
        Interest('Soutien aux Réfugiés et Migrants'),
        Interest('Développement Communautaire et Renforcement des Capacités'),
      ]),
      Interest('Activisme et Plaidoyer', [
        Interest('Droits Humains et Justice Sociale'),
        Interest('Protection de l\'Environnement et Durabilité'),
        Interest('Droits des Animaux et Bien-être Animal'),
        Interest('Santé Mentale et Bien-être'),
        Interest('Éducation et Accès à l\'Information'),
        Interest('Technologie Éthique et Accessibilité Numérique'),
        Interest('Droits des Peuples Autochtones et Protection Culturelle'),
        Interest('Participation Civique et Démocratie'),
      ]),
      Interest('Participation Communautaire et Leadership', [
        Interest('Développement des Compétences de Leadership'),
        Interest('Engagement dans des Associations Étudiantes'),
        Interest('Volontariat Communautaire'),
        Interest('Initiatives de Sensibilisation et de Plaidoyer'),
        Interest('Développement de Projets Communautaires'),
        Interest('Formation en Résolution de Conflits'),
        Interest('Réseautage et Collaboration Intersectorielle'),
        Interest('Développement Durable et Initiatives Écologiques'),
      ]),
      Interest('Éducation et Sensibilisation', [
        Interest('Sensibilisation aux Troubles du Spectre de l\'Autisme (TSA)'),
        Interest('Éducation à la Santé Mentale'),
        Interest('Droits Humains et Éducation Civique'),
        Interest(
            'Sensibilisation à l\'Environnement et au Développement Durable'),
        Interest('Éducation aux Médias et à l\'Information'),
        Interest('Prévention de la Violence et des Abus'),
        Interest('Éducation Sexuelle et Relations Saines'),
        Interest('Accessibilité et Inclusion dans l\'Éducation'),
      ]),
      Interest('Travail avec des Groupes Spécifiques', [
        Interest('Soutien aux Personnes avec des Besoins Spéciaux'),
        Interest('Aide aux Enfants et Adolescents'),
        Interest('Assistance aux Personnes Âgées'),
        Interest('Soutien aux Réfugiés et Migrants'),
        Interest('Engagement avec les Communautés Marginalisées'),
        Interest('Aide aux Victimes de Violence'),
        Interest('Soutien en Santé Mentale'),
        Interest('Participation à des Programmes d\'Éducation Spécialisée'),
      ]),
      Interest('Développement Durable et Projets Écologiques', [
        Interest('Conservation de la Biodiversité'),
        Interest('Agriculture Durable et Permaculture'),
        Interest('Gestion des Ressources Naturelles'),
        Interest('Énergies Renouvelables et Efficacité Énergétique'),
        Interest('Réduction des Déchets et Recyclage'),
        Interest('Changement Climatique et Actions Mitigatrices'),
        Interest('Urbanisme Durable et Mobilité Verte'),
        Interest('Éducation Environnementale et Sensibilisation'),
      ]),
      Interest('Art et Culture dans la Communauté', [
        Interest('Arts Visuels et Expositions'),
        Interest('Musique et Spectacles Vivants'),
        Interest('Théâtre et Arts de la Scène'),
        Interest('Littérature et Ateliers d\'Écriture'),
        Interest('Artisanat et Traditions Culturelles'),
        Interest('Cinéma et Médias Numériques'),
        Interest('Patrimoine Culturel et Histoire Locale'),
        Interest('Art et Inclusion Sociale'),
      ]),
      Interest('Soutien aux Initiatives Locales et Régionales', [
        Interest('Développement Économique Local'),
        Interest('Protection de l\'Environnement et Initiatives Vertes'),
        Interest('Santé Publique et Bien-être'),
        Interest('Éducation et Programmes de Tutorat'),
        Interest('Culture et Arts Communautaires'),
        Interest('Aide Alimentaire et Sécurité Alimentaire'),
        Interest('Inclusion Sociale et Lutte contre l\'Exclusion'),
        Interest('Amélioration des Infrastructures et Services Publics'),
      ]),
    ]),
    Interest('Études Religieuses et Spirituelles', [
      Interest('Traditions et Histoire Religieuses', [
        Interest('Textes Fondamentaux et Interprétations'),
        Interest('Rites et Pratiques Religieuses'),
        Interest('Histoire des Religions'),
        Interest('Théologie et Philosophie Religieuse'),
        Interest('Religions et Société'),
        Interest('Art Religieux et Architecture Sacrée'),
        Interest('Mysticisme et Spiritualité'),
        Interest('Religions, Écologie et Éthique Environnementale'),
      ]),
      Interest('Théologie et Philosophie Religieuse', [
        Interest('Comparaison des Systèmes Théologiques'),
        Interest('Philosophie de la Religion'),
        Interest('Éthique Religieuse'),
        Interest('Mysticisme et Expérience Spirituelle'),
        Interest('Théologie et Sciences'),
        Interest('Religions du Monde et Dialogues Interreligieux'),
        Interest('Histoire de la Pensée Religieuse'),
        Interest('Spiritualité Contemporaine et Nouveaux Mouvements Religieux'),
      ]),
      Interest('Pratiques Spirituelles et Méditatives', [
        Interest('Méditation et Pleine Conscience'),
        Interest('Yoga et Pratiques Corporelles'),
        Interest('Pratiques de Respiration et Relaxation'),
        Interest('Retraites Spirituelles et Immersions'),
        Interest('Spiritualité Quotidienne et Pratiques Rituelles'),
        Interest('Lecture et Réflexion Spirituelle'),
        Interest('Art Thérapie et Expression Créative'),
        Interest('Écospiritualité et Connexion avec la Nature'),
      ]),
      Interest('Religions et Société', [
        Interest('Impact Social des Religions'),
        Interest('Religions et Changements Sociaux'),
        Interest('Pluralisme Religieux et Coexistence'),
        Interest('Religion et Politique'),
        Interest('Religion, Économie et Éthique du Travail'),
        Interest('Religions et Identités Culturelles'),
        Interest('Religion et Médias'),
        Interest('Éthique et Défis Contemporains'),
      ]),
      Interest('Textes Sacrés et Littérature Religieuse', [
        Interest('Exégèse et Herméneutique'),
        Interest('Comparaison des Textes Sacrés'),
        Interest('Histoire de la Littérature Religieuse'),
        Interest('Textes Sacrés et Éthique'),
        Interest('Mythologie et Récits Fondateurs'),
        Interest('Littérature Apocryphe et Pseudepigraphique'),
        Interest('Spiritualité et Littérature Mystique'),
        Interest('Textes Sacrés dans l\'Art et la Culture'),
      ]),
      Interest('Rituel, Cérémonie et Pratique Religieuse', [
        Interest('Structures et Fonctions des Rituels'),
        Interest('Cérémonies de Passage'),
        Interest('Pratiques de Prière et Méditation'),
        Interest('Fêtes Religieuses et Calendriers Liturgiques'),
        Interest('Espaces Sacrés et Pèlerinages'),
        Interest('Objets Sacrés et Symbolisme'),
        Interest('Musique et Chant dans le Culte'),
        Interest('Rituels Alimentaires et Jeûne'),
      ]),
      Interest('Études Interdisciplinaires en Religion', [
        Interest('Religion et Anthropologie'),
        Interest('Religion et Psychologie'),
        Interest('Religion et Sociologie'),
        Interest('Religion et Histoire'),
        Interest('Religion et Philosophie'),
        Interest('Religion et Littérature'),
        Interest('Religion et Politique'),
        Interest('Religion et Sciences'),
      ]),
      Interest('Projets et Recherches en Études Religieuses', [
        Interest('Méthodologies de Recherche en Études Religieuses'),
        Interest('Analyse de Textes Sacrés et Historiques'),
        Interest('Études de Terrain et Ethnographie'),
        Interest('Projet de Recherche Interdisciplinaire'),
        Interest('Analyse Comparative des Religions'),
        Interest('Religion et Société Contemporaine'),
        Interest('Technologie et Médias Numériques en Religion'),
        Interest('Éthique et Questions Morales dans les Traditions Religieuses'),
      ]),
    ]),
  ];

  Interest? selectedInterest;

  Interest? selectedInterestLevel1;
  Interest? selectedInterestLevel2;
  Interest? selectedInterestLevel3;
  List<Interest> subInterestsLevel2 = [];
  List<Interest> subInterestsLevel3 = [];

  void _onSelectedLevel1(Interest? interest) {
    setState(() {
      selectedInterestLevel1 = interest;
      subInterestsLevel2 = interest?.subInterests ?? [];
      selectedInterestLevel2 = null;
      subInterestsLevel3 = [];
      selectedInterestLevel3 = null;
    });
  }

  void _onSelectedLevel2(Interest? interest) {
    setState(() {
      selectedInterestLevel2 = interest;
      subInterestsLevel3 = interest?.subInterests ?? [];
      selectedInterestLevel3 = null;
    });
  }

  Future<void> _saveInterestsToFirestore() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Check if user is signed in
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Get the user ID
      String userId = user.uid;

      Map<String, dynamic> interestsData = {
        "interestLevel1": selectedInterestLevel1?.name,
        "interestLevel2": selectedInterestLevel2?.name,
        "interestLevel3": selectedInterestLevel3?.name,
      };

      // Saving the interests to Firestore
      await firestore.collection('users').doc(userId).set({
        "interests": interestsData
      }, SetOptions(merge: true)).then((_) {
        print("Interests have been saved successfully");

        // Navigate to the profile customization page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileCustomization()),
        );
      }).catchError((error) {
        print("Failed to save interests: $error");
      });
    } else {
      print("User is not signed in.");
      // TODO: Show an error message to the user
    }
  }

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
                SizedBox(height: 10),

                // DropdownButton for level 1 interests
                DropdownButton<Interest>(
                  hint: Text('Sélectionnez un centre d\'intérêt'),
                  value: selectedInterestLevel1,
                  onChanged: _onSelectedLevel1,
                  items: interests.map<DropdownMenuItem<Interest>>((Interest value) {
                    return DropdownMenuItem<Interest>(
                      value: value,
                      child: Text(value.name),
                    );
                  }).toList(),
                ),

                // DropdownButton for level 2 interests
                DropdownButton<Interest>(
                  hint: Text('Sélectionnez un centre d\'intérêt de niveau 2'),
                  value: selectedInterestLevel2,
                  onChanged: selectedInterestLevel1 != null ? _onSelectedLevel2 : null,
                  disabledHint: Text('Veuillez d\'abord choisir un C.I.S de niveau 1'),
                  items: subInterestsLevel2.map((Interest value) {
                    return DropdownMenuItem<Interest>(
                      value: value,
                      child: Text(value.name),
                    );
                  }).toList(),
                ),

                // DropdownButton for level 3 interests
                DropdownButton<Interest>(
                  hint: Text('Sélectionnez un centre d\'intérêt de niveau 3'),
                  value: selectedInterestLevel3,
                  onChanged: selectedInterestLevel2 != null ? (Interest? newValue) {
                    setState(() {
                      selectedInterestLevel3 = newValue;
                    });
                  } : null,
                  disabledHint: Text('Veuillez d\'abord choisir un C.I.S de niveau 2'),
                  items: subInterestsLevel3.map((Interest value) {
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
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            // Change the button's color based on the state
                            if (selectedInterestLevel1 != null && selectedInterestLevel2 != null && selectedInterestLevel3 != null) {
                              return Colors.white; // Enabled
                            }
                            return Colors.grey; // Disabled
                          },
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(color: Colors.white)))),
                    onPressed: (selectedInterestLevel1 != null && selectedInterestLevel2 != null && selectedInterestLevel3 != null) ?
                    _saveInterestsToFirestore : null,
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
