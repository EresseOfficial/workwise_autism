import 'package:flutter/material.dart';
import 'package:workwise_autism/screens/status/autism/signup/profile_creation/profile_customization.dart';
import 'package:workwise_autism/widgets/color_constants.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      Interest('Sciences Naturelles', [
        Interest('Biologie et Écologie'),
        Interest('Géologie et Sciences de la Terre'),
        Interest('Astronomie et l\'Univers'),
        Interest('Physique et Chimie'),
        Interest('Météorologie et Climat'),
        Interest('Sciences de l\'Eau et des Océans'),
        Interest('Biodiversité et Conservation'),
        Interest('Énergies Renouvelables et Durabilité'),
        Interest('Anatomie et Physiologie Humaine'),
        Interest('Projets de Recherche et d\'Exploration'),
      ]),
      Interest('Physique et Chimie', [
        Interest('Concepts de Base en Physique'),
        Interest('Expériences de Chimie'),
        Interest('Physique Appliquée'),
        Interest('Chimie Organique et Inorganique'),
        Interest('Phénomènes Naturels'),
        Interest('Énergie et Ressources'),
        Interest('Chimie Expérimentale'),
        Interest('Applications de la Physique'),
        Interest('Sécurité en Laboratoire'),
        Interest('Projet Scientifique'),
      ]),
      Interest('Astronomie et Espace', [
        Interest('Observation du Ciel Nocturne'),
        Interest('Système Solaire et Planètes'),
        Interest('Espace Lointain et Galaxies'),
        Interest('Astronomie et Physique'),
        Interest('Histoire de l\'Astronomie'),
        Interest('Technologie Spatiale'),
        Interest('Vie dans l\'Univers'),
        Interest('Projets et Expériences'),
        Interest('Événements Astronomiques'),
        Interest('Exploration Spatiale et Missions'),
      ]),
      Interest('Technologie et Ingénierie', [
        Interest('Informatique et Programmation'),
        Interest('Robotique'),
        Interest('Ingénierie Mécanique'),
        Interest('Technologies Numériques'),
        Interest('Ingénierie Électrique et Électronique'),
        Interest('Énergies Renouvelables'),
        Interest('Design et Innovation'),
        Interest('Aéronautique et Espace'),
        Interest('Technologie Environnementale'),
        Interest('Ateliers et Laboratoires Pratiques'),
      ]),
      Interest('Sciences de l\'Environnement', [
        Interest('Écologie et Biodiversité'),
        Interest('Changement Climatique et Impact Environnemental'),
        Interest('Gestion des Ressources Naturelles'),
        Interest('Énergies Renouvelables et Durabilité'),
        Interest('Pollution et Solutions Environnementales'),
        Interest('Sciences Atmosphériques et Météorologie'),
        Interest('Étude des Océans et des Cours d\'Eau'),
        Interest('Agriculture et Alimentation Durable'),
        Interest('Projets de Conservation et de Restauration'),
        Interest('Éducation Environnementale et Sensibilisation'),
      ]),
      Interest('Mathématiques Appliquées', [
        Interest('Statistiques et Probabilités'),
        Interest('Géométrie et Mesure'),
        Interest('Algèbre Appliquée'),
        Interest('Mathématiques Financières'),
        Interest('Mathématiques dans la Vie Quotidienne'),
        Interest('Mathématiques et Technologie'),
        Interest('Modélisation Mathématique'),
        Interest('Mathématiques et Sciences'),
        Interest('Projets et Recherches Mathématiques'),
        Interest('Mathématiques et Art'),
      ]),
      Interest('Exploration et Expéditions', [
        Interest('Expéditions Géographiques'),
        Interest('Expéditions Scientifiques'),
        Interest('Voyages Culturels et Historiques'),
        Interest('Exploration Aquatique'),
        Interest('Astronomie et Observation des Étoiles'),
        Interest('Aventures en Plein Air'),
        Interest('Projet de Découverte Environnementale'),
        Interest('Voyages Éducatifs'),
        Interest('Photographie et Journalisme d\'Exploration'),
        Interest('Sensibilisation à l\'Écologie et à l\'Environnement'),
      ]),
    ]),
    Interest('Technologie et Informatique', [
      Interest('Programmation Informatique', [
        Interest('Initiation à la Programmation'),
        Interest('Développement de Projets Numériques'),
        Interest('Programmation Graphique et Visuelle'),
        Interest('Robotique et Programmation'),
        Interest('Programmation Web et Design'),
        Interest('Programmation et Mathématiques'),
        Interest('Intelligence Artificielle et Machine Learning'),
        Interest('Programmation Collaborative et Projets en Groupe'),
        Interest('Sécurité Informatique et Éthique'),
        Interest('Programmation et Multimédia'),
      ]),
      Interest('Robotique et Automatisation', [
        Interest('Initiation à la Robotique'),
        Interest('Robotique Éducative'),
        Interest('Automatisation et Contrôle'),
        Interest('Robotique et Science'),
        Interest('Conception et Ingénierie'),
        Interest('Concours et Challenges de Robotique'),
        Interest('Robotique et Programmation'),
        Interest('Projet de Robotique Appliquée'),
        Interest('Robotique et Multimédia'),
        Interest('Sécurité et Éthique en Robotique'),
      ]),
      Interest('Conception et Graphisme', [
        Interest('Principes de Base du Design Graphique'),
        Interest('Utilisation de Logiciels de Graphisme'),
        Interest('Projet de Création Graphique'),
        Interest('Infographie et Visualisation de Données'),
        Interest('Design d\'Interface Utilisateur (UI)'),
        Interest('Art Numérique et Création'),
        Interest('Projets de Design Collaboratifs'),
        Interest('Conception et Imprimerie'),
        Interest('Design Web et Multimédia'),
        Interest('Sécurité et Éthique dans le Design'),
      ]),
      Interest('Informatique et Matériel', [
        Interest('Composants de l\'Ordinateur'),
        Interest('Maintenance et Mise à Niveau'),
        Interest('Réseaux et Connectivité'),
        Interest('Stockage de Données et Sauvegarde'),
        Interest('Sécurité Matérielle'),
        Interest('Impression 3D et Fabrication'),
        Interest('Projets de Matériel Informatique'),
        Interest('Robotique et Matériel'),
        Interest('Exploration de Nouvelles Technologies'),
        Interest('Électronique de Base et Circuits'),
      ]),
      Interest('Réseaux et Cybersécurité', [
        Interest('Principes de Base des Réseaux'),
        Interest('Cybersécurité et Protection en Ligne'),
        Interest('Réseaux Sans Fil et Mobiles'),
        Interest('Protocoles et Normes de Réseau'),
        Interest('Administration de Réseau'),
        Interest('Principes de la Cybersécurité'),
        Interest('Sécurité des Données et Confidentialité'),
        Interest('Ethique en Réseaux et Cybersécurité'),
        Interest('Projets Pratiques en Réseau'),
        Interest('Sécurité des Applications et des Services en Ligne'),
      ]),
      Interest('Technologies Émergentes', [
        Interest('Intelligence Artificielle (IA) et Apprentissage Automatique'),
        Interest('Réalité Virtuelle (RV) et Réalité Augmentée (RA)'),
        Interest('Robotique Avancée'),
        Interest('Internet des Objets (IoT)'),
        Interest('Impression 3D et Fabrication Numérique'),
        Interest('Blockchain et Cryptomonnaies'),
        Interest('Drones et Véhicules Aériens'),
        Interest('Technologies Portables (Wearables)'),
        Interest('Science des Données et Analyse'),
        Interest('Éthique et Impact des Technologies Émergentes'),
      ]),
      Interest('Projets et Expériences Pratiques', [
        Interest('Conception et Développement de Logiciels'),
        Interest('Fabrication et Modélisation 3D'),
        Interest('Robotique et Automatisation'),
        Interest('Électronique et Circuits'),
        Interest('Expériences Informatiques'),
        Interest('Réseaux et Communication'),
        Interest('Projets Multimédias'),
        Interest('Technologies Émergentes'),
        Interest('Projets Interdisciplinaires'),
        Interest('Développement Personnel et Collaboration'),
      ]),
    ]),
    Interest('Arts et Expression Créative', [
      Interest('Arts Visuels', [
        Interest('Dessin et Illustration'),
        Interest('Peinture et Techniques Mixtes'),
        Interest('Sculpture et Modelage'),
        Interest('Photographie et Arts Numériques'),
        Interest('Artisanat et Métiers d\'Art'),
        Interest('Impression et Techniques d\'Estampe'),
        Interest('Art Contemporain et Expérimental'),
        Interest('Histoire de l\'Art et Critique'),
        Interest('Projets Collaboratifs et Expositions'),
        Interest('Techniques Traditionnelles et Folkloriques'),
      ]),
      Interest('Arts du Spectacle', [
        Interest('Théâtre et Performance'),
        Interest('Danse et Mouvement'),
        Interest('Musique et Chant'),
        Interest('Arts du Cirque et Acrobatie'),
        Interest('Arts Visuels et Performance'),
        Interest('Marionnettes et Théâtre d\'Objets'),
        Interest('Réalisation de Films et Vidéographie'),
        Interest('Production et Gestion de Spectacles'),
        Interest('Expression Créative et Improvisation'),
        Interest('Histoire des Arts du Spectacle et Critique'),
      ]),
      Interest('Musique et Son', [
        Interest('Apprentissage d\'Instruments'),
        Interest('Chant et Techniques Vocales'),
        Interest('Théorie Musicale et Composition'),
        Interest('Musique Assistée par Ordinateur'),
        Interest('Percussions et Rythme'),
        Interest('Histoire de la Musique et Genres Musicaux'),
        Interest('Musique et Mouvement'),
        Interest('Projets et Performances Musicales'),
        Interest('Exploration Sonore et Acoustique'),
        Interest('Musique et Technologie'),
      ]),
      Interest('Arts Numériques et Multimédia', [
        Interest('Graphisme et Design Numérique'),
        Interest('Animation Numérique'),
        Interest('Création de Jeux Vidéo'),
        Interest('Photographie Numérique et Traitement d\'Image'),
        Interest('Vidéographie et Montage Vidéo'),
        Interest('Art et Technologie'),
        Interest('Musique et Son Numérique'),
        Interest('Web Design et Création de Sites Web'),
        Interest('Programmation Créative'),
        Interest('Exploration Multimédia'),
      ]),
      Interest('Artisanat et Projets Créatifs', [
        Interest('Travaux Manuels et Bricolage'),
        Interest('Couture et Textiles'),
        Interest('Modelage et Sculpture'),
        Interest('Papier et Origami'),
        Interest('Peinture et Techniques Mixtes'),
        Interest('Bijouterie et Orfèvrerie'),
        Interest('Bois et Travail du Bois'),
        Interest('Projets Thématiques et Saisonniers'),
        Interest('Upcycling et Créativité Écologique'),
        Interest('Ateliers et Expositions'),
      ]),
      Interest('Expression et Communication Créative', [
        Interest('Écriture Créative et Poésie'),
        Interest('Journalisme et Rédaction'),
        Interest('Arts Oratoires et Présentation'),
        Interest('Expression Visuelle et Storytelling'),
        Interest('Musique et Expression Sonore'),
        Interest('Arts Multimédias et Numériques'),
        Interest('Langues et Communication Multiculturelle'),
        Interest('Développement Personnel et Auto-Expression'),
        Interest('Activités de Groupe et Collaboration'),
        Interest('Techniques de Communication et Médiation'),
      ]),
      Interest('Projets de Groupe et Collaborations', [
        Interest('Activités de Team Building'),
        Interest('Projets Artistiques Collaboratifs'),
        Interest('Activités Scientifiques et de Recherche en Équipe'),
        Interest('Projets Multimédias et Technologiques'),
        Interest('Sports d\'Équipe et Activités Physiques Collectives'),
        Interest('Projets de Service Communautaire'),
        Interest('Clubs d\'Intérêt et Associations'),
        Interest('Projets de Recherche Collaborative'),
        Interest('Ateliers et Séminaires de Groupe'),
        Interest('Projets Créatifs et Culturels'),
      ]),
    ]),
    Interest('Nature et Environnement', [
      Interest('Étude des Écosystèmes', [
        Interest('Forêts et Forêts Tropicales'),
        Interest('Milieux Aquatiques'),
        Interest('Déserts et Milieux Arides'),
        Interest('Montagnes et Régions Alpines'),
        Interest('Prairies et Savanes'),
        Interest('Zones Humides et Marécages'),
        Interest('Toundra et Régions Polaires'),
        Interest('Biodiversité et Espèces'),
        Interest('Observation et Recherches sur Terrain'),
        Interest('Sensibilisation et Éducation Environnementale'),
      ]),
      Interest('Sciences de la Terre', [
        Interest('Géologie et Minéralogie'),
        Interest('Phénomènes Géologiques'),
        Interest('Hydrologie et Océanographie'),
        Interest('Météorologie et Climatologie'),
        Interest('Paléontologie'),
        Interest('Astronomie et Sciences Spatiales'),
        Interest('Conservation et Environnement'),
        Interest('Expéditions et Observations sur Terrain'),
        Interest('Activités Éducatives et Expériences Pratiques'),
        Interest('Éducation sur les Risques Naturels'),
      ]),
      Interest('Environnement et Durabilité', [
        Interest('Conservation de la Nature'),
        Interest('Énergies Renouvelables et Technologies Vertes'),
        Interest('Gestion des Ressources Naturelles'),
        Interest('Agriculture et Alimentation Durable'),
        Interest('Pollution et Gestion des Déchets'),
        Interest('Changement Climatique et Impact Environnemental'),
        Interest('Écosystèmes et Services Écosystémiques'),
        Interest('Éducation Environnementale et Sensibilisation'),
        Interest('Activités et Projets Pratiques'),
        Interest('Études de Cas et Exemples Réels'),
      ]),
      Interest('Botanique et Horticulture', [
        Interest('Étude des Plantes'),
        Interest('Horticulture et Jardinage'),
        Interest('Botanique Appliquée'),
        Interest('Écologie des Plantes'),
        Interest('Protection et Conservation des Plantes'),
        Interest('Expériences Pratiques en Botanique'),
        Interest('Visites Éducatives et Exploration'),
        Interest('Art et Créativité avec les Plantes'),
        Interest('Science et Technologie des Plantes'),
      ]),
      Interest('Faune et Observation des Animaux', [
        Interest('Étude des Différentes Espèces Animales'),
        Interest('Habitats et Écosystèmes'),
        Interest('Comportement Animal et Éthologie'),
        Interest('Conservation et Protection des Animaux'),
        Interest('Observation et Étude sur le Terrain'),
        Interest('Interaction et Soin des Animaux'),
        Interest('Art et Créativité liés aux Animaux'),
        Interest('Éducation et Sensibilisation sur la Faune'),
      ]),
      Interest('Activités et Exploration en Plein Air', [
        Interest('Randonnées et Explorations Naturelles'),
        Interest('Observation de la Faune'),
        Interest('Activités Éducatives Extérieures'),
        Interest('Camping et Bivouac'),
        Interest('Activités Aquatiques'),
        Interest('Jardinage et Horticulture'),
        Interest('Photographie Nature et Exploration Visuelle'),
        Interest('Sports Extérieurs et Aventures'),
        Interest('Protection et Conservation de l\'Environnement'),
      ]),
      Interest('Sciences Environnementales Appliquées', [
        Interest('Étude des Écosystèmes'),
        Interest('Gestion des Ressources Naturelles'),
        Interest('Changement Climatique et Impact Environnemental'),
        Interest('Pollution et Gestion des Déchets'),
        Interest('Énergies Renouvelables et Alternatives'),
        Interest('Agriculture Durable et Alimentation'),
        Interest('Protection de la Faune et de la Flore'),
        Interest('Éducation Environnementale et Sensibilisation'),
        Interest('Activités Pratiques et Expériences sur le Terrain'),
      ]),
    ]),
    Interest('Sports et Activités Physiques', [
      Interest('Sports Individuels', [
        Interest('Athlétisme'),
        Interest('Natation'),
        Interest('Arts Martiaux'),
        Interest('Cyclisme'),
        Interest('Gymnastique'),
        Interest('Tennis ou Badminton'),
        Interest('Escrime'),
        Interest('Tir à l\'Arc'),
        Interest('Sports de Raquette'),
        Interest('Skateboard ou Roller'),
        Interest('Equitation'),
      ]),
      Interest('Sports d\'Équipe', [
        Interest('Football'),
        Interest('Basketball'),
        Interest('Volleyball'),
        Interest('Handball'),
        Interest('Rugby'),
        Interest('Baseball ou Softball'),
        Interest('Ultimate Frisbee'),
        Interest('Hockey sur Gazon ou sur Glace'),
        Interest('Relais et Athlétisme d\'Équipe'),
        Interest('Sports Aquatiques d\'Équipe'),
        Interest('Cricket'),
      ]),
      Interest('Activités de Plein Air', [
        Interest('Randonnée et Exploration'),
        Interest('Camping'),
        Interest('Canoë et Kayak'),
        Interest('Vélo et VTT'),
        Interest('Escalade et Alpinisme'),
        Interest('Sports Nautiques'),
        Interest('Orienteering et Géocaching'),
        Interest('Jardinage et Horticulture'),
        Interest('Observation Astronomique'),
        Interest('Pêche'),
        Interest('Photographie de la Nature'),
      ]),
      Interest('Arts Martiaux et Autodéfense', [
        Interest('Judo'),
        Interest('Karaté'),
        Interest('Taekwondo'),
        Interest('Aïkido'),
        Interest('Kung Fu'),
        Interest('Boxe et Kickboxing'),
        Interest('Krav Maga et Autodéfense'),
        Interest('Capoeira'),
        Interest('Jiu-Jitsu Brésilien'),
        Interest('Self-Defense Pratique'),
      ]),
      Interest('Gymnastique et Yoga', [
        Interest('Gymnastique'),
        Interest('Yoga'),
        Interest('Gymnastique Rythmique'),
        Interest('Yoga Adapté'),
        Interest('Pilates'),
        Interest('Acroyoga et Partner Yoga'),
        Interest('Stretching et Flexibilité'),
      ]),
      Interest('Jeux et Activités Ludiques', [
        Interest('Jeux de Société et de Stratégie'),
        Interest('Jeux de Cartes et de Logique'),
        Interest('Jeux de Rôle et d\'Imagination'),
        Interest('Puzzles et Casse-têtes'),
        Interest('Jeux Vidéo et Interactifs'),
        Interest('Activités de Construction et de Création'),
        Interest('Jeux de Plein Air et d\'Aventure'),
        Interest('Jeux de Société Modernes et Innovants'),
        Interest('Activités de Réflexion et de Développement Mental'),
        Interest('Jeux Collaboratifs et d\'Équipe'),
      ]),
      Interest('Forme Physique et Entraînement', [
        Interest('Entraînement en Force et Conditionnement'),
        Interest('Aérobic et Cardio-Training'),
        Interest('Yoga et Pilates pour la Forme Physique'),
        Interest('Activités de Plein Air et Randonnée'),
        Interest('Sports Individuels et d\'Équipe'),
        Interest('Entraînement Flexibilité et Équilibre'),
        Interest('Cours de Danse et Mouvement'),
        Interest('Activités Aquatiques'),
        Interest('Programmes d\'Entraînement Personnalisés'),
        Interest('Relaxation et Récupération'),
      ]),
    ]),
    Interest('Animaux et Soins des Animaux', [
      Interest('Étude des Animaux', [
        Interest('Zoologie et Biologie Animale'),
        Interest('Écologie et Conservation'),
        Interest('Observation et Identification des Animaux'),
        Interest('Soins et Gestion des Animaux'),
        Interest('Projets de Science Citoyenne'),
        Interest('Aquariums et Terrariums'),
        Interest('Visites et Excursions Éducatives'),
        Interest('Ateliers et Séminaires'),
        Interest('Activités de Groupe et Projets Collaboratifs'),
        Interest('Photographie de la Faune'),
      ]),
      Interest('Soins des Animaux Domestiques', [
        Interest('Alimentation et Nutrition Animale'),
        Interest('Toilettage et Hygiène'),
        Interest('Santé et Soins Vétérinaires de Base'),
        Interest('Éducation et Comportement Animal'),
        Interest('Activités et Exercices'),
        Interest('Soin des Animaux Spéciaux et Âgés'),
        Interest('Responsabilités Quotidiennes'),
        Interest('Protection et Sécurité des Animaux'),
        Interest('Projets et Activités Éducatives'),
        Interest('Visites et Excursions'),
      ]),
      Interest('Animaux de Ferme et Élevage', [
        Interest('Compréhension des Animaux de Ferme'),
        Interest('Soins Quotidiens et Alimentation'),
        Interest('Santé et Bien-être Animal'),
        Interest('Élevage et Reproduction'),
        Interest('Activités Agricoles Associées'),
        Interest('Travail en Ferme Éducative'),
        Interest('Interactions avec les Animaux'),
        Interest('Projets et Ateliers'),
        Interest('Développement de Compétences en Agriculture'),
        Interest('Participation à des Concours et Événements'),
      ]),
      Interest('Faune Sauvage et Conservation', [
        Interest('Étude des Animaux Sauvages'),
        Interest('Conservation et Protection de l\'Environnement'),
        Interest('Ecologie et Écosystèmes'),
        Interest('Observation et Identification des Animaux'),
        Interest('Visites et Excursions en Nature'),
        Interest('Projet de Recherche sur la Faune'),
        Interest('Éducation sur les Menaces Environnementales'),
        Interest('Activités et Ateliers sur la Faune'),
        Interest('Participation à des Programmes de Conservation'),
        Interest('Développement de Compétences en Sciences Naturelles'),
      ]),
      Interest('Aquariums et Aquariophilie', [
        Interest('Introduction à l\'Aquariophilie'),
        Interest('Soins des Poissons et des Plantes Aquatiques'),
        Interest('Écosystème Aquatique'),
        Interest('Conception et Décoration d\'Aquarium'),
        Interest('Santé et Bien-être des Poissons'),
        Interest('Projets et Ateliers sur l\'Aquariophilie'),
        Interest('Visites Éducatives et Excursions'),
        Interest('Recherche et Étude des Poissons'),
        Interest('Durabilité et Conservation'),
        Interest('Développement de Compétences en Biologie Marine'),
      ]),
      Interest('Activités Pratiques et Projets', [
        Interest('Projets de Bricolage et de Construction'),
        Interest('Arts et Artisanat'),
        Interest('Activités de Jardinage et Horticulture'),
        Interest('Science et Expérimentation'),
        Interest('Activités de Cuisine et de Pâtisserie'),
        Interest('Technologie et Informatique'),
        Interest('Photographie et Vidéo'),
        Interest('Musique et Performance'),
        Interest('Projets de Groupe et Collaborations'),
        Interest('Activités et Ateliers Éducatifs'),
      ]),
      Interest('Santé et Bien-être Animal', [
        Interest('Soins de Base des Animaux'),
        Interest('Santé Animale'),
        Interest('Comportement et Dressage'),
        Interest('Bien-être Animal'),
        Interest('Protection et Conservation des Animaux'),
        Interest('Projets Éducatifs sur les Animaux'),
        Interest('Interactions et Thérapie avec les Animaux'),
        Interest('Volontariat et Engagement Communautaire'),
        Interest('Éducation sur les Animaux de Compagnie'),
        Interest('Activités Pratiques et Ateliers'),
      ]),
    ]),
    Interest('Loisirs et Hobbies', [
      Interest('Collection et Exploration', [
        Interest('Collections Thématiques'),
        Interest('Collections Naturelles'),
        Interest('Collections Artistiques et Créatives'),
        Interest('Exploration de la Nature'),
        Interest('Exploration Urbaine et Historique'),
        Interest('Projets de Recherche et de Documentation'),
        Interest('Activités de Groupe et Collaborations'),
        Interest('Collections et Exploration Technologiques'),
        Interest('Collections et Études Littéraires'),
        Interest('Activités d\'Exploration et d\'Apprentissage'),
      ]),
      Interest('Activités Artistiques et Artisanales', [
        Interest('Arts Visuels'),
        Interest('Arts Manuels et Artisanat'),
        Interest('Projets de Création'),
        Interest('Textile et Couture'),
        Interest('Recyclage et Art Écologique'),
        Interest('Arts Numériques'),
        Interest('Expression Créative'),
        Interest('Projets Collectifs'),
        Interest('Étude et Analyse de l\'Art'),
        Interest('Ateliers et Cours'),
      ]),
      Interest('Jeux et Divertissements', [
        Interest('Jeux de Société et de Stratégie'),
        Interest('Jeux de Rôle et Imaginatifs'),
        Interest('Puzzles et Casse-têtes'),
        Interest('Jeux Vidéo et Interactifs'),
        Interest('Activités de Groupe et Compétitions'),
        Interest('Jeux de Construction et de Création'),
        Interest('Activités de Plein Air et Jeux Physiques'),
        Interest('Activités de Détente et de Relaxation'),
        Interest('Exploration des Médias et du Divertissement'),
        Interest('Projets et Expériences de Divertissement'),
      ]),
      Interest('Musique et Instruments', [
        Interest('Apprentissage d\'Instruments'),
        Interest('Musique et Rythme'),
        Interest('Chant et Vocalisation'),
        Interest('Théorie et Composition Musicale'),
        Interest('Musique Électronique et Technologie'),
        Interest('Musique du Monde et Diversité Culturelle'),
        Interest('Projets et Performances Musicales'),
        Interest('Expérience et Appréciation Musicale'),
        Interest('Ateliers et Cours Spécialisés'),
        Interest('Musique et Bien-être'),
      ]),
      Interest('Activités de Plein Air', [
        Interest('Randonnée et Exploration'),
        Interest('Camping et Survie'),
        Interest('Sports Extérieurs et Aventures'),
        Interest('Activités de Groupe en Plein Air'),
        Interest('Observation de la Nature et de la Faune'),
        Interest('Jardinage et Horticulture'),
        Interest('Photographie et Art en Plein Air'),
        Interest('Activités Écologiques et Environnementales'),
        Interest('Observation Astronomique et Étude du Ciel'),
        Interest('Excursions et Visites Éducatives'),
      ]),
      Interest('Photographie et Vidéographie', [
        Interest('Techniques de Base en Photographie'),
        Interest('Vidéographie et Montage'),
        Interest('Photographie Artistique'),
        Interest('Photographie de la Nature et de la Faune'),
        Interest('Projets de Photographie et Expositions'),
        Interest('Vidéographie Créative'),
        Interest('Traitement de l\'Image et Logiciels'),
        Interest('Vidéographie et Technologie'),
        Interest('Photographie Sociale et Documentaire'),
        Interest('Appréciation et Critique Photographique'),
      ]),
      Interest('Lecture et Écriture', [
        Interest('Lecture et Compréhension'),
        Interest('Écriture Créative'),
        Interest('Écriture et Grammaire'),
        Interest('Littérature et Études'),
        Interest('Journalisme et Rédaction'),
        Interest('Poésie et Expression'),
        Interest('Écriture Numérique et Multimédia'),
        Interest('Projets d\'Écriture Collaborative'),
        Interest('Écriture et Technologies'),
        Interest('Analyse et Critique Littéraire'),
      ]),
      Interest('Modélisme et Construction', [
        Interest('Modèles Réduits et Maquettes'),
        Interest('Lego et Blocs de Construction'),
        Interest('Robotique et Mécanique'),
        Interest('Modélisation 3D et Impression'),
        Interest('Architecture et Urbanisme'),
        Interest('Travaux Manuels et Bricolage'),
        Interest('Modèles Historiques et Éducatifs'),
        Interest('Électronique et Circuits'),
        Interest('Projets de Groupe et Collaboration'),
        Interest('Expositions et Présentations'),
      ]),
    ]),
    Interest('Langues et Littérature', [
      Interest('Apprentissage des Langues', [
        Interest('Apprentissage des Langues'),
        Interest('Cours de Langues'),
        Interest('Méthodes d\'Apprentissage Interactives'),
        Interest('Pratique de la Conversation'),
        Interest('Compréhension et Expression'),
        Interest('Culture et Traditions'),
        Interest('Multimédia et Ressources en Ligne'),
        Interest('Projets et Travaux Pratiques'),
        Interest('Littérature et Lecture'),
        Interest('Écriture et Grammaire'),
        Interest('Voyages et Immersions Linguistiques'),
      ]),
      Interest('Littérature et Lecture', [
        Interest('Genres Littéraires'),
        Interest('Littérature Jeunesse et Adolescents'),
        Interest('Lecture et Analyse Critique'),
        Interest('Étude des Auteurs et Biographies'),
        Interest('Poésie et Prose'),
        Interest('Littérature Classique et Historique'),
        Interest('Théâtre et Pièces de Théâtre'),
        Interest('Littérature Contemporaine'),
        Interest('Clubs de Lecture et Discussions de Groupe'),
        Interest('Projets de Littérature et de Lecture'),
      ]),
      Interest('Écriture et Expression Créative', [
        Interest('Ateliers d\'Écriture Créative'),
        Interest('Expression Personnelle'),
        Interest('Écriture Scripturale et Scénarios'),
        Interest('Projets d\'Écriture Collaborative'),
        Interest('Genres et Styles d\'Écriture'),
        Interest('Écriture et Multimédia'),
        Interest('Techniques d\'Écriture'),
        Interest('Publications et Partages'),
        Interest('Écriture et Technologies'),
        Interest('Expression et Développement Personnel'),
      ]),
      Interest('Étude de la Langue', [
        Interest('Grammaire et Syntaxe'),
        Interest('Vocabulaire et Usage'),
        Interest('Orthographe et Ponctuation'),
        Interest('Compréhension et Lecture'),
        Interest('Expression Écrite'),
        Interest('Analyse Linguistique'),
        Interest('Langue et Communication'),
        Interest('Langues Étrangères'),
        Interest('Projet et Recherche Linguistique'),
        Interest('Technologies et Langue'),
      ]),
      Interest('Littérature Mondiale et Culturelle', [
        Interest('Études des Classiques'),
        Interest('Littérature Contemporaine'),
        Interest('Littérature Régionale et Culturelle'),
        Interest('Genres Littéraires Divers'),
        Interest('Littérature et Histoire'),
        Interest('Biographies et Autobiographies'),
        Interest('Littérature et Société'),
        Interest('Projets et Présentations Littéraires'),
        Interest('Littérature et Expression Personnelle'),
        Interest('Études Comparatives et Interculturelles'),
      ]),
      Interest('Projets et Présentations', [
        Interest('Projets de Recherche Littéraire'),
        Interest('Développement et Présentation de Projets'),
        Interest('Ateliers d\'Écriture Créative'),
        Interest('Analyse et Critique Littéraire'),
        Interest('Projets Multimédia et Technologiques'),
        Interest('Expositions et Foires Littéraires'),
        Interest('Projets Interdisciplinaires'),
        Interest('Théâtre et Performance'),
        Interest('Projets Communautaires et Volontariat'),
        Interest('Développement Personnel et Compétences Sociales'),
      ]),
      Interest('Analyse et Critique Littéraire', [
        Interest('Étude des Genres Littéraires'),
        Interest('Analyse de Texte'),
        Interest('Étude des Thèmes Littéraires'),
        Interest('Personnages et Développement'),
        Interest('Point de Vue et Narration'),
        Interest('Langage et Style Littéraire'),
        Interest('Critique Littéraire'),
        Interest('Contexte Historique et Littérature'),
        Interest('Projets Littéraires Appliqués'),
        Interest('Réflexion Personnelle et Critique'),
      ]),
    ]),
    Interest('Histoire et Sciences Humaines', [
      Interest('Histoire Mondiale', [
        Interest('Civilisations Anciennes'),
        Interest('Moyen Âge et Renaissance'),
        Interest('Exploration et Découverte'),
        Interest('Histoire Moderne'),
        Interest('Histoire Contemporaine'),
        Interest('Cultures et Sociétés'),
        Interest('Étude Régionale'),
        Interest('Personnages Historiques'),
        Interest('Art et Histoire'),
        Interest('Projets et Activités Historiques'),
      ]),
      Interest('Histoire Locale et Nationale', [
        Interest('Découverte de l\'Histoire Locale'),
        Interest('Histoire Régionale'),
        Interest('Histoire Nationale'),
        Interest('Patrimoine et Identité'),
        Interest('Histoire Sociale et Quotidienne'),
        Interest('Étude des Conflits et Guerres'),
        Interest('Histoire Politique et Gouvernance'),
        Interest('Histoire Économique et Industrielle'),
        Interest('Projets Historiques Locaux et Nationaux'),
        Interest('Culture et Arts dans l\'Histoire'),
      ]),
      Interest('Géographie et Sociétés', [
        Interest('Géographie Physique'),
        Interest('Cartographie et Orientation'),
        Interest('Population et Sociétés'),
        Interest('Économie et Ressources'),
        Interest('Environnement et Durabilité'),
        Interest('Sociétés et Urbanisation'),
        Interest('Géographie Politique'),
        Interest('Géographie Culturelle'),
        Interest('Projets et Activités Géographiques'),
        Interest('Étude des Conflits et Sociétés'),
      ]),
      Interest('Sciences Politiques et Économie', [
        Interest('Fondements des Sciences Politiques'),
        Interest('Économie de Base'),
        Interest('Géopolitique et Relations Internationales'),
        Interest('Développement Durable et Économie'),
        Interest('Économie Sociale et Solidaire'),
        Interest('Histoire Économique et Politique'),
        Interest('Politiques Publiques et Société'),
        Interest('Économie Globale et Commerce'),
        Interest('Citoyenneté et Engagement'),
        Interest('Projets et Simulations'),
      ]),
      Interest('Anthropologie et Archéologie', [
        Interest('Découverte des Civilisations Anciennes'),
        Interest('Anthropologie Culturelle'),
        Interest('Archéologie de Terrain'),
        Interest('Peuples Autochtones et Cultures Locales'),
        Interest('Évolution Humaine et Préhistoire'),
        Interest('Histoire Locale et Archéologie Régionale'),
        Interest('Anthropologie Biologique'),
        Interest('Mythologie et Folklore'),
        Interest('Projets et Expériences Pratiques'),
        Interest('Sociétés Disparues et Mystères Historiques'),
      ]),
      Interest('Histoire des Arts et de la Culture', [
        Interest('Mouvements et Époques Artistiques'),
        Interest('Art à Travers les Cultures'),
        Interest('Techniques et Médiums Artistiques'),
        Interest('Impact Culturel de l\'Art'),
        Interest('Histoire de la Musique et des Arts du Spectacle'),
        Interest('Architecture et Design'),
        Interest('Artisanat et Arts Traditionnels'),
        Interest('Projets et Expériences Pratiques'),
        Interest('Littérature et Art Narratif'),
        Interest('Critique et Analyse Artistique'),
      ]),
      Interest('Projets de Recherche en Histoire et Sciences Humaines', [
        Interest('Études Historiques Approfondies'),
        Interest('Anthropologie et Sociétés'),
        Interest('Projets de Recherche Thématiques'),
        Interest('Études Géographiques et Environnementales'),
        Interest('Projet de Recherche Individuel'),
        Interest('Études Sociopolitiques'),
        Interest('Ethnographie et Études de Terrain'),
        Interest('Littérature et Histoire'),
        Interest('Projets Multimédias et Présentations'),
        Interest('Collaboration et Travaux de Groupe'),
      ]),
    ]),
    Interest('Médias et Communication', [
      Interest('Littératie des Médias', [
        Interest('Compréhension des Médias'),
        Interest('Création de Contenu Médiatique'),
        Interest('Sécurité et Éthique des Médias'),
        Interest('Médias Sociaux et Communication'),
        Interest('Analyse Critique des Médias'),
        Interest('Histoire et Évolution des Médias'),
        Interest('Projets de Littératie des Médias'),
        Interest('Journalisme et Reportage'),
        Interest('Médias et Culture'),
        Interest('Technologies Médiatiques et Innovations'),
      ]),
      Interest('Compétences en Communication', [
        Interest('Expression Verbale et Orale'),
        Interest('Communication Non Verbale'),
        Interest('Écoute Active et Empathie'),
        Interest('Compétences en Communication Interpersonnelle'),
        Interest('Communication en Groupe et en Équipe'),
        Interest('Communication Numérique et en Ligne'),
        Interest('Présentations et Discours'),
        Interest('Rédaction et Écriture'),
        Interest('Techniques de Narration'),
        Interest('Projets et Activités Pratiques'),
      ]),
      Interest('Médias Numériques et Réseaux Sociaux', [
        Interest('Utilisation des Réseaux Sociaux'),
        Interest('Création de Contenu Numérique'),
        Interest('Communication et Interaction en Ligne'),
        Interest('Créativité et Expression en Ligne'),
        Interest('Réseautage et Construction de Communauté'),
        Interest('Analyse et Critique des Médias'),
        Interest('Projets Multimédias'),
        Interest('Développement de Compétences Techniques'),
        Interest('Sécurité et Éthique en Ligne'),
        Interest('Projets et Activités Pratiques'),
      ]),
      Interest('Journalisme et Reportage', [
        Interest('Initiation au Journalisme'),
        Interest('Reportage Multimédia'),
        Interest('Journalisme d\'Investigation'),
        Interest('Médias Numériques et Communication'),
        Interest('Analyse et Critique de l\'Information'),
        Interest('Rédaction et Édition'),
        Interest('Journalisme Communautaire'),
        Interest('Éthique et Responsabilité'),
        Interest('Projets et Activités Pratiques'),
      ]),
      Interest('Production Audiovisuelle', [
        Interest('Initiation à la Production Vidéo'),
        Interest('Réalisation et Mise en Scène'),
        Interest('Montage et Post-Production'),
        Interest('Production de Courtes Formes'),
        Interest('Son et Musique pour Vidéo'),
        Interest('Techniques Narratives et Scénario'),
        Interest('Production Multimédia'),
        Interest('Ethique et Responsabilité en Production'),
        Interest('Projets Pratiques et Collaboratifs'),
      ]),
      Interest('Publicité et Marketing', [
        Interest('Fondamentaux de la Publicité'),
        Interest('Introduction au Marketing'),
        Interest('Publicité Numérique'),
        Interest('Marketing de Contenu'),
        Interest('Branding et Image de Marque'),
        Interest('Analyse et Mesure'),
        Interest('Éthique et Responsabilité Sociale'),
        Interest('Projets Pratiques et Études de Cas'),
      ]),
      Interest('Technologie de Communication', [
        Interest('Outils de Communication Numérique'),
        Interest('Technologies Mobiles'),
        Interest('Communication Visuelle'),
        Interest('Communication en Ligne'),
        Interest('Technologie Assistive pour la Communication'),
        Interest('Étiquette Numérique et Citoyenneté'),
        Interest('Technologie de Réunion et Collaboration'),
        Interest('Sécurité et Confidentialité en Ligne'),
      ]),
    ]),
    Interest('Cuisine et Gastronomie', [
      Interest('Techniques de Cuisine de Base', [
        Interest('Préparation et Planification'),
        Interest('Techniques de Cuisson de Base'),
        Interest('Préparation des Aliments'),
        Interest('Hygiène et Sécurité en Cuisine'),
        Interest('Cuisine Simple et Saine'),
        Interest('Bases de la Pâtisserie'),
        Interest('Cuisine du Monde'),
        Interest('Cuisine et Sciences'),
      ]),
      Interest('Cuisine Internationale', [
        Interest('Cuisine Asiatique'),
        Interest('Cuisine Européenne'),
        Interest('Cuisine Américaine'),
        Interest('Cuisine Africaine'),
        Interest('Cuisine du Moyen-Orient'),
        Interest('Cuisine Méditerranéenne'),
        Interest('Cuisine Indienne'),
        Interest('Exploration des Saveurs du Monde'),
      ]),
      Interest('Pâtisserie et Boulangerie', [
        Interest('Techniques de Base en Pâtisserie'),
        Interest('Confection de Gâteaux et Tartes'),
        Interest('Pâtisseries Internationales'),
        Interest('Pain et Viennoiserie'),
        Interest('Décoration et Finitions'),
        Interest('Pâtisserie Créative'),
        Interest('Boulangerie Artisanale'),
        Interest('Pâtisserie et Santé'),
      ]),
      Interest('Nutrition et Alimentation Saine', [
        Interest('Fondamentaux de la Nutrition'),
        Interest('Alimentation et Santé'),
        Interest('Diététique et Régimes Spécifiques'),
        Interest('Cuisine Saine et Créative'),
        Interest('Comprendre les Étiquettes Alimentaires'),
        Interest('Cuisine du Monde et Nutrition'),
        Interest('Ateliers de Cuisine Pratique'),
        Interest('Sensibilisation à l\'Alimentation Responsable'),
      ]),
      Interest('Arts de la Table et Présentation', [
        Interest('Techniques de Dressage de Table'),
        Interest('Présentation des Plats'),
        Interest('Cuisine et Art Visuel'),
        Interest('Fêtes et Célébrations'),
        Interest('Cours et Ateliers Pratiques'),
        Interest('Culture et Traditions'),
        Interest('Sensibilisation à la Nutrition'),
        Interest('Créativité et Innovation'),
      ]),
      Interest('Expérimentation et Créativité en Cuisine', [
        Interest('Innovation Culinaire'),
        Interest('Découverte de Saveurs'),
        Interest('Techniques de Cuisson Innovantes'),
        Interest('Présentation Artistique des Plats'),
        Interest('Cuisine Durable'),
        Interest('Projets de Groupe en Cuisine'),
        Interest('Cuisine Sensorielle'),
        Interest('Cuisine du Monde'),
      ]),
      Interest('Culture et Histoire Gastronomique', [
        Interest('Origines des Cuisines Régionales'),
        Interest('Évolution de la Gastronomie'),
        Interest('Cuisines du Monde'),
        Interest('Festivals et Gastronomie'),
        Interest('Cuisine et Société'),
        Interest('Personnalités Culinaires et Chefs'),
        Interest('Littérature et Médias Gastronomiques'),
        Interest('Alimentation et Changements Sociaux'),
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
