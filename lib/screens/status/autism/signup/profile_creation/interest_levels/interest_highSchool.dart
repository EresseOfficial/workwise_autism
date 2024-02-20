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
      Interest('Peinture et Techniques Mixtes', [
        Interest('Techniques de Peinture'),
        Interest('Styles et Mouvements Artistiques'),
        Interest('Composition et Créativité'),
        Interest('Techniques Mixtes et Expérimentation'),
        Interest('Peinture et Culture'),
        Interest('Projets de Peinture Personnels'),
        Interest('Histoire de l\'Art et Analyse'),
        Interest('Techniques Avancées et Professionnalisation'),
      ]),
      Interest('Dessin et Illustration', [
        Interest('Techniques de Base et Avancées'),
        Interest('Styles et Thèmes'),
        Interest('Illustration et Bande Dessinée'),
        Interest('Dessin Numérique et Technologique'),
        Interest('Perspective et Composition'),
        Interest('Dessin et Culture'),
        Interest('Projets Personnels et Portfolios'),
        Interest('Ateliers et Expositions'),
      ]),
      Interest('Sculpture et Modelage', [
        Interest('Techniques de Base et Matériaux'),
        Interest('Sculpture 3D et Modelage'),
        Interest('Sculpture Contemporaine et Thématique'),
        Interest('Sculpture Numérique et Technologique'),
        Interest('Historique et Culturel'),
        Interest('Ateliers et Expositions'),
        Interest('Projets Personnels et Portfolio'),
        Interest('Sculpture et Environnement'),
      ]),
      Interest('Photographie et Vidéographie', [
        Interest('Techniques Fondamentales'),
        Interest('Photographie Avancée'),
        Interest('Vidéographie et Production'),
        Interest('Photographie Numérique et Édition'),
        Interest('Vidéographie Créative'),
        Interest('Projets et Portfolios'),
        Interest('Culture Visuelle et Médias'),
        Interest('Photographie et Vidéographie Expérimentale'),
      ]),
      Interest('Arts Numériques et Multimédia', [
        Interest('Conception Graphique'),
        Interest('Animation Numérique'),
        Interest('Création Web et Médias Interactifs'),
        Interest('Arts Visuels Numériques'),
        Interest('Vidéographie et Production'),
        Interest('Projets Multimédias'),
        Interest('Technologie et Art'),
        Interest('Culture Numérique et Médias'),
      ]),
      Interest('Histoire de l\'Art et Critique', [
        Interest('Études d\'Époques et Mouvements Artistiques'),
        Interest('Analyse des Œuvres d\'Art'),
        Interest('Genres et Médiums Artistiques'),
        Interest('Critique d\'Art'),
        Interest('Histoire Culturelle et Contexte de l\'Art'),
        Interest('Artistes et Biographies'),
        Interest('Thèmes et Symboles dans l\'Art'),
        Interest('Visites et Expériences Artistiques'),
      ]),
      Interest('Projets Artistiques et Expositions', [
        Interest('Planification et Développement de Projets'),
        Interest('Collaboration Artistique'),
        Interest('Techniques et Médiums Expérimentaux'),
        Interest('Critique et Réflexion sur l\'Art'),
        Interest('Engagement et Interaction avec le Public'),
        Interest('Documentation et Archivage'),
        Interest('Réception et Feedback'),
      ]),
    ]),
    Interest('Musique et Performance', [
      Interest('Pratique Instrumentale', [
        Interest('Initiation aux Instruments'),
        Interest('Techniques de Base'),
        Interest('Interprétation et Expression'),
        Interest('Pratique Avancée'),
        Interest('Musique d\'Ensemble'),
        Interest('Improvisation et Création'),
        Interest('Maintenance et Soin de l\'Instrument'),
        Interest('Performance et Présentation'),
      ]),
      Interest('Chant et Techniques Vocales', [
        Interest('Fondamentaux du Chant'),
        Interest('Développement de la Voix'),
        Interest('Interprétation et Performance'),
        Interest('Genres et Styles Vocaux'),
        Interest('Santé et Entretien de la Voix'),
        Interest('Techniques Avancées de Chant'),
        Interest('Composition et Écriture de Chansons'),
        Interest('Projets et Performances Vocales'),
      ]),
      Interest('Composition et Théorie Musicale', [
        Interest('Fondements de la Théorie Musicale'),
        Interest('Composition Musicale'),
        Interest('Analyse Musicale'),
        Interest('Orchestration et Arrangement'),
        Interest('Théorie de la Musique Assistée par Ordinateur (MAO)'),
        Interest('Créativité et Innovation en Musique'),
        Interest('Performance et Présentation'),
      ]),
      Interest('Musique Assistée par Ordinateur', [
        Interest('Introduction aux Logiciels de Musique'),
        Interest('Composition Numérique'),
        Interest('Enregistrement et Édition Audio'),
        Interest('Production Musicale Avancée'),
        Interest('Collaboration en Ligne et Partage'),
        Interest('Programmation et Conception Sonore'),
        Interest('Analyse et Réflexion sur la Musique Numérique'),
      ]),
      Interest('Histoire et Culture Musicale', [
        Interest('Évolution de la Musique à travers les Âges'),
        Interest('Périodes Musicales Clés'),
        Interest('Musiques du Monde et Influences Culturelles'),
        Interest('Grandes Figures Musicales'),
        Interest('Analyse d\'Œuvres Musicales'),
        Interest('Impact Social et Culturel de la Musique'),
        Interest('Instruments et Innovations Musicales'),
        Interest('Genres et Styles Musicaux'),
        Interest('Visites Culturelles et Musicales'),
      ]),
      Interest('Arts de la Scène et Interprétation', [
        Interest('Théâtre et Dramaturgie'),
        Interest('Danse et Mouvement'),
        Interest('Musique et Performance Musicale'),
        Interest('Cirque et Arts du Spectacle'),
        Interest('Comédie et Improvisation'),
        Interest('Production et Gestion de Spectacles'),
        Interest('Analyse et Critique de Performances'),
        Interest('Ateliers et Masterclasses'),
        Interest('Participation à des Festivals et Concours'),
      ]),
      Interest('Projets Musicaux et Événements', [
        Interest('Conception et Développement de Projets Musicaux'),
        Interest('Collaboration et Performance de Groupe'),
        Interest('Composition et Création Musicale'),
        Interest('Technologie Musicale et Production'),
        Interest('Masterclasses et Ateliers'),
        Interest('Participation à des Festivals et Concours'),
        Interest('Évaluation et Feedback'),
        Interest('Engagement Communautaire et Éducatif'),
      ]),
    ]),
    Interest('Nature et Animaux', [
      Interest('Biologie et Écologie', [
        Interest('Fondamentaux de la Biologie'),
        Interest('Diversité du Vivant'),
        Interest('Écologie et Environnements'),
        Interest('Conservation et Durabilité'),
        Interest('Études de Terrain et Expériences'),
        Interest('Biotechnologie et Éthique'),
        Interest('Microbiologie et Virologie'),
        Interest('Évolution et Adaptation'),
      ]),
      Interest('Sciences de l\'Environnement', [
        Interest('Écologie et Biodiversité'),
        Interest('Changement Climatique et Impact Humain'),
        Interest('Gestion des Ressources Naturelles'),
        Interest('Pollution et Solutions Écologiques'),
        Interest('Éducation Environnementale et Sensibilisation'),
        Interest('Recherche et Projets Scientifiques'),
        Interest('Études de Cas et Exemples du Monde Réel'),
      ]),
      Interest('Étude et Soins des Animaux', [
        Interest('Comportement et Bien-être Animal'),
        Interest('Anatomie et Physiologie Animales'),
        Interest('Écologie et Conservation'),
        Interest('Observation et Étude sur le Terrain'),
        Interest('Soins des Animaux Domestiques et de Ferme'),
        Interest('Réhabilitation et Sauvetage des Animaux'),
        Interest('Éthique et Droits des Animaux'),
        Interest('Carrières et Métiers liés aux Animaux'),
      ]),
      Interest('Activités de Plein Air et Exploration', [
        Interest('Randonnée et Trekking'),
        Interest('Camping et Survie'),
        Interest('Observation de la Nature'),
        Interest('Photographie de Nature'),
        Interest('Kayak, Canoë et Sports Nautiques'),
        Interest('Vélo et VTT'),
        Interest('Escalade et Alpinisme'),
        Interest('Projets de Conservation et Volontariat'),
      ]),
      Interest('Horticulture et Jardinage', [
        Interest('Fondamentaux du Jardinage'),
        Interest('Jardinage Écologique et Durable'),
        Interest('Culture des Fruits et Légumes'),
        Interest('Plantes Ornementales et Paysagisme'),
        Interest('Soins des Plantes et Entretien'),
        Interest('Hydroponie et Culture Sans Sol'),
        Interest('Projets de Jardinage Communautaire et Scolaire'),
        Interest('Botanique et Étude des Plantes'),
      ]),
      Interest('Photographie et Documentaire sur la Nature', [
        Interest('Techniques de Photographie de la Nature'),
        Interest('Vidéographie Environnementale'),
        Interest('Observation et Documentation de la Faune'),
        Interest('Photographie Macro et Micro'),
        Interest('Traitement et Édition d\'Images'),
        Interest('Projets de Documentaire sur la Nature'),
        Interest('Expositions Photographiques et Diffusion'),
        Interest('Conservation et Photographie'),
      ]),
      Interest('Sciences Géographiques et Géologiques', [
        Interest('Étude des Formations Terrestres'),
        Interest('Cartographie et Utilisation de GPS'),
        Interest('Géologie et Minéralogie'),
        Interest('Phénomènes Géologiques'),
        Interest('Hydrographie et Océanographie'),
        Interest('Climatologie et Météorologie'),
        Interest('Impact Humain sur la Terre'),
        Interest('Projets de Terrain et Expéditions'),
        Interest('Utilisation de Technologies dans les Études Géologiques'),
      ]),
    ]),
    Interest('Sciences et Exploration', [
      Interest('Sciences Physiques et Naturelles', [
        Interest('Concepts Fondamentaux de la Physique'),
        Interest('Chimie et Expérimentation'),
        Interest('Astronomie et Observation des Étoiles'),
        Interest('Sciences de la Terre et Géologie'),
        Interest('Physique de l\'Environnement et Écologie'),
        Interest('Technologie et Applications Scientifiques'),
        Interest('Histoire et Philosophie des Sciences'),
        Interest('Méthodologie de la Recherche Scientifique'),
      ]),
      Interest('Sciences de la Terre et Géologie', [
        Interest('Introduction à la Géologie'),
        Interest('Minéralogie et Pétrologie'),
        Interest('Géologie Historique et Paléontologie'),
        Interest('Géomorphologie et Formations Naturelles'),
        Interest('Hydrogéologie et Ressources en Eau'),
        Interest('Géologie Environnementale'),
        Interest('Tectonique des Plaques et Séismologie'),
        Interest('Ressources Minérales et Exploitation'),
        Interest('Projets de Terrain en Géologie'),
      ]),
      Interest('Astronomie et Astrophysique', [
        Interest('Introduction à l\'Astronomie'),
        Interest('Système Solaire et Planétologie'),
        Interest('Cosmologie et Univers'),
        Interest('Astrophysique'),
        Interest('Observation du Ciel et Pratique'),
        Interest('Astrophotographie'),
        Interest('Vie Extraterrestre et Exoplanètes'),
        Interest('Histoire de l\'Astronomie et Contributions Clés'),
        Interest('Projets et Expériences en Astronomie'),
      ]),
      Interest('Technologies et Innovations', [
        Interest('Découverte des Nouvelles Technologies'),
        Interest('Programmation et Développement de Logiciels'),
        Interest('Conception et Impression 3D'),
        Interest('Électronique et Robotique'),
        Interest('Réalité Virtuelle (RV) et Réalité Augmentée (RA)'),
        Interest('Technologies Durables et Énergies Renouvelables'),
        Interest('Cybersécurité et Protection des Données'),
        Interest('Initiatives Technologiques et Entrepreneuriales'),
        Interest('Visites et Rencontres avec des Professionnels'),
      ]),
      Interest('Mathématiques Appliquées', [
        Interest('Algèbre Avancée et Géométrie'),
        Interest('Statistiques et Probabilités'),
        Interest('Calcul Différentiel et Intégral'),
        Interest('Mathématiques Financières'),
        Interest('Modélisation Mathématique'),
        Interest('Cryptographie et Sécurité des Données'),
        Interest('Mathématiques Computationnelles'),
        Interest('Optimisation et Recherche Opérationnelle'),
        Interest('Projets et Compétitions Mathématiques'),
      ]),
      Interest('Recherche Scientifique et Projets', [
        Interest('Initiation à la Méthode Scientifique'),
        Interest('Projets Expérimentaux en Sciences'),
        Interest('Techniques de Recherche Avancées'),
        Interest('Participation à des Concours et Foires Scientifiques'),
        Interest('Collaborations avec des Institutions Scientifiques'),
        Interest('Développement de Projets Innovants'),
        Interest('Science et Société'),
      ]),
      Interest('Exploration et Expéditions', [
        Interest('Exploration Géographique'),
        Interest('Expéditions Scientifiques'),
        Interest('Aventure et Survie'),
        Interest('Voyages Éducatifs'),
        Interest('Citoyenneté Globale et Environnementale'),
        Interest('Documentation et Partage'),
      ]),
    ]),
    Interest('Activités Physiques et Sportives', [
      Interest('Sports Individuels', [
        /*
5.1.1	Athlétisme
5.1.2	Natation
5.1.3	Arts Martiaux
5.1.4	Escalade
5.1.5	Cyclisme
5.1.6	Golf
5.1.7	Ski et Snowboard
5.1.8	Tir à l'arc
         */
        Interest('Athlétisme'),
        Interest('Natation'),
        Interest('Arts Martiaux'),
        Interest('Escalade'),
        Interest('Cyclisme'),
        Interest('Golf'),
        Interest('Ski et Snowboard'),
        Interest('Tir à l\'arc'),
      ]),
      Interest('Sports d\'Équipe', [
        Interest('Football et Soccer'),
        Interest('Basketball'),
        Interest('Volleyball'),
        Interest('Rugby'),
        Interest('Ultimate Frisbee'),
        Interest('Hockey sur Gazon et sur Glace'),
        Interest('Baseball et Softball'),
        Interest('Relais et Courses d\'Équipe'),
      ]),
      Interest('Arts Martiaux et Autodéfense', [
        Interest('Karate'),
        Interest('Judo'),
        Interest('Taekwondo'),
        Interest('Aïkido'),
        Interest('Boxe et Kickboxing'),
        Interest('Krav Maga et Autodéfense'),
        Interest('Qi Gong et Tai Chi'),
        Interest('Arts Martiaux Mixtes (MMA)'),
      ]),
      Interest('Fitness et Entraînement Physique', [
        Interest('Entraînement Cardiovasculaire'),
        Interest('Musculation et Conditionnement Physique'),
        Interest('Yoga et Pilates'),
        Interest('Entraînement Fonctionnel'),
        Interest('Aérobic et Fitness en Groupe'),
        Interest('Stretching et Flexibilité'),
        Interest('Nutrition et Hygiène de Vie'),
        Interest('Planification d\'Entraînement Personnalisé'),
      ]),
      Interest('Activités de Plein Air et Aventure', [
        Interest('Randonnée et Exploration'),
        Interest('Camping et Survie en Plein Air'),
        Interest('Cyclisme et VTT'),
        Interest('Sports Nautiques et Canoë-kayak'),
        Interest('Escalade et Alpinisme'),
        Interest('Orientation et Géocaching'),
        Interest('Tir à l\'Arc et Sports de Précision'),
        Interest('Aventures et Challenges de Groupe'),
      ]),
      Interest('Danse et Expression Corporelle', [
        Interest('Initiation aux Différents Styles de Danse'),
        Interest('Ateliers de Mouvement Créatif'),
        Interest('Techniques de Relaxation et de Bien-être'),
        Interest('Performances et Présentations de Groupe'),
        Interest('Histoire et Culture de la Danse'),
        Interest('Expression Corporelle et Théâtre Physique'),
        Interest('Analyse et Critique de Danse'),
        Interest('Projets de Danse Inclusifs et Accessibles'),
      ]),
      Interest('Activités Physiques Adaptées', [
        Interest('Programmes de Fitness Personnalisés'),
        Interest('Yoga et Relaxation'),
        Interest('Activités Aquatiques Adaptées'),
        Interest('Sports Adaptés'),
        Interest('Thérapie par le Mouvement et Danse'),
        Interest('Parcours de Motricité et Obstacles Adaptés'),
        Interest('Jeux et Activités de Groupe Adaptés'),
        Interest(
            'Équitation Thérapeutique et Autres Thérapies Assistées par les Animaux'),
      ]),
    ]),
    Interest('Jeux, Puzzles et Réflexion', [
      Interest('Jeux de Société et de Stratégie', [
        Interest('Jeux Classiques de Stratégie'),
        Interest('Jeux de Société Modernes'),
        Interest('Jeux de Rôle et de Simulation'),
        Interest('Jeux de Cartes Stratégiques'),
        Interest('Jeux de Construction et de Gestion'),
        Interest('Jeux de Stratégie Coopératifs'),
        Interest('Tournois et Compétitions de Jeux'),
        Interest('Analyse et Création de Jeux'),
      ]),
      Interest('Puzzles et Casse-têtes', [
        Interest('Puzzles Traditionnels'),
        Interest('Casse-têtes Logiques'),
        Interest('Puzzles 3D et Modèles à Construire'),
        Interest('Jeux de Réflexion Numériques'),
        Interest('Casse-têtes Physiques et Manipulatifs'),
        Interest('Stratégies de Résolution de Puzzles'),
        Interest('Compétitions et Clubs de Puzzles'),
      ]),
      Interest('Jeux de Cartes et de Plateau', [
        Interest('Stratégie et Tactique'),
        Interest('Développement Social et Communication'),
        Interest('Résolution de Problèmes et Logique'),
        Interest('Apprentissage et Éducation'),
        Interest('Créativité et Innovation'),
        Interest('Histoire et Culture des Jeux'),
        Interest('Jeux et Technologie'),
      ]),
      Interest('Jeux Vidéo et Informatiques', [
        Interest('Développement de Jeux Vidéo'),
        Interest('Gameplay et Stratégie'),
        Interest('Culture et Histoire du Jeu Vidéo'),
        Interest('Intelligence Artificielle dans les Jeux'),
        Interest('Sécurité en Ligne et Éthique'),
        Interest('Réalité Virtuelle et Augmentée'),
        Interest('Modding et Personnalisation'),
        Interest('Jeux et Apprentissage'),
      ]),
      Interest('Activités de Réflexion et de Logique', [
        Interest('Jeux de Logique et Enigmes'),
        Interest('Jeux de Stratégie'),
        Interest('Puzzles Avancés'),
        Interest('Activités de Codage et de Programmation'),
        Interest('Jeux de Simulation et de Rôle'),
        Interest('Ateliers de Pensée Critique'),
        Interest('Développement de Projets Logiques'),
      ]),
      Interest('Rôles et Jeux Narratifs', [
        Interest('Jeux de Rôle sur Table'),
        Interest('Narration Interactive et Aventure Textuelle'),
        Interest('Ateliers d\'Écriture Créative'),
        Interest('Improvisation et Performance'),
        Interest('Jeux de Rôle Numériques'),
        Interest('Analyse de la Narration dans les Jeux'),
      ]),
      Interest('Activités Créatives avec Puzzles et Jeux', [
        Interest('Conception et Création de Puzzles'),
        Interest('Jeux de Logique et de Stratégie'),
        Interest('Activités Collaboratives Basées sur les Jeux'),
        Interest('Intégration des Puzzles dans l\'Art et la Créativité'),
        Interest('Technologie, Puzzles et Jeux'),
        Interest('Puzzles et Mathématiques'),
      ]),
    ]),
    Interest('Loisirs et Collections', [
      Interest('Collections Thématiques', [
        Interest('Monnaies et Billets de Banque'),
        Interest('Timbres et Philatélie'),
        Interest('Collections Naturelles'),
        Interest('Objets de Culture Pop et Souvenirs'),
        Interest('Jeux Vidéo et Merchandising'),
        Interest('Collections Littéraires'),
        Interest('Artisanat et Objets d\'Art'),
      ]),
      Interest('Modélisme et Maquettisme', [
        Interest('Construction de Modèles Réduits'),
        Interest('Modélisme Ferroviaire'),
        Interest('Maquettisme Architectural'),
        Interest('Modèles de Navires et d\'Embarcations'),
        Interest('Dioramas et Scènes Miniatures'),
        Interest('Figurines et Personnages'),
        Interest('Aéromodélisme et Drones'),
        Interest('Projets et Compétitions de Modélisme'),
      ]),
      Interest('Activités Artistiques et Artisanales', [
        Interest('Peinture et Dessin'),
        Interest('Sculpture et Modelage'),
        Interest('Artisanat et Travaux Manuels'),
        Interest('Photographie et Arts Visuels'),
        Interest('Arts Numériques et Graphisme'),
        Interest('Projets Collaboratifs en Art'),
        Interest('Expositions Artistiques et Portfolios'),
        Interest('Artisanat Traditionnel et Culturel'),
      ]),
      Interest('Technologies et Électronique', [
        Interest('Initiation à l\'Électronique'),
        Interest('Robotique et Programmation'),
        Interest('Conception et Modélisation 3D'),
        Interest('Technologies Wearables et IoT (Internet des Objets)'),
        Interest('Réparation et Maintenance de Gadgets'),
        Interest('Audiovisuel et Production Multimédia'),
        Interest('Sécurité Informatique et Cybersécurité'),
        Interest('Exploration des Nouvelles Technologies'),
      ]),
      Interest('Nature et Jardinage', [
        Interest('Fondamentaux du Jardinage'),
        Interest('Botanique et Étude des Plantes'),
        Interest('Jardinage Écologique'),
        Interest('Horticulture et Culture des Fruits et Légumes'),
        Interest('Jardinage Ornemental et Paysagisme'),
        Interest('Plantes Médicinales et Aromathérapie'),
        Interest('Conservation de la Nature et Éducation Environnementale'),
        Interest('Photographie de Nature et Observation des Oiseaux'),
      ]),
      Interest('Musique et Collection de Médias', [
        Interest('Découverte Musicale'),
        Interest('Collecte et Organisation de Musique'),
        Interest('Critique et Analyse Musicales'),
        Interest('Projets Musicaux Collaboratifs'),
        Interest('Événements et Concerts'),
        Interest('Technologie et Médias Numériques'),
        Interest('Histoire de la Musique et des Médias'),
      ]),
      Interest('Exploration Urbaine et Voyages', [
        Interest('Découverte de Nouvelles Villes'),
        Interest('Voyages Culturels'),
        Interest('Randonnées Urbaines et Parcours Pédestres'),
        Interest('Photographie de Voyage'),
        Interest('Planification et Budget de Voyage'),
        Interest('Sécurité et Bien-être en Voyage'),
        Interest('Échange Culturel et Langues'),
      ]),
    ]),
    Interest('Littérature et Langues', [
      Interest('Études Littéraires', [
        Interest('Analyse Textuelle et Critique Littéraire'),
        Interest('Genres Littéraires et Mouvements'),
        Interest('Littérature Comparée'),
        Interest('Histoire de la Littérature'),
        Interest('Littérature et Société'),
        Interest('Écriture Créative'),
        Interest('Auteurs et Études d\'Auteurs'),
        Interest('Littérature et Autres Arts'),
        Interest('Projets Littéraires Collaboratifs'),
      ]),
      Interest('Langues Étrangères', [
        Interest('Apprentissage Intensif de la Langue'),
        Interest('Culture et Civilisation'),
        Interest('Échange Linguistique et Correspondance'),
        Interest('Voyages et Immersions Culturelles'),
        Interest('Littérature et Médias dans la Langue Originale'),
        Interest('Pratique de la Conversation et de la Prononciation'),
        Interest('Grammaire Avancée et Écriture'),
        Interest('Préparation aux Certifications Linguistiques'),
      ]),
      Interest('Écriture Créative', [
        Interest('Ateliers d\'Écriture'),
        Interest('Genres Littéraires'),
        Interest('Narration et Développement de Personnages'),
        Interest('Écriture Poétique'),
        Interest('Journal Intime et Écriture Réflexive'),
        Interest('Scénarisation et Écriture pour le Média'),
        Interest('Publication et Partage'),
        Interest('Critique et Atelier d\'Écriture Collaboratif'),
      ]),
      Interest('Théâtre et Dramaturgie', [
        Interest('Initiation au Théâtre'),
        Interest('Écriture et Analyse Dramatique'),
        Interest('Mise en Scène et Direction'),
        Interest('Performance et Interprétation'),
        Interest('Conception Scénique et Costumes'),
        Interest('Théâtre et Technologie'),
        Interest('Projets de Théâtre Scolaire'),
        Interest('Théâtre et Société'),
      ]),
      Interest('Poésie et Expression Poétique', [
        Interest('Introduction à la Poésie'),
        Interest('Écriture Poétique'),
        Interest('Analyse et Critique de Poésie'),
        Interest('Poésie et Multimédia'),
        Interest('Projets Poétiques Collaboratifs'),
        Interest('Poésie et Expressions Culturelles'),
        Interest('Ateliers d\'Expression Personnelle'),
      ]),
      Interest('Langue et Communication', [
        Interest('Grammaire Avancée et Syntaxe'),
        Interest('Vocabulaire et Expression'),
        Interest('Compréhension et Analyse Textuelle'),
        Interest('Compétences en Écriture'),
        Interest('Pratique de l\'Oral et Présentations'),
        Interest('Écoute Active et Compréhension Orale'),
        Interest('Communication Non-Verbale'),
        Interest('Technologies de Communication'),
      ]),
      Interest('Projets et Événements Littéraires', [
        /*
8.7.1	Ateliers d'Écriture Créative
8.7.2	Clubs de Lecture et Discussions
8.7.3	Organisation de Concours Littéraires
8.7.4	Participation à des Salons du Livre et Festivals Littéraires
8.7.5	Création et Publication de Zines ou Magazines Littéraires
8.7.6	Soirées Poétiques et Lectures Publiques
8.7.7	Projets de Théâtre et Dramatisation de Textes
8.7.8	Rencontres avec des Auteurs et Ateliers d'Auteur
         */
        Interest('Ateliers d\'Écriture Créative'),
        Interest('Clubs de Lecture et Discussions'),
        Interest('Organisation de Concours Littéraires'),
        Interest(
            'Participation à des Salons du Livre et Festivals Littéraires'),
        Interest('Création et Publication de Zines ou Magazines Littéraires'),
        Interest('Soirées Poétiques et Lectures Publiques'),
        Interest('Projets de Théâtre et Dramatisation de Textes'),
        Interest('Rencontres avec des Auteurs et Ateliers d\'Auteur'),
      ]),
    ]),
    Interest('Développement Personnel et Socialisation', [
      Interest('Compétences Sociales et Communication', [
        Interest('Ateliers de Communication Verbale'),
        Interest('Développement des Compétences Non Verbales'),
        Interest('Gestion des Émotions et Empathie'),
        Interest('Résolution de Conflits et Négociation'),
        Interest('Compétences d\'Écoute Active'),
        Interest('Développement des Relations et Réseautage'),
        Interest('Présentation et Expression Publique'),
        Interest('Utilisation des Technologies de Communication'),
      ]),
      Interest('Gestion des Émotions et Résilience', [
        Interest('Identification et Expression des Émotions'),
        Interest('Techniques de Régulation Émotionnelle'),
        Interest('Développement de la Résilience'),
        Interest('Gestion du Stress et Techniques de Relaxation'),
        Interest('Empathie et Compréhension des Autres'),
        Interest('Renforcement de l\'Estime de Soi'),
        Interest('Stratégies d\'Adaptation Positive'),
        Interest('Soutien Social et Réseaux de Soutien'),
      ]),
      Interest('Développement de l\'Identité et de l\'Estime de Soi', [
        Interest('Exploration de Soi'),
        Interest('Renforcement de l\'Estime de Soi'),
        Interest('Gestion de l\'Image Corporelle'),
        Interest('Affirmation de Soi et Communication'),
        Interest('Développement des Relations Sociales'),
        Interest('Navigation dans la Diversité et l\'Inclusion'),
        Interest('Planification de l\'Avenir et Fixation d\'Objectifs'),
        Interest('Leadership et Participation Communautaire'),
      ]),
      Interest('Compétences de Vie et Autonomie', [
        Interest('Gestion Financière'),
        Interest('Compétences Domestiques'),
        Interest('Santé et Bien-être'),
        Interest('Compétences Sociales Avancées'),
        Interest('Planification et Organisation'),
        Interest('Navigation dans le Monde Numérique'),
        Interest('Préparation à l\'Emploi et à la Carrière'),
        Interest('Droits et Responsabilités Civiques'),
      ]),
      Interest('Relations et Interaction Sociale', [
        Interest('Communication Verbale et Non-Verbale'),
        Interest('Écoute Active et Empathie'),
        Interest('Gestion des Conflits et Résolution de Problèmes'),
        Interest('Développement de l\'Amitié et des Relations'),
        Interest('Reconnaissance et Gestion des Émotions dans les Relations'),
        Interest('Compétences en Réseautage et Socialisation'),
        Interest('Respect des Différences et Diversité'),
        Interest('Sécurité et Limites dans les Relations'),
      ]),
      Interest('Mindfulness et Bien-être', [
        Interest('Pratiques de Mindfulness'),
        Interest('Gestion du Stress et de l\'Anxiété'),
        Interest('Yoga et Mouvement Conscient'),
        Interest('Journal Intime et Réflexion Personnelle'),
        Interest('Alimentation Consciente et Bien-être Nutritionnel'),
        Interest('Nature et Bien-être'),
        Interest('Arts et Créativité pour le Bien-être'),
        Interest('Connexion Sociale et Soutien'),
      ]),
      Interest('Projets de Développement Personnel', [
        Interest('Fixation d\'Objectifs et Planification'),
        Interest('Compétences en Gestion Financière'),
        Interest('Santé et Fitness Personnels'),
        Interest('Développement des Compétences Sociales'),
        Interest('Mindfulness et Techniques de Relaxation'),
        Interest('Projets de Volontariat et de Service Communautaire'),
        Interest(
            'Développement de la Créativité et de l\'Expression Personnelle'),
        Interest('Apprentissage et Exploration de Nouvelles Compétences'),
      ]),
    ]),
    Interest('Médias et Communication Numérique', [
      Interest('Littératie Numérique et Médias', [
        Interest('Compréhension des Médias Sociaux'),
        Interest('Critique des Médias'),
        Interest('Création de Contenu Numérique'),
        Interest('Sécurité et Éthique en Ligne'),
        Interest('Compétences en Recherche sur Internet'),
        Interest('Utilisation Responsable des Technologies'),
        Interest('Programmation et Développement Web'),
      ]),
      Interest('Production et Création de Contenus', [
        Interest('Vidéographie et Montage Vidéo'),
        Interest('Conception Graphique et Infographie'),
        Interest('Production Audio et Podcasting'),
        Interest('Écriture et Blogging'),
        Interest('Animation et Contenus Interactifs'),
        Interest('Stratégies de Publication et de Diffusion'),
        Interest('Droits d\'Auteur et Propriété Intellectuelle'),
        Interest('Critique et Analyse des Médias'),
      ]),
      Interest('Communication et Réseaux Sociaux', [
        Interest('Principes de Base de la Communication Numérique'),
        Interest('Sécurité et Confidentialité sur les Réseaux Sociaux'),
        Interest('Création de Contenu pour les Réseaux Sociaux'),
        Interest('Gestion des Interactions et du Feedback en Ligne'),
        Interest('Analyse des Tendances des Réseaux Sociaux'),
        Interest('Marketing Personnel et Branding en Ligne'),
        Interest('Éthique et Responsabilité sur les Réseaux Sociaux'),
      ]),
      Interest('Journalisme Numérique et Blogging', [
        Interest('Initiation au Journalisme Numérique'),
        Interest('Création et Gestion d\'un Blog'),
        Interest('Écriture et Style Éditorial'),
        Interest('Multimédia et Contenu Visuel'),
        Interest('Réseaux Sociaux et Diffusion'),
        Interest('Analyse d\'Audience et Feedback'),
        Interest('Projet de Blogging Collaboratif'),
      ]),
      Interest('Technologies de l\'Information et Informatique', [
        Interest('Programmation et Codage'),
        Interest('Sécurité Informatique et Cybersécurité'),
        Interest('Réseaux et Administration Système'),
        Interest('Développement de Logiciels et Applications'),
        Interest('Intelligence Artificielle et Machine Learning'),
        Interest('Robotique et Automatisation'),
        Interest('Traitement de Données et Analytique'),
        Interest('Projets Collaboratifs en TI'),
      ]),
      Interest('Photographie et Vidéographie Numérique', [
        Interest('Principes de Base de la Photographie'),
        Interest('Techniques Avancées de Photographie'),
        Interest('Introduction à la Vidéographie'),
        Interest('Montage et Post-Production'),
        Interest('Photographie Artistique et Créative'),
        Interest('Réalisation de Documentaires et Projets Vidéo'),
        Interest('Critique et Analyse de Photographie et Vidéo'),
        Interest('Exposition et Partage de Travaux'),
      ]),
      Interest('Projets et Ateliers Médias Numériques', [
        Interest('Création de Contenu Web'),
        Interest('Conception Graphique et Visuelle'),
        Interest('Production Vidéo et Édition'),
        Interest('Animation Numérique et Création de Jeux'),
        Interest('Développement Web et Design'),
        Interest('Ateliers de Photographie Numérique'),
        Interest('Podcasting et Production Audio'),
        Interest('Médias Sociaux et Communication Numérique'),
      ]),
    ]),
    Interest('Économie et Entrepreneuriat', [
      Interest('Principes de Base de l\'Économie', [
        Interest('Introduction à l\'Économie'),
        Interest('Microéconomie'),
        Interest('Macroéconomie'),
        Interest('Systèmes Financiers et Bancaires'),
        Interest('Commerce International'),
        Interest('Économie du Développement'),
        Interest('Économie Environnementale'),
        Interest('Entrepreneuriat et Innovation'),
      ]),
      Interest('Entrepreneuriat et Gestion d\'Entreprise', [
        Interest('Fondations de l\'Entrepreneuriat'),
        Interest('Planification d\'Affaires'),
        Interest('Gestion Financière pour les Startups'),
        Interest('Marketing et Stratégies de Marque'),
        Interest('Opérations et Gestion de la Chaîne d\'Approvisionnement'),
        Interest('Leadership et Gestion d\'Équipe'),
        Interest('Innovation et Développement de Produits'),
        Interest('Responsabilité Sociale de l\'Entreprise'),
      ]),
      Interest('Marketing et Communication Commerciale', [
        Interest('Principes de Base du Marketing'),
        Interest('Stratégies de Communication'),
        Interest('Marketing Numérique et Réseaux Sociaux'),
        Interest('Publicité et Promotion'),
        Interest('Analyse de Marché et Recherche'),
        Interest('Gestion de la Marque et Identité Visuelle'),
        Interest('Relations Publiques et Gestion de la Réputation'),
        Interest('Marketing Éthique et Responsable'),
      ]),
      Interest('Finance et Comptabilité', [
        Interest('Principes Fondamentaux de la Comptabilité'),
        Interest('Gestion Budgétaire et Planification Financière'),
        Interest('Analyse Financière et Reporting'),
        Interest('Principes de l\'Investissement'),
        Interest('Finance Personnelle et Gestion de Patrimoine'),
        Interest('Comptabilité dans le Secteur Non Lucratif'),
        Interest('Éthique en Finance et Comptabilité'),
        Interest('Projets Pratiques en Finance et Comptabilité'),
      ]),
      Interest('Économie Sociale et Développement Durable', [
        Interest('Principes de l\'Économie Sociale'),
        Interest('Sustainability and Environmental Economics'),
        Interest('Entrepreneuriat Social'),
        Interest('Finance Éthique et Investissement Socialement Responsable'),
        Interest('Gestion des Projets de Développement Durable'),
        Interest('Économie Circulaire et Gestion des Déchets'),
        Interest('Politiques Publiques et Développement Durable'),
        Interest('Engagement Communautaire et Volontariat'),
      ]),
      Interest('Projets d\'Entreprise et Simulations', [
        Interest('Conception et Planification d\'Entreprise'),
        Interest('Simulations d\'Entreprise'),
        Interest('Marketing et Stratégies de Vente'),
        Interest('Gestion Financière et Budgétisation'),
        Interest('Gestion des Opérations et de la Chaîne d\'Approvisionnement'),
        Interest('Ressources Humaines et Leadership'),
        Interest('Innovation et Développement de Produit'),
        Interest('Projets d\'Entrepreneuriat Social'),
      ]),
      Interest('Études de Cas et Recherche en Économie', [
        Interest('Analyse de Marché et Tendances Économiques'),
        Interest('Études de Cas sur des Entreprises Réelles'),
        Interest('Principes de Microéconomie et Macroéconomie'),
        Interest('Recherche et Méthodologie Économique'),
        Interest('Économie Globale et Commerce International'),
        Interest('Économie du Développement et Émergence'),
        Interest('Innovation Économique et Start-ups'),
        Interest('Soutenabilité et Économie Verte'),
      ]),
    ]),
    Interest('Sciences Humaines et Études Culturelles', [
      Interest('Histoire et Civilisations', [
        Interest('Civilisations Antiques'),
        Interest('Périodes Médiévales et Renaissance'),
        Interest('Révolutions et Changements Sociaux'),
        Interest('Histoire Moderne et Contemporaine'),
        Interest('Civilisations Non Occidentales'),
        Interest('Archéologie et Découvertes'),
        Interest('Thèmes Spécifiques en Histoire'),
        Interest('Projets de Recherche Historique'),
      ]),
      Interest('Sociologie et Sciences Sociales', [
        Interest('Théories Sociologiques Fondamentales'),
        Interest('Comportement et Interaction Sociale'),
        Interest('Institutions Sociales et Organisation'),
        Interest('Diversité Culturelle et Sociale'),
        Interest('Changement Social et Innovation'),
        Interest('Problèmes Sociaux et Politiques Publiques'),
        Interest('Méthodes de Recherche en Sciences Sociales'),
        Interest('Éthique et Responsabilité Sociale'),
      ]),
      Interest('Anthropologie et Études Culturelles', [
        Interest('Fondements de l\'Anthropologie'),
        Interest('Cultures du Monde'),
        Interest('Identité et Diversité Culturelle'),
        Interest('Rituels, Mythes et Symboles'),
        Interest('Changement Culturel et Globalisation'),
        Interest('Anthropologie de l\'Alimentation'),
        Interest('Langue et Communication dans les Cultures'),
        Interest('Pratiques Artistiques et Culturelles'),
        Interest('Projets de Recherche en Anthropologie'),
      ]),
      Interest('Psychologie et Comportement Humain', [
        Interest('Introduction à la Psychologie'),
        Interest('Développement Humain'),
        Interest('Perception et Cognition'),
        Interest('Émotions et Intelligence Émotionnelle'),
        Interest('Comportement Social et Communication'),
        Interest('Psychologie Anormale'),
        Interest('Thérapies et Interventions Psychologiques'),
        Interest('Psychologie Expérimentale et Recherche'),
        Interest('Bien-être Mental et Self-Care'),
      ]),
      Interest('Philosophie et Pensée Critique', [
        Interest('Introduction à la Philosophie'),
        Interest('Logique et Raisonnement'),
        Interest('Éthique et Morale'),
        Interest('Philosophie Politique et Sociale'),
        Interest('Esthétique et Philosophie de l\'Art'),
        Interest('Philosophie de l\'Esprit et de la Conscience'),
        Interest('Métaphysique et Ontologie'),
        Interest('Épistémologie et Théorie de la Connaissance'),
        Interest('Pensée Critique et Analyse'),
      ]),
      Interest('Études des Médias et de la Communication', [
        Interest('Théorie des Médias'),
        Interest('Littératie des Médias'),
        Interest('Communication Interpersonnelle'),
        Interest('Production Média'),
        Interest('Analyse du Contenu des Médias'),
        Interest('Réseaux Sociaux et Communication Numérique'),
        Interest('Éthique des Médias'),
        Interest('Histoire des Médias'),
        Interest('Publicité et Marketing des Médias'),
      ]),
      Interest('Projets de Recherche et Études', [
        Interest('Méthodologie de la Recherche'),
        Interest('Projets Interdisciplinaires'),
        Interest('Études Indépendantes'),
        Interest('Participation à des Conférences et des Séminaires'),
        Interest('Publication et Diffusion'),
        Interest('Collaboration avec des Institutions de Recherche'),
        Interest('Développement de Compétences en Présentation'),
        Interest('Éthique de la Recherche'),
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
                  items: interests
                      .map<DropdownMenuItem<Interest>>((Interest value) {
                    return DropdownMenuItem<Interest>(
                      value: value,
                      child: Text(value.name),
                    );
                  }).toList(),
                ),

                // DropdownButton for level 2 interests
                if (subInterestsLevel2.isNotEmpty)
                  DropdownButton<Interest>(
                    hint: Text('Sélectionnez un sous-centre d\'intérêt de niveau 2'),
                    value: selectedInterestLevel2,
                    onChanged: _onSelectedLevel2,
                    items: subInterestsLevel2.map((Interest value) {
                      return DropdownMenuItem<Interest>(
                        value: value,
                        child: Text(value.name),
                      );
                    }).toList(),
                  ),

                // DropdownButton for level 3 interests
                if (subInterestsLevel3.isNotEmpty)
                  DropdownButton<Interest>(
                    hint: Text('Sélectionnez un sous-centre d\'intérêt de niveau 3'),
                    value: selectedInterestLevel3,
                    onChanged: (Interest? newValue) {
                      setState(() {
                        selectedInterestLevel3 = newValue;
                      });
                    },
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
