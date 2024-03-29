import 'package:flutter/material.dart';
import 'package:workwise_autism/screens/status/autism/signup/profile_creation/profile_customization.dart';
import 'package:workwise_autism/widgets/color_constants.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
        Interest('Intelligence Artificielle et Apprentissage Automatique'),
        Interest('Cybersécurité et Cryptographie'),
        Interest('Science des Données et Analytique Big Data'),
        Interest('Systèmes Distribués et Cloud Computing'),
        Interest('Réseaux de Communication et Internet des Objets (IoT)'),
        Interest('Développement de Logiciels et Ingénierie des Systèmes'),
        Interest('Interface Homme-Machine et Interaction Utilisateur'),
        Interest('Réalité Virtuelle et Augmentée'),
      ]),
      Interest('Ingénierie et Technologie', [
        Interest('Ingénierie Mécanique et Aéronautique'),
        Interest('Génie Électrique et Électronique'),
        Interest('Ingénierie Informatique et Logicielle'),
        Interest('Biotechnologie et Ingénierie Biomédicale'),
        Interest('Matériaux Avancés et Nanotechnologie'),
        Interest('Énergies Renouvelables et Systèmes Énergétiques Durables'),
        Interest('Robotique et Systèmes Autonomes'),
        Interest('Ingénierie de l\'Environnement et Gestion des Ressources'),
      ]),
      Interest('Sciences Médicales et Recherche en Santé', [
        Interest('Recherche Biomédicale Avancée'),
        Interest('Neurosciences et Troubles Cognitifs'),
        Interest('Oncologie et Recherche sur le Cancer'),
        Interest('Épidémiologie et Santé Publique'),
        Interest('Biotechnologie et Thérapie Génique'),
        Interest('Pharmacologie Clinique et Développement de Médicaments'),
        Interest('Systèmes de Santé et Politiques de Santé'),
        Interest('Technologies de l\'Information en Santé'),
      ]),
    ]),
    Interest('Avancées et Recherche', [
      Interest('Recherche en Sciences Fondamentales', [
        Interest('Physique Théorique'),
        Interest('Chimie Quantique et Spectroscopie'),
        Interest('Biologie Moléculaire et Génétique'),
        Interest('Mathématiques Pures et Appliquées'),
        Interest('Astronomie et Astrophysique'),
        Interest('Géosciences et Planétologie'),
        Interest('Informatique Théorique et Algorithmique'),
        Interest('Sciences des Matériaux et Nanotechnologie'),
      ]),
      Interest('Innovation Technologique et Ingénierie', [
        Interest('Robotique et Automatisation'),
        Interest('Intelligence Artificielle et Apprentissage Profond'),
        Interest('Énergies Renouvelables et Systèmes Énergétiques Durables'),
        Interest('Matériaux Avancés et Nanotechnologie'),
        Interest('Technologies de l\'Information et Cybersécurité'),
        Interest('Génie Biologique et Médical'),
        Interest('Technologie Spatiale et Exploration'),
        Interest('Innovation en Ingénierie Civile et Construction Durable'),
      ]),
      Interest('Sciences Informatiques et Analyse de Données', [
        Interest('Intelligence Artificielle et Apprentissage Automatique'),
        Interest('Science des Données et Big Data'),
        Interest('Cybersécurité et Cryptographie'),
        Interest('Systèmes Distribués et Cloud Computing'),
        Interest('Analytique Web et SEO'),
        Interest('Visualisation de Données et Interface Utilisateur'),
        Interest('Réseaux Neuronaux et Traitement du Langage Naturel (TAL)'),
        Interest('Blockchain et Technologies Distribuées'),
      ]),
      Interest('Sciences de l\'Environnement et Changement Climatique', [
        Interest('Modélisation Climatique et Prévisions'),
        Interest('Écologie et Biodiversité'),
        Interest('Gestion des Ressources Naturelles'),
        Interest('Énergies Renouvelables et Transition Énergétique'),
        Interest('Politiques et Gouvernance du Changement Climatique'),
        Interest('Vulnérabilité et Adaptation au Changement Climatique'),
        Interest(
            'Économie Environnementale et Sociale du Changement Climatique'),
        Interest('Innovation Technologique pour la Durabilité'),
      ]),
      Interest('Recherche Médicale et Santé', [
        Interest('Innovations en Biotechnologie et Thérapie Génique'),
        Interest(
            'Neurosciences Translationnelles et Troubles Neurodéveloppementaux'),
        Interest('Oncologie Moléculaire et Personnalisée'),
        Interest('Épidémiologie et Santé Publique Globale'),
        Interest('Pharmacologie Clinique et Découverte de Médicaments'),
        Interest('Technologies Médicales et Diagnostiques Avancées'),
        Interest('Systèmes de Santé et Politiques de Santé'),
        Interest('Santé Mentale et Approches Thérapeutiques Innovantes'),
      ]),
      Interest('Sciences Sociales et Humaines', [
        Interest('Psychologie Cognitive et Neuropsychologie'),
        Interest('Sociologie et Changement Social'),
        Interest('Anthropologie Culturelle et Ethnographie'),
        Interest('Études de Genre et Sexualité'),
        Interest('Philosophie Éthique et Politique'),
        Interest('Histoire Contemporaine et Analyse Critique'),
        Interest('Économie Politique et Développement'),
        Interest('Communication et Médias'),
      ]),
      Interest('Économie et Gestion', [
        Interest('Économie Théorique et Appliquée'),
        Interest('Finance Quantitative et Gestion des Risques'),
        Interest('Économie du Développement et Politiques Publiques'),
        Interest('Marketing Stratégique et Comportement du Consommateur'),
        Interest('Entrepreneuriat et Innovation'),
        Interest('Management Stratégique et Leadership'),
        Interest('Économie Environnementale et Développement Durable'),
        Interest('Analyse de Données et Intelligence d\'Affaires'),
      ]),
      Interest('Arts, Culture et Patrimoine', [
        Interest('Conservation et Gestion du Patrimoine'),
        Interest('Études Muséales et Curatoriales'),
        Interest('Arts Visuels et Performances'),
        Interest('Cinématographie et Études Filmiques'),
        Interest('Littérature Comparée et Critique Textuelle'),
        Interest('Philosophie de l\'Art et Esthétique'),
        Interest('Anthropologie Culturelle et Études Patrimoniales'),
        Interest('Archéologie et Reconstitution Historique'),
      ]),
      Interest('Projets de Recherche Interdisciplinaires', [
        Interest('Innovation en Santé Globale et Médecine'),
        Interest('Durabilité Environnementale et Écotechnologies'),
        Interest('Technologies Éducatives et Apprentissage Numérique'),
        Interest('Art, Technologie et Société'),
        Interest('Sciences Cognitives et Intelligence Artificielle'),
        Interest('Changement Climatique, Politique et Économie'),
        Interest('Éthique, Technologie et Société'),
        Interest('Urbanisme, Architecture et Durabilité'),
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
      Interest('Arts Visuels et Peinture', [
        Interest('Techniques Avancées de Peinture'),
        Interest('Théorie et Critique d\'Art'),
        Interest('Histoire de l\'Art et Mouvements Artistiques'),
        Interest('Pratiques Interdisciplinaires en Arts Visuels'),
        Interest('Art Contemporain et Nouveaux Médias'),
        Interest('Gestion de Carrière Artistique et Marché de l\'Art'),
        Interest('Conservation, Restauration et Patrimoine Artistique'),
        Interest('Art et Engagement Social'),
      ]),
      Interest('Design Graphique et Visuel', [
        Interest('Typographie et Mise en Page'),
        Interest('Identité Visuelle et Branding'),
        Interest('Illustration et Visualisation de Concepts'),
        Interest('Design d\'Interface Utilisateur (UI) et Expérience Utilisateur (UX)'),
        Interest('Packaging et Design de Produit'),
        Interest('Art et Design Numérique'),
        Interest('Photographie et Manipulation d\'Images'),
        Interest('Théorie du Design et Critique'),
      ]),
      Interest('Arts Numériques et Multimédia', [
        Interest('Animation 2D et 3D'),
        Interest('Conception et Développement de Jeux Vidéo'),
        Interest('Réalité Virtuelle (RV) et Réalité Augmentée (RA'),
        Interest('Art Interactif et Installations Numériques'),
        Interest('Vidéo et Cinématographie Numérique'),
        Interest('Design Sonore et Musique Électronique'),
        Interest('Graphisme et Illustration Numérique'),
        Interest('Médias Sociaux et Art Numérique'),
      ]),
      Interest('Photographie et Vidéographie', [
        Interest('Techniques Avancées de Photographie'),
        Interest('Post-Production et Retouche Photographique'),
        Interest('Cinématographie et Production Vidéo'),
        Interest('Réalisation Documentaire et Narration Visuelle'),
        Interest('Photographie de Mode et Publicitaire'),
        Interest('Vidéographie pour les Médias Sociaux et le Marketing'),
        Interest('Photographie de Paysage et de Nature'),
        Interest('Éthique et Droit de la Photographie et de la Vidéographie'),
      ]),
      Interest('Design d\'Intérieur et Architecture', [
        Interest('Théorie et Histoire de l\'Architecture'),
        Interest('Design d\'Intérieur Avancé'),
        Interest('Développement Durable et Architecture Écologique'),
        Interest('Technologie et Innovation en Architecture'),
        Interest('Psychologie de l\'Espace et Ergonomie'),
        Interest('Design Urbain et Planification Spatiale'),
        Interest('Restauration et Conservation Architecturale'),
        Interest('Visualisation Architecturale et Présentation'),
      ]),
      Interest('Mode et Design Textile', [
        Interest('Innovation en Design Textile'),
        Interest('Développement Durable et Mode Éthique'),
        Interest('Histoire de la Mode et Théorie Critique'),
        Interest('Design de Mode Avancé'),
        Interest('Technologie et Mode Numérique'),
        Interest('Marketing de la Mode et Stratégie de Marque'),
        Interest('Psychologie de la Mode et Comportement du Consommateur'),
        Interest('Design de Costumes pour le Spectacle'),
      ]),
      Interest('Théâtre, Danse et Performance', [
        Interest('Mise en Scène et Direction Théâtrale'),
        Interest('Chorégraphie et Composition en Danse'),
        Interest('Théorie et Critique de Performance'),
        Interest('Dramaturgie et Écriture pour le Spectacle'),
        Interest('Technologies de la Scène et Conception Technique'),
        Interest('Performance Interdisciplinaire et Expérimentale'),
        Interest('Gestion et Production Théâtrale'),
        Interest('Pratiques Corporelles et Training de l\'Acteur/Danseur'),
      ]),
      Interest('Musique et Composition', [
        Interest('Composition Musicale et Arrangement'),
        Interest('Théorie Musicale et Analyse'),
        Interest('Musique Électronique et Production Sonore'),
        Interest('Études Ethnomusicologiques et Musique du Monde'),
        Interest('Pratique de Performance et Interprétation'),
        Interest('Musique pour Film et Médias'),
        Interest('Pédagogie Musicale et Éducation'),
        Interest('Recherche en Musique et Musicologie'),
      ]),
      Interest('Artisanat et Métiers d\'Art', [
        Interest('Céramique et Poterie'),
        Interest('Joaillerie et Travail des Métaux'),
        Interest('Textiles et Tissage'),
        Interest('Verre et Techniques du Verre'),
        Interest('Bois et Ébénisterie'),
        Interest('Gravure et Techniques d\'Impression'),
        Interest('Reliure et Papier'),
        Interest('Conservation et Restauration d\'Œuvres d\'Art'),
      ]),
    ]),
    Interest('Sciences Humaines et Sociales', [
      Interest('Psychologie et Sciences Cognitives', [
        Interest('Neuropsychologie et Neurosciences Cognitives'),
        Interest('Psychologie du Développement'),
        Interest('Cognition et Perception'),
        Interest('Psychologie Sociale et Comportementale'),
        Interest('Psychopathologie et Santé Mentale'),
        Interest('Psychologie Expérimentale et Méthodes de Recherche'),
        Interest('Psychologie Appliquée et Interventions'),
        Interest('Cognitive Technologies et Intelligence Artificielle'),
      ]),
      Interest('Sociologie et Anthropologie', [
        Interest('Théories Sociologiques et Anthropologiques'),
        Interest('Études Culturelles et Diversité'),
        Interest('Anthropologie Sociale et Ethnographie'),
        Interest('Sociologie Urbaine et Études des Communautés'),
        Interest('Changement Social et Mouvements Sociaux'),
        Interest('Sociologie de la Famille et des Relations'),
        Interest('Anthropologie de la Santé et Médecine'),
        Interest('Inégalités Sociales et Stratification'),
      ]),
      Interest('Sciences Politiques et Relations Internationales', [
        Interest('Théorie Politique et Pensée Politique'),
        Interest('Systèmes Politiques et Comparatifs'),
        Interest('Politique Étrangère et Sécurité Internationale'),
        Interest('Organisations Internationales et Droit International'),
        Interest('Économie Politique Internationale'),
        Interest('Conflits, Paix et Résolution de Conflits'),
        Interest('Diplomatie et Négociations Internationales'),
        Interest('Développement Durable et Changement Climatique'),
      ]),
      Interest('Histoire et Patrimoine Culturel', [
        Interest('Histoire Globale et Comparée'),
        Interest('Conservation et Gestion du Patrimoine'),
        Interest('Archéologie et Recherche sur le Terrain'),
        Interest('Histoire Sociale et Culturelle'),
        Interest('Histoire de l\'Art et Études Visuelles'),
        Interest('Études du Patrimoine Mondial et Tourisme Culturel'),
        Interest('Histoire des Idées et Pensée Intellectuelle'),
        Interest('Histoire Environnementale et Changement Climatique'),
      ]),
      Interest('Philosophie et Éthique', [
        Interest('Philosophie Contemporaine et Théorie Critique'),
        Interest('Éthique Appliquée et Philosophie Morale'),
        Interest('Philosophie de l\'Esprit et Conscience'),
        Interest('Philosophie Politique et Justice Sociale'),
        Interest('Métaphysique et Ontologie'),
        Interest('Épistémologie et Théorie de la Connaissance'),
        Interest('Éthique Environnementale et Philosophie de la Nature'),
        Interest('Philosophie de la Science et de la Technologie'),
      ]),
      Interest('Études de Genre et Sexualité', [
        Interest('Théories Féministes et de Genre'),
        Interest('Sexualité et Identités Sexuelles'),
        Interest('Intersectionnalité et Inégalités Sociales'),
        Interest('Médias, Culture et Représentations de Genre'),
        Interest('Politiques de Genre et Mouvements Sociaux'),
        Interest('Santé, Droits Reproductifs et Sexualité'),
        Interest('Genre, Travail et Économie'),
        Interest('Éducation, Genre et Société'),
      ]),
      Interest('Économie et Développement', [
        Interest('Théories du Développement Économique'),
        Interest('Économie Internationale et Commerce Mondial'),
        Interest('Finances Publiques et Politique Budgétaire'),
        Interest('Économie du Développement et Aide Internationale'),
        Interest('Économie de l\'Environnement et Ressources Naturelles'),
        Interest('Économie Sociale et Entrepreneuriat Social'),
        Interest('Démographie et Développement'),
        Interest('Inégalités Économiques et Sociales'),
      ]),
      Interest('Médias, Communication et Culture', [
        Interest('Théories de la Communication et de l\'Information'),
        Interest('Médias Numériques et Technologies de l\'Information'),
        Interest('Culture Populaire et Industrie des Médias'),
        Interest('Communication Visuelle et Design Multimédia'),
        Interest('Études Critiques des Médias et Littératie Médiatique'),
        Interest('Politiques et Régulation des Médias'),
        Interest('Relations Publiques et Stratégies de Communication'),
        Interest('Anthropologie des Médias et de la Communication'),
      ]),
      Interest('Éducation et Pédagogie', [
        Interest('Théories de l\'Apprentissage et Développement Cognitif'),
        Interest('Technologies Éducatives et Apprentissage Numérique'),
        Interest('Curriculum et Conception Pédagogique'),
        Interest('Éducation Inclusive et Besoins Spéciaux'),
        Interest('Évaluation et Mesure en Éducation'),
        Interest('Formation des Enseignants et Développement Professionnel'),
        Interest('Sociologie de l\'Éducation'),
        Interest('Philosophie de l\'Éducation'),
      ]),
    ]),
    Interest('Gestion, Économie et Finance', [
      Interest('Management et Leadership d\'Entreprise', [
        Interest('Stratégies de Leadership et Développement Organisationnel'),
        Interest('Innovation et Gestion du Changement'),
        Interest('Gestion des Ressources Humaines et Développement des Talents'),
        Interest('Marketing Stratégique et Gestion de la Marque'),
        Interest('Finance d\'Entreprise et Gestion Financière'),
        Interest('Éthique des Affaires et Responsabilité Sociale de l\'Entreprise'),
        Interest('Entrepreneuriat et Gestion des Start-ups'),
        Interest('Management International et Globalisation'),
      ]),
      Interest('Économie Avancée et Politique Économique', [
        Interest('Macroéconomie et Dynamiques du Marché Global'),
        Interest('Microéconomie et Choix des Consommateurs'),
        Interest('Économétrie et Méthodes Quantitatives'),
        Interest('Développement Économique et Croissance'),
        Interest('Économie de l\'Environnement et Ressources Naturelles'),
        Interest('Politique Économique et Régulation'),
        Interest('Finance Internationale et Marchés des Capitaux'),
        Interest('Économie du Travail et Politiques d\'Emploi'),
      ]),
      Interest('Finance et Analyse Financière', [
        Interest('Théorie Financière et Marchés Financiers'),
        Interest('Analyse des Investissements et Gestion de Portefeuille'),
        Interest('Finance d\'Entreprise et Décisions Financières'),
        Interest('Analyse Quantitative et Modélisation Financière'),
        Interest('Gestion des Risques Financiers'),
        Interest('Finance Comportementale'),
        Interest('Finance Durable et Investissement Responsable'),
        Interest('Finance Internationale et Gestion des Changes'),
      ]),
      Interest('Comptabilité et Audit', [
        Interest('Principes Avancés de Comptabilité'),
        Interest('Audit et Assurance'),
        Interest('Fiscalité et Planification Fiscale'),
        Interest('Gestion Financière et Contrôle de Gestion'),
        Interest('Éthique en Comptabilité et Responsabilité Professionnelle'),
        Interest('Systèmes d\'Information Comptable et Technologie'),
        Interest('Comptabilité Secteur Public et Gouvernementale'),
        Interest('Fraude Financière, Forensique et Enquêtes'),
      ]),
      Interest('Marketing et Recherche de Marché', [
        Interest('Stratégies de Marketing Avancées'),
        Interest('Analyse et Intelligence de Marché'),
        Interest('Marketing Numérique et Médias Sociaux'),
        Interest('Comportement du Consommateur'),
        Interest('Gestion de la Marque et Positionnement'),
        Interest('Marketing International et Stratégies de Globalisation'),
        Interest('Recherche de Marché Qualitative et Quantitative'),
        Interest('Éthique du Marketing et Responsabilité Sociale'),
      ]),
      Interest('Entrepreneuriat et Innovation', [
        Interest('Création et Gestion de Start-ups'),
        Interest('Innovation et Développement de Produits'),
        Interest('Stratégies de Croissance et Scalabilité'),
        Interest('Entrepreneuriat Social et Entreprises Sociales'),
        Interest('Financement de l\'Entreprise et Accès au Capital'),
        Interest('Propriété Intellectuelle et Innovation'),
        Interest('Leadership et Management de l\'Innovation'),
        Interest('Écosystèmes d\'Innovation et Incubateurs'),
      ]),
      Interest('Ressources Humaines et Développement Organisationnel', [
        Interest('Gestion Stratégique des Ressources Humaines'),
        Interest('Développement Organisationnel et Changement'),
        Interest('Formation et Développement du Personnel'),
        Interest('Évaluation de la Performance et Gestion des Compétences'),
        Interest('Bien-être et Santé au Travail'),
        Interest('Diversité, Équité et Inclusion'),
        Interest('Relations du Travail et Négociations Collectives'),
        Interest('Technologies RH et Systèmes d\'Information'),
      ]),
      Interest('Économie Internationale et Commerce Global', [
        Interest('Théories du Commerce International'),
        Interest('Politiques Commerciales et Régimes de Commerce'),
        Interest('Économie du Développement et Aide Internationale'),
        Interest('Finance Internationale et Marchés des Capitaux'),
        Interest('Intégration Économique et Blocs Commerciaux'),
        Interest('Multinationales et Stratégies d\'Entreprise Globales'),
        Interest('Économie Environnementale et Commerce'),
        Interest('Défis Globaux et Gouvernance Économique Internationale'),
      ]),
      Interest('Éthique des Affaires et Responsabilité Sociale', [
        Interest('Fondements de l\'Éthique des Affaires'),
        Interest('Responsabilité Sociale des Entreprises (RSE)'),
        Interest('Gestion des Risques Éthiques et de Réputation'),
        Interest('Éthique et Globalisation'),
        Interest('Diversité et Inclusion dans le Monde des Affaires'),
        Interest('Éthique de la Consommation et Marketing Éthique'),
        Interest('Investissement Socialement Responsable (ISR)'),
        Interest('Éthique et Technologie dans les Affaires'),
      ]),
    ]),
    Interest('Droit et Études Juridiques', [
      Interest('Droit International et Droits Humains', [
        Interest('Principes et Fondements du Droit International'),
        Interest('Protection Internationale des Droits Humains'),
        Interest('Droit International Humanitaire'),
        Interest('Droit International de l\'Environnement'),
        Interest('Droit International Pénal'),
        Interest('Résolution des Conflits et Médiation Internationale'),
        Interest('Commerce International et Droit Économique International'),
        Interest('Droits des Réfugiés et Droit de l\'Asile'),
      ]),
      Interest('Droit des Affaires et Commerce International', [
        Interest('Réglementation du Commerce International'),
        Interest('Droit des Sociétés Internationales'),
        Interest('Propriété Intellectuelle dans le Commerce Global'),
        Interest('Résolution des Conflits Commerciaux Internationaux'),
        Interest('Financement International et Sécurisation des Transactions'),
        Interest('Droit du Travail et Gestion des Ressources Humaines à l\'International'),
        Interest('Pratiques Anticorruption et Conformité'),
        Interest('Enjeux Éthiques et Responsabilité Sociale des Entreprises à l\'International'),
      ]),
      Interest('Droit Pénal et Criminologie', [
        Interest('Théories et Fondements du Droit Pénal'),
        Interest('Criminologie et Sociologie du Crime'),
        Interest('Procédure Pénale et Justice Pénale'),
        Interest('Droit Pénal International et Justice Transitionnelle'),
        Interest('Politiques de Sécurité et Prévention du Crime'),
        Interest('Victimologie et Droits des Victimes'),
        Interest('Cybercriminalité et Droit Pénal Numérique'),
        Interest('Éthique et Justice Pénale'),
      ]),
      Interest('Droit de la Propriété Intellectuelle et de l\'Innovation', [
        Interest('Droit des Brevets et Protection des Inventions'),
        Interest('Droit des Marques et Stratégies de Branding'),
        Interest('Droit d\'Auteur et Droits Connexes'),
        Interest('Propriété Intellectuelle et Biotechnologies'),
        Interest('Gestion et Commercialisation de la Propriété Intellectuelle'),
        Interest('Droit de la Concurrence et Propriété Intellectuelle'),
        Interest('Cyberdroit et Propriété Intellectuelle Numérique'),
        Interest('Cadres Internationaux de la Propriété Intellectuelle'),
      ]),
      Interest('Droit de l\'Environnement et Développement Durable', [
        Interest('Principes Fondamentaux du Droit de l\'Environnement'),
        Interest('Droit International de l\'Environnement'),
        Interest('Gestion des Ressources Naturelles et Biodiversité'),
        Interest('Changement Climatique et Politiques Environnementales'),
        Interest('Droit de l\'Eau et Gestion des Ressources Hydriques'),
        Interest('Pollution et Contrôle des Polluants'),
        Interest('Énergie Renouvelable et Transition Énergétique'),
        Interest('Éthique Environnementale et Justice Climatique'),
      ]),
      Interest('Droit Fiscal et Financier', [
        Interest('Principes Fondamentaux du Droit Fiscal'),
        Interest('Fiscalité Internationale et Planification Fiscale'),
        Interest('Droit des Finances Publiques'),
        Interest('Réglementation des Marchés Financiers'),
        Interest('Droit Bancaire et Financier'),
        Interest('Lutte contre le Blanchiment d\'Argent et Financement du Terrorisme'),
        Interest('Fiscalité de l\'Économie Numérique et des Cryptomonnaies'),
        Interest('Contentieux Fiscal et Procédures d\'Appel'),
      ]),
      Interest('Droit du Travail et Relations Sociales', [
        Interest('Normes Internationales du Travail'),
        Interest('Contrats de Travail et Conditions d\'Emploi'),
        Interest('Santé et Sécurité au Travail'),
        Interest('Relations Collectives et Négociation Collective'),
        Interest('Gestion des Conflits du Travail et Contentieux Social'),
        Interest('Droit de la Sécurité Sociale'),
        Interest('Égalité et Discrimination au Travail'),
        Interest('Restructurations d\'Entreprises et Droit Social'),
      ]),
      Interest('Droit de la Famille et du Patrimoine', [
        Interest('Régimes Matrimoniaux et Partenariats'),
        Interest('Droit de la Filiation et de l\'Adoption'),
        Interest('Autorité Parentale et Droits de l\'Enfant'),
        Interest('Successions et Libéralités'),
        Interest('Régulation des Biens et Gestion du Patrimoine'),
        Interest('Protection des Majeurs et Tutelles'),
        Interest('Droit International Privé de la Famille'),
        Interest('Médiation Familiale et Résolution des Conflits'),
      ]),
      Interest('Études Juridiques Interdisciplinaires', [
        Interest('Droit et Sciences Sociales'),
        Interest('Droit et Économie (Analyse Économique du Droit)'),
        Interest('Droit et Technologies de l\'Information'),
        Interest('Droit et Éthique Biomédicale'),
        Interest('Droit, Littérature et Arts'),
        Interest('Droit et Philosophie'),
        Interest('Droit et Politique Internationale'),
        Interest('Droit et Développement Durable'),
      ]),
    ]),
    Interest('Santé, Bien-être et Sciences de la Vie', [
      Interest('Médecine et Sciences Médicales', [
        Interest('Recherche Biomédicale et Innovations Thérapeutiques'),
        Interest('Neurosciences et Neurologie'),
        Interest('Oncologie et Recherche sur le Cancer'),
        Interest('Santé Publique et Épidémiologie'),
        Interest('Médecine Personnalisée et Précision'),
        Interest('Technologies en Santé et Télémédecine'),
        Interest('Immunologie et Maladies Infectieuses'),
        Interest('Éthique Médicale et Droit de la Santé'),
      ]),
      Interest('Neurosciences et Psychologie', [
        /*
8.2.1	Neurobiologie et Mécanismes Neuronaux
8.2.2	Cognition et Sciences Cognitives
8.2.3	Psychopathologie et Troubles Mentaux
8.2.4	Neuropsychologie et Réhabilitation Cognitive
8.2.5	Développement Cognitif et Neurodéveloppement
8.2.6	Neurosciences Comportementales et Sociales
8.2.7	Plasticité Neuronale et Apprentissage
8.2.8	Neurosciences et Technologies Émergentes
         */
        Interest('Neurobiologie et Mécanismes Neuronaux'),
        Interest('Cognition et Sciences Cognitives'),
        Interest('Psychopathologie et Troubles Mentaux'),
        Interest('Neuropsychologie et Réhabilitation Cognitive'),
        Interest('Développement Cognitif et Neurodéveloppement'),
        Interest('Neurosciences Comportementales et Sociales'),
        Interest('Plasticité Neuronale et Apprentissage'),
        Interest('Neurosciences et Technologies Émergentes'),
      ]),
      Interest('Santé Publique et Épidémiologie', [
        Interest('Surveillance Épidémiologique et Contrôle des Maladies'),
        Interest('Déterminants Sociaux de la Santé'),
        Interest('Prévention et Promotion de la Santé'),
        Interest('Santé Globale et Défis Sanitaires Internationaux'),
        Interest('Épidémiologie des Maladies Chroniques'),
        Interest('Santé Environnementale et Occupationnelle'),
        Interest('Biostatistique et Méthodes Quantitatives en Santé Publique'),
        Interest('Politiques de Santé et Systèmes de Santé'),
      ]),
      Interest('Nutrition et Diététique', [
        Interest('Biochimie Nutritionnelle et Métabolisme'),
        Interest('Nutrition Clinique et Thérapeutique'),
        Interest('Épidémiologie Nutritionnelle et Études Alimentaires'),
        Interest('Sécurité Alimentaire et Politiques Nutritionnelles'),
        Interest('Nutrition Sportive et Performance'),
        Interest('Nutrigénomique et Nutrition Personnalisée'),
        Interest('Comportement Alimentaire et Psychologie de la Nutrition'),
        Interest('Nutrition Publique et Intervention Communautaire'),
      ]),
      Interest('Pharmacologie et Pharmacie', [
        Interest('Pharmacologie Clinique et Thérapeutique'),
        Interest('Pharmacocinétique et Pharmacodynamique'),
        Interest('Développement et Évaluation des Médicaments'),
        Interest('Pharmacie Clinique et Soins Pharmaceutiques'),
        Interest('Toxicologie et Sécurité des Médicaments'),
        Interest('Pharmacogénomique et Médecine Personnalisée'),
        Interest('Pharmacie Hospitalière et Gestion des Médicaments'),
        Interest('Politiques Pharmaceutiques et Systèmes de Santé'),
      ]),
      Interest('Santé Mentale et Bien-être', [
        Interest('Psychopathologie et Troubles Mentaux'),
        Interest('Thérapies Psychologiques et Interventions'),
        Interest('Prévention et Promotion de la Santé Mentale'),
        Interest('Psychologie Positive et Bien-être'),
        Interest('Santé Mentale dans Divers Contextes Culturels et Sociaux'),
        Interest('Neurosciences et Santé Mentale'),
        Interest('Santé Mentale des Populations Vulnérables'),
        Interest('Politiques de Santé Mentale et Systèmes de Soin'),
      ]),
      Interest('Kinésithérapie et Réadaptation', [
        Interest('Évaluation et Diagnostic en Kinésithérapie'),
        Interest('Techniques de Rééducation et de Réadaptation'),
        Interest('Réadaptation Neurologique'),
        Interest('Kinésithérapie Sportive et Thérapie du Sport'),
        Interest('Gériatrie et Kinésithérapie pour les Personnes Âgées'),
        Interest('Pédiatrie et Réadaptation pour Enfants'),
        Interest('Réadaptation Cardiopulmonaire'),
        Interest('Recherche en Kinésithérapie et Innovation en Réadaptation'),
      ]),
      Interest('Sciences Infirmières et Soins de Santé', [
        Interest('Pratique Avancée en Soins Infirmiers'),
        Interest('Soins Infirmiers Spécialisés'),
        Interest('Gestion des Soins et Coordination'),
        Interest('Éducation en Sciences Infirmières et Formation'),
        Interest('Recherche en Sciences Infirmières'),
        Interest('Éthique et Législation en Soins Infirmiers'),
        Interest('Santé Publique et Prévention'),
        Interest('Soins Palliatifs et de Fin de Vie'),
      ]),
      Interest('Biologie Cellulaire et Moléculaire', [
        Interest('Structure et Fonction des Cellules'),
        Interest('Signalisation Cellulaire et Communication'),
        Interest('Génétique Moléculaire et Expression Génique'),
        Interest('Biotechnologie et Ingénierie Génétique'),
        Interest('Métabolisme et Bioénergétique'),
        Interest('Biologie du Développement et Embryologie'),
        Interest('Pathologie Moléculaire et Cellulaire'),
        Interest('Nanobiologie et Applications Médicales'),
      ]),
    ]),
    Interest('Environnement et Développement Durable', [
      Interest('Écologie et Biodiversité', [
        Interest('Dynamiques des Écosystèmes et Services Écosystémiques'),
        Interest('Conservation de la Biodiversité et Gestion des Espaces Naturels'),
        Interest('Écologie du Paysage et Fragmentation des Habitats'),
        Interest('Changement Climatique et Biodiversité'),
        Interest('Biogéographie et Distribution des Espèces'),
        Interest('Écologie Comportementale et Interactions entre Espèces'),
        Interest('Écotoxicologie et Pollution des Écosystèmes'),
        Interest('Agroécologie et Systèmes Alimentaires Durables'),
      ]),
      Interest('Gestion de l\'Environnement et Politiques Écologiques', [
        Interest('Politique et Gouvernance Environnementale'),
        Interest('Gestion des Ressources Naturelles'),
        Interest('Changement Climatique et Atténuation'),
        Interest('Économie Verte et Développement Durable'),
        Interest('Évaluation Environnementale et Analyse du Cycle de Vie'),
        Interest('Gestion des Déchets et Économie Circulaire'),
        Interest('Éducation et Sensibilisation Environnementale'),
        Interest('Gestion des Catastrophes et Risques Environnementaux'),
      ]),
      Interest('Changement Climatique et Atténuation', [
        Interest('Science du Changement Climatique'),
        Interest('Politiques et Gouvernance du Changement Climatique'),
        Interest('Stratégies d\'Atténuation du Changement Climatique'),
        Interest('Adaptation au Changement Climatique'),
        Interest('Finance Climatique et Économie du Carbone'),
        Interest('Technologies de Réduction des Émissions'),
        Interest('Changement Climatique et Biodiversité'),
        Interest('Éducation et Sensibilisation au Changement Climatique'),
      ]),
      Interest('Énergie Renouvelable et Technologies Vertes', [
        Interest('Technologies Solaires'),
        Interest('Énergie Éolienne'),
        Interest('Hydroélectricité et Ressources Hydrauliques'),
        Interest('Biomasse et Biocarburants'),
        Interest('Géothermie'),
        Interest('Intégration des Énergies Renouvelables au Réseau'),
        Interest('Efficacité Énergétique et Bâtiments Verts'),
        Interest('Politiques et Économie des Énergies Renouvelables'),
      ]),
      Interest('Gestion des Ressources Naturelles', [
        Interest('Gestion Durable de l\'Eau'),
        Interest('Conservation des Forêts et Gestion Forestière'),
        Interest('Gestion des Terres et des Sols'),
        Interest('Biodiversité et Aires Protégées'),
        Interest('Gestion des Ressources Marines et Côtières'),
        Interest('Changement Climatique et Ressources Naturelles'),
        Interest('Économie des Ressources Naturelles'),
        Interest('Participation Communautaire et Gestion Participative'),
      ]),
      Interest('Développement Durable et Planification Urbaine', [
        Interest('Urbanisme Durable et Conception Écologique'),
        Interest('Gestion des Ressources en Milieu Urbain'),
        Interest('Changement Climatique et Résilience Urbaine'),
        Interest('Participation Communautaire et Gouvernance Locale'),
        Interest('Économie Urbaine et Développement Local'),
        Interest('Mobilité Urbaine et Transport Durable'),
        Interest('Justice Sociale et Équité Urbaine'),
        Interest('Villes Intelligentes et Technologies Urbaines'),
      ]),
      Interest('Économie Environnementale et Sociale', [
        Interest('Évaluation Économique des Écosystèmes et de la Biodiversité'),
        Interest('Politiques Économiques pour le Développement Durable'),
        Interest('Économie Circulaire et Gestion des Ressources'),
        Interest('Économie Sociale et Entrepreneuriat Social'),
        Interest('Finance Durable et Investissement Responsable'),
        Interest('Gestion Durable des Déchets et Économie des Déchets'),
        Interest('Changement Climatique et Économie'),
        Interest('Équité Environnementale et Justice Sociale'),
      ]),
      Interest('Agriculture Durable et Sécurité Alimentaire', [
        Interest('Systèmes Agricoles Durables'),
        Interest('Technologies Innovantes en Agriculture'),
        Interest('Gestion des Ressources en Eau pour l\'Agriculture'),
        Interest('Sécurité Alimentaire et Nutrition'),
        Interest('Changement Climatique et Agriculture'),
        Interest('Politiques Agricoles et Développement Rural'),
        Interest('Gestion des Risques et Résilience des Systèmes Alimentaires'),
        Interest('Agriculture Urbaine et Systèmes Alimentaires Locaux'),
      ]),
      Interest('Éducation et Sensibilisation à l\'Environnement', [
        Interest('Pédagogies de l\'Éducation à l\'Environnement'),
        Interest('Communication et Sensibilisation à l\'Environnement'),
        Interest('Programmes d\'Éducation à l\'Environnement dans les Écoles'),
        Interest('Formation Professionnelle en Éducation à l\'Environnement'),
        Interest('Éducation à l\'Environnement pour le Développement Durable'),
        Interest('Participation Citoyenne et Engagement Communautaire'),
        Interest('Évaluation de l\'Impact de l\'Éducation à l\'Environnement'),
        Interest('Innovation et Technologies Vertes dans l\'Éducation'),
      ]),
    ]),
    Interest('Éducation et Pédagogie', [
      Interest('Théories de l\'Éducation et Approches Pédagogiques', [
        Interest('Constructivisme et Apprentissage Basé sur les Problèmes'),
        Interest('Behaviorisme et Gestion de Classe'),
        Interest('Cognitivisme et Stratégies d\'Enseignement'),
        Interest('Humanisme et Éducation Centrée sur l\'Élève'),
        Interest('Théories Socio-culturelles et Apprentissage Collaboratif'),
        Interest('Pédagogie Critique et Éducation pour la Justice Sociale'),
        Interest('Technologie Éducative et Apprentissage Hybride'),
        Interest('Évaluation et Feedback Constructif'),
      ]),
      Interest('Éducation Spécialisée et Besoins Particuliers', [
        Interest('Stratégies d\'Inclusion Scolaire'),
        Interest('Interventions Éducatives pour Troubles Spécifiques'),
        Interest('Évaluation et Diagnostic en Éducation Spécialisée'),
        Interest('Formation des Enseignants en Éducation Spécialisée'),
        Interest('Technologies d\'Assistance et Outils Pédagogiques'),
        Interest('Participation des Familles et Collaboration'),
        Interest('Politiques et Législation en Éducation Spécialisée'),
        Interest('Développement Social et Émotionnel'),
      ]),
      Interest('Développement Curriculaire et Évaluation', [
        Interest('Théories et Modèles de Développement Curriculaire'),
        Interest('Conception et Mise en Œuvre de Curriculums'),
        Interest('Évaluation de Programmes Éducatifs'),
        Interest('Technologies Éducatives et Curriculums Numériques'),
        Interest('Formation des Enseignants et Développement Professionnel'),
        Interest('Curriculums Inclusifs et Éducation Multiculturelle'),
        Interest('Politiques Éducatives et Réformes Curriculaires'),
        Interest('Évaluation Basée sur les Compétences'),
      ]),
      Interest('Formation des Enseignants et Développement Professionnel', [
        Interest('Compétences Pédagogiques et Didactiques'),
        Interest('Technologies Éducatives et Innovation Pédagogique'),
        Interest('Gestion de Classe et Climat Scolaire'),
        Interest('Éducation Inclusive et Besoins Éducatifs Particuliers'),
        Interest('Développement Professionnel Continu et Auto-évaluation'),
        Interest('Leadership Éducatif et Gestion de l\'Innovation'),
        Interest('Collaboration et Travail en Réseau'),
        Interest('Éthique Professionnelle et Responsabilité'),
      ]),
      Interest('Technologies de l\'Éducation et E-Learning', [
        Interest('Conception et Développement de Cours en Ligne'),
        Interest('Technologies Mobiles et Apprentissage Nomade'),
        Interest('Réalité Virtuelle et Réalité Augmentée en Éducation'),
        Interest('Analytique de l\'Apprentissage et Données Éducatives'),
        Interest('E-Learning Collaboratif et Réseaux Sociaux'),
        Interest('Pédagogie Inversée et Apprentissage Mixte'),
        Interest('Formation des Enseignants aux Technologies Éducatives'),
        Interest('Éthique et Sécurité dans l\'E-Learning'),
      ]),
      Interest('Éducation Multiculturelle et Globale', [
        Interest('Théories et Modèles d\'Éducation Multiculturelle'),
        Interest('Pratiques Pédagogiques dans des Contextes Multiculturels'),
        Interest('Éducation Globale et Citoyenneté Mondiale'),
        Interest('Langues et Éducation Bilingue'),
        Interest('Équité et Accès à l\'Éducation'),
        Interest('Éducation et Migration'),
        Interest('Technologies Éducatives et Apprentissage Interculturel'),
        Interest('Formation des Enseignants pour la Diversité'),
      ]),
      Interest('Éducation pour le Développement Durable', [
        Interest('Principes et Objectifs du Développement Durable'),
        Interest('Pédagogie du Développement Durable'),
        Interest('Éducation Environnementale et Sensibilisation'),
        Interest('Changement Climatique et Éducation'),
        Interest('Durabilité Urbaine et Planification'),
        Interest('Économie Verte et Emploi Durable'),
        Interest('Consommation Responsable et Modes de Vie Durables'),
        Interest('Participation Citoyenne et Engagement pour le Développement Durable'),
      ]),
      Interest('Psychologie de l\'Éducation et Conseil', [
        Interest('Développement Cognitif et Apprentissage'),
        Interest('Motivation et Engagement des Élèves'),
        Interest('Besoins Éducatifs Particuliers et Inclusion'),
        Interest('Évaluation Psychologique et Éducative'),
        Interest('Intervention et Conseil Scolaire'),
        Interest('Psychologie Sociale de l\'Éducation'),
        Interest('Formation et Développement Professionnel des Enseignants'),
        Interest('Technologies Éducatives et Apprentissage Numérique'),
      ]),
      Interest('Recherche en Éducation et Politiques Éducatives', [
        Interest('Méthodologies de Recherche en Éducation'),
        Interest('Analyse des Politiques Éducatives'),
        Interest('Évaluation des Programmes et des Interventions Éducatives'),
        Interest('Technologies Éducatives et Innovation'),
        Interest('Gouvernance et Leadership dans l\'Éducation'),
        Interest('Équité et Inclusion dans l\'Éducation'),
        Interest('Développement Professionnel des Enseignants'),
        Interest('Tendances Globales en Éducation'),
      ]),
    ]),
    Interest('Médias, Communication et Culture', [
      Interest('Théorie et Études des Médias', [
        Interest('Analyse Critique des Médias'),
        Interest('Médias Numériques et Société'),
        Interest('Économie Politique des Médias'),
        Interest('Médias et Identité'),
        Interest('Communication et Technologies'),
        Interest('Médias et Éducation'),
        Interest('Psychologie des Médias'),
        Interest('Éthique et Régulation des Médias'),
      ]),
      Interest('Communication et Relations Publiques', [
        Interest('Stratégies de Communication d\'Entreprise'),
        Interest('Gestion de Crise et Communication'),
        Interest('Relations Publiques Numériques'),
        Interest('Éthique et Régulation en Relations Publiques'),
        Interest('Communication de Marque et Positionnement'),
        Interest('Relations Médias et Stratégie de Contenu'),
        Interest('Événementiel et Communication Expérientielle'),
        Interest('Analyse et Mesure de l\'Efficacité des Relations Publiques'),
      ]),
      Interest('Journalisme et Reportage', [
        Interest('Journalisme d\'Investigation'),
        Interest('Éthique et Déontologie du Journalisme'),
        Interest('Journalisme Multimédia et Numérique'),
        Interest('Reportage sur les Conflits et le Journalisme de Guerre'),
        Interest('Journalisme Environnemental et Scientifique'),
        Interest('Journalisme Économique et Financier'),
        Interest('Photographie et Vidéojournalisme'),
        Interest('Histoire et Théorie du Journalisme'),
      ]),
      Interest('Production et Analyse de Contenu', [
        Interest('Création de Contenu Numérique'),
        Interest('Narration Multimédia'),
        Interest('Analyse de Médias et Critique Culturelle'),
        Interest('Stratégies de Marketing de Contenu'),
        Interest('Production Audiovisuelle'),
        Interest('Journalisme de Données'),
        Interest('Gestion de Contenu et Archivage Numérique'),
        Interest('Éthique et Légalité dans la Production de Contenu'),
      ]),
      Interest('Culture et Industries Culturelles', [
        Interest('Économie de la Culture'),
        Interest('Gestion des Institutions Culturelles'),
        Interest('Patrimoine Culturel et Conservation'),
        Interest('Politiques Culturelles et Régulation'),
        Interest('Médiation Culturelle et Éducation'),
        Interest('Industries Créatives et Innovation'),
        Interest('Culture Populaire et Médias'),
        Interest('Diversité Culturelle et Interculturalité'),
      ]),
      Interest('Communication Interculturelle et Globale', [
        Interest('Théories de la Communication Interculturelle'),
        Interest('Compétences en Communication Interculturelle'),
        Interest('Communication Globale et Médias Internationaux'),
        Interest('Gestion de la Diversité dans les Organisations'),
        Interest('Négociation et Résolution de Conflits Interculturels'),
        Interest('Marketing et Publicité Interculturels'),
        Interest('Études de Cas sur la Communication Interculturelle'),
        Interest('Éthique et Responsabilité Sociale dans la Communication Globale'),
      ]),
      Interest('Technologies de l\'Information et de la Communication (TIC)', [
        Interest('Systèmes d\'Information et Gestion de Données'),
        Interest('Réseaux et Télécommunications'),
        Interest('Sécurité des Systèmes d\'Information'),
        Interest('Développement de Logiciels et Programmation'),
        Interest('Intelligence Artificielle et Systèmes Intelligents'),
        Interest('Interaction Homme-Machine (IHM) et Expérience Utilisateur (UX)'),
        Interest('Technologies Web et Développement Web'),
        Interest('TIC pour le Développement Durable'),
      ]),
      Interest('Marketing et Communication Commerciale', [
        Interest('Stratégies de Marketing Numérique'),
        Interest('Comportement du Consommateur et Recherche de Marché'),
        Interest('Branding et Gestion de Marque'),
        Interest('Communication Publicitaire et Création de Campagnes'),
        Interest('Relations Publiques et Gestion de la Réputation'),
        Interest('Marketing International et Stratégies Globales'),
        Interest('Innovation en Marketing et Tendances Émergentes'),
        Interest('Éthique du Marketing et Responsabilité Sociale'),
      ]),
      Interest('Éducation aux Médias et Littératie Numérique', [
        Interest('Théories et Cadres de l\'Éducation aux Médias'),
        Interest('Développement des Compétences en Littératie Numérique'),
        Interest('Sécurité en Ligne et Éthique Numérique'),
        Interest('Utilisation Pédagogique des Médias Sociaux'),
        Interest('Analyse et Production de Médias'),
        Interest('Littératie Médiatique dans Divers Contextes Culturels'),
        Interest('Politiques et Initiatives en Éducation aux Médias'),
        Interest('Évaluation de la Littératie Médiatique et Numérique'),
      ]),
    ]),
    Interest('Langues, Littérature et Études Interculturelles', [
      Interest('Linguistique et Philologie', [
        Interest('Théories Linguistiques et Grammaticales'),
        Interest('Sociolinguistique et Variation Linguistique'),
        Interest('Psycholinguistique et Acquisition du Langage'),
        Interest('Philologie et Études Textuelles'),
        Interest('Linguistique Appliquée et Didactique des Langues'),
        Interest('Langues en Danger et Revitalisation Linguistique'),
        Interest('Linguistique Computationnelle et Traitement Automatique des Langues'),
        Interest('Pragmatique et Analyse du Discours'),
      ]),
      Interest('Littérature et Critique Littéraire', [
        Interest('Théorie Littéraire'),
        Interest('Genres et Formes Littéraires'),
        Interest('Littérature Comparée'),
        Interest('Littératures Nationales et Régionales'),
        Interest('Littérature Moderne et Contemporaine'),
        Interest('Critique Littéraire et Analyse Textuelle'),
        Interest('Histoire Littéraire et Contextes Culturels'),
        Interest('Études Interdisciplinaires en Littérature'),
      ]),
      Interest('Études Interculturelles et Transnationales', [
        Interest('Dynamiques Interculturelles et Communication'),
        Interest('Globalisation et Flux Culturels'),
        Interest('Migration et Diasporas'),
        Interest('Politiques Culturelles et Identités Transnationales'),
        Interest('Littérature et Cinéma Transnationaux'),
        Interest('Colonialisme, Postcolonialisme, et Décolonialité'),
        Interest('Études de Genre et Intersectionnalité dans un Contexte Transnational'),
        Interest('Éthique et Responsabilité Sociale dans un Monde Globalisé'),
      ]),
      Interest('Traduction et Interprétation', [
        Interest('Théories de la Traduction'),
        Interest('Pratique Professionnelle de la Traduction'),
        Interest('Outils et Technologies de Traduction'),
        Interest('Interprétation Simultanée et Consécutive'),
        Interest('Localisation et Globalisation'),
        Interest('Éthique et Déontologie en Traduction et Interprétation'),
        Interest('Traduction Audiovisuelle et Sous-titrage'),
        Interest('Formation et Développement Professionnel en Traduction et Interprétation'),
      ]),
      Interest('Langues Étrangères et Acquisition de Langues', [
        Interest('Méthodologies d\'Enseignement des Langues'),
        Interest('Psycholinguistique et Acquisition de la Seconde Langue'),
        Interest('Technologies Éducatives en Langues'),
        Interest('Évaluation et Mesure en Acquisition de Langues'),
        Interest('Bilinguisme et Multilinguisme'),
        Interest('Interférence Linguistique et Erreurs d\'Apprentissage'),
        Interest('Cultures et Interculturalité dans l\'Apprentissage des Langues'),
        Interest('Didactique des Langues pour Publics Spécifiques'),
      ]),
      Interest('Études Régionales et Culturelles', [
        Interest('Études Asiatiques'),
        Interest('Études Africaines'),
        Interest('Études Européennes'),
        Interest('Études Latino-Américaines et Caraïbes'),
        Interest('Études Moyen-Orientales'),
        Interest('Études Nord-Américaines'),
        Interest('Études sur les Peuples Autochtones'),
        Interest('Études Transnationales et Globalisation'),
      ]),
      Interest('Littérature pour Enfants et Jeunes Adultes', [
        Interest('Théorie et Critique de la Littérature pour Enfants'),
        Interest('Développement de l\'Enfant et Littérature'),
        Interest('Littérature Jeunes Adultes et Identité'),
        Interest('Illustration et Design dans les Livres pour Enfants'),
        Interest('Histoire de la Littérature pour Enfants'),
        Interest('Adaptations et Transmédialité'),
        Interest('Censure et Controverses dans la Littérature pour Enfants'),
        Interest('Littérature pour Enfants dans un Contexte Global'),
      ]),
      Interest('Médias et Littérature Numérique', [
        Interest('Théorie des Médias Numériques'),
        Interest('Littérature Électronique et Hypertexte'),
        Interest('Production de Contenu Numérique'),
        Interest('Analyse de Texte Numérique et Humanités Numériques'),
        Interest('Médias Sociaux et Pratiques Littéraires'),
        Interest('Jeux Vidéo et Narration Interactive'),
        Interest('Littérature et Art Numérique'),
        Interest('Éthique et Droits d\'Auteur dans l\'Environnement Numérique'),
      ]),
      Interest('Écriture Créative et Composition', [
        Interest('Ateliers d\'Écriture Créative'),
        Interest('Théorie de l\'Écriture Créative'),
        Interest('Écriture et Médias Numériques'),
        Interest('Genres et Formes en Écriture Créative'),
        Interest('Écriture et Identité'),
        Interest('Écriture pour Enfants et Jeunes Adultes'),
        Interest('Publication et Industrie Littéraire'),
        Interest('Critique Littéraire et Révision'),
      ]),
    ]),
    Interest('Sciences Politiques et Relations Internationales', [
      Interest('Théorie Politique et Philosophie Politique', [
        Interest('Fondements de la Théorie Politique'),
        Interest('Philosophie Politique Classique et Moderne'),
        Interest('Éthique et Politique'),
        Interest('Politique Comparée et Systèmes Politiques'),
        Interest('Idéologies Politiques'),
        Interest('Féminisme et Théorie Politique'),
        Interest('Postcolonialisme et Théorie Politique'),
        Interest('Démocratie Deliberative et Participation Citoyenne'),
      ]),
      Interest('Politique Comparée et Systèmes Politiques', [
        Interest('Démocraties et Régimes Autoritaires'),
        Interest('Systèmes de Gouvernement et de Partis'),
        Interest('Fédéralisme, Décentralisation et Gouvernance Locale'),
        Interest('Politiques Publiques Comparées'),
        Interest('Mouvements Sociaux et Politiques'),
        Interest('Identité, Ethnie et Politique'),
        Interest('Réformes Électorales et Systèmes de Vote'),
        Interest('Globalisation et État-Nation'),
      ]),
      Interest('Relations Internationales et Diplomatie', [
        Interest('Théories des Relations Internationales'),
        Interest('Sécurité Internationale et Stratégie'),
        Interest('Diplomatie et Négociation Internationale'),
        Interest('Organisations Internationales et Gouvernance Globale'),
        Interest('Économie Politique Internationale'),
        Interest('Droit International et Justice'),
        Interest('Politique Étrangère et Analyse de Politique'),
        Interest('Diplomatie Publique et Communication'),
      ]),
      Interest('Géopolitique et Études Stratégiques', [
        Interest('Analyse Géopolitique des Conflits'),
        Interest('Théorie des Relations de Pouvoir Internationales'),
        Interest('Stratégies de Sécurité Nationale et Défense'),
        Interest('Intelligence et Sécurité Internationale'),
        Interest('Géoéconomie et Économie Politique Internationale'),
        Interest('Environnement, Changement Climatique et Géopolitique'),
        Interest('Régionalisme et Géopolitique Régionale'),
        Interest('Cyberespace et Géopolitique du Numérique'),
      ]),
      Interest('Économie Politique Internationale', [
        Interest('Globalisation Économique et Intégration Régionale'),
        Interest('Systèmes Financiers Internationaux'),
        Interest('Politiques Commerciales et Régimes de Commerce'),
        Interest('Développement Économique et Coopération Internationale'),
        Interest('Gouvernance Économique Mondiale'),
        Interest('Énergie et Ressources Naturelles dans la Politique Mondiale'),
        Interest('Travail et Migrations Internationales'),
        Interest('Technologie, Innovation et Économie Politique'),
      ]),
      Interest('Politique Environnementale et Développement Durable', [
        Interest('Gouvernance Environnementale Globale'),
        Interest('Changement Climatique et Politiques d\'Atténuation'),
        Interest('Conservation de la Biodiversité et Aires Protégées'),
        Interest('Gestion Durable des Ressources Naturelles'),
        Interest('Économie Verte et Emplois Durables'),
        Interest('Justice Environnementale et Équité Sociale'),
        Interest('Politiques Urbaines et Aménagement Durable'),
        Interest('Éducation pour le Développement Durable'),
      ]),
      Interest('Droits Humains et Justice Globale', [
        Interest('Théories des Droits Humains'),
        Interest('Mécanismes Internationaux de Protection des Droits Humains'),
        Interest('Droits des Populations Vulnérables'),
        Interest('Justice Transitionnelle et Réconciliation'),
        Interest('Lutte contre la Discrimination et l\'Inégalité'),
        Interest('Droits Économiques, Sociaux et Culturels'),
        Interest('Activisme et Plaidoyer pour les Droits Humains'),
        Interest('Environnement, Changement Climatique et Droits Humains'),
      ]),
      Interest('Médias, Opinion Publique et Communication Politique', [
        Interest('Théories de la Communication Politique'),
        Interest('Analyse des Médias et du Discours Politique'),
        Interest('Stratégies de Communication des Campagnes Politiques'),
        Interest('Médias Sociaux et Politique'),
        Interest('Opinion Publique et Sondages'),
        Interest('Communication de Crise et Politique'),
        Interest('Propagande, Persuasion et Influence Média'),
        Interest('Éthique des Médias et Responsabilité Journalistique'),
      ]),
      Interest('Études de Genre et Politique', [
        Interest('Théories Féministes et Théorie Politique'),
        Interest('Genre, Pouvoir et Institutions Politiques'),
        Interest('Politiques de la Reproduction et Droits Sexuels'),
        Interest('Genre et Politiques Publiques'),
        Interest('Mouvements Sociaux de Genre et Activisme'),
        Interest('Genre, Conflit et Sécurité Internationale'),
        Interest('Intersectionnalité et Politique'),
        Interest('Genre et Médias'),
      ]),
    ]),
    Interest('Études Religieuses et Spirituelles', [
      Interest('Théologie et Textes Sacrés', [
        Interest('Herméneutique des Textes Sacrés'),
        Interest('Théologie Comparative'),
        Interest('Théologie Systématique'),
        Interest('Théologie Pratique'),
        Interest('Histoire des Interprétations et Réceptions'),
        Interest('Textes Sacrés et Société'),
        Interest('Langues Anciennes et Traduction des Textes Sacrés'),
        Interest('Écologie, Science, et Théologie'),
      ]),
      Interest('Histoire des Religions et Mouvements Religieux', [
        Interest('Origines et Développement des Traditions Religieuses'),
        Interest('Sectes, Cultes et Nouveaux Mouvements Religieux'),
        Interest('Religion et Société'),
        Interest('Mysticisme et Spiritualité'),
        Interest('Hérésies et Controverses Doctrinales'),
        Interest('Religion et Politique'),
        Interest('Rites, Cérémonies et Pratiques Liturgiques'),
        Interest('Archéologie et Religions Anciennes'),
      ]),
      Interest('Spiritualité et Pratiques Méditatives', [
        Interest('Histoire et Philosophie des Pratiques Méditatives'),
        Interest('Méditation et Pleine Conscience'),
        Interest('Spiritualité et Santé Mentale'),
        Interest('Yoga et Pratiques Corporelles Spirituelles'),
        Interest('Traditions Spirituelles et Pratiques Contemplatives'),
        Interest('Spiritualité et Écologie'),
        Interest('Psychologie Transpersonnelle et États de Conscience'),
        Interest('Applications Thérapeutiques des Pratiques Méditatives'),
      ]),
      Interest('Religions et Société', [
        Interest('Impact Social des Religions'),
        Interest('Religion et Changement Social'),
        Interest('Sécularisation et Revitalisation Religieuse'),
        Interest('Religions, Conflits et Paix'),
        Interest('Pluralisme Religieux et Dialogue Interreligieux'),
        Interest('Genre, Sexualité et Religions'),
        Interest('Religion et Politique'),
        Interest('Religion et Médias'),
      ]),
      Interest('Philosophie et Éthique Religieuses', [
        Interest('Fondements Philosophiques des Religions'),
        Interest('Éthique Religieuse et Morale'),
        Interest('Dialogues Interreligieux et Philosophie Comparative'),
        Interest('Mysticisme et Expérience Spirituelle'),
        Interest('Liberté, Responsabilité et Destin dans les Traditions Religieuses'),
        Interest('Philosophie de la Religion et Science'),
        Interest('Vie, Mort et Au-delà dans les Perspectives Religieuses'),
        Interest('Justice Sociale et Engagement Religieux'),
      ]),
      Interest('Religions et Environnement', [
        Interest('Écothéologie et Spiritualité de la Terre'),
        Interest('Pratiques Religieuses et Conservation de l\'Environnement'),
        Interest('Religions et Changement Climatique'),
        Interest('Éthique Environnementale dans les Traditions Religieuses'),
        Interest('Sacralité de la Nature et Lieux Sacrés'),
        Interest('Rites et Célébrations Religieuses liées à l\'Environnement'),
        Interest('Dialogue Interreligieux sur l\'Écologie'),
        Interest('Religions, Technologie et Innovation pour le Développement Durable'),
      ]),
      Interest('Psychologie de la Religion', [
        Interest('Fondements et Théories en Psychologie de la Religion'),
        Interest('Développement Religieux et Spirituel'),
        Interest('Expériences Religieuses et Mystiques'),
        Interest('Religion, Santé Mentale et Bien-être'),
        Interest('Identité, Appartenance et Communauté Religieuse'),
        Interest('Psychologie des Croyances et des Pratiques Religieuses'),
        Interest('Critique et Déconversion Religieuse'),
        Interest('Psychologie et Interprétation des Textes Sacrés'),
      ]),
      Interest('Art, Culture et Religion', [
        Interest('Symbolisme Religieux dans l\'Art'),
        Interest('Rituel, Cérémonie et Performance Religieuse'),
        Interest('Musique Sacrée et Chant Religieux'),
        Interest('Architecture Religieuse et Espaces Sacrés'),
        Interest('Art Religieux et Identité Culturelle'),
        Interest('Littérature Religieuse et Narration Spirituelle'),
        Interest('Iconographie et Vénération des Images'),
        Interest('Art Contemporain et Spiritualité'),
      ]),
      Interest('Religion et Politique', [
        Interest('Influence Religieuse sur la Politique Publique'),
        Interest('Laïcité, Séparation de l\'Église et de l\'État'),
        Interest('Religion et Conflits Identitaires'),
        Interest('Diplomatie Religieuse et Relations Internationales'),
        Interest('Mouvements Sociaux et Politiques Religieux'),
        Interest('Fondamentalisme et Extrémisme Religieux'),
        Interest('Genre, Sexualité et Religion dans la Politique'),
        Interest('Écologie, Changement Climatique et Stewardship Religieux'),
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
