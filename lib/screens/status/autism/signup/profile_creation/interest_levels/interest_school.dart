import 'package:flutter/material.dart';
import 'package:workwise_autism/screens/status/autism/signup/profile_creation/profile_customization.dart';
import 'package:workwise_autism/widgets/color_constants.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    // level 1
    Interest('Découverte des Sciences', [
      // level 2
      Interest('Sciences Naturelles', [
        // level 3
        Interest('Biologie et Étude des Organismes'),
        Interest('Géologie et Sciences de la Terre'),
        Interest('Astronomie et Exploration de l\'Espace'),
        Interest('Sciences de l\'Environnement'),
        Interest('Physique et Chimie pour Enfants'),
        Interest('Météorologie et Climat'),
        Interest('Anatomie Humaine et Santé'),
        Interest('Observation de la Nature et Expériences'),
        Interest('Découverte de l\'Univers Sous-Marin'),
      ]),
      Interest('Astronomie et Espace', [
        Interest('Système Solaire'),
        Interest('Constellations et Cartographie Céleste'),
        Interest('Observation Astronomique'),
        Interest('Exploration Spatiale et Vaisseaux Spatiaux'),
        Interest('Galaxies et Univers'),
        Interest('Astronomie dans la Culture'),
        Interest('Phénomènes Cosmiques'),
        Interest('Base de l\'Astronomie et de la Physique Spatiale'),
        Interest('Projet et Activités Pratiques en Astronomie'),
      ]),
      Interest('Physique et Chimie', [
        Interest('Découverte de la Matière'),
        Interest('Force et Mouvement'),
        Interest('Énergie et Travail'),
        Interest('Chimie Amusante'),
        Interest('Lumière et Son'),
        Interest('Magnétisme et Électricité'),
        Interest('Espace et Univers'),
        Interest('Expériences Scientifiques'),
        Interest('Chimie du Quotidien'),
      ]),
      Interest('Sciences de la vie', [
        Interest('Anatomie Humaine et Biologie du Corps'),
        Interest('Plantes et Botanique'),
        Interest('Animaux et Zoologie'),
        Interest('Écologie et Environnement'),
        Interest('Micro-organismes et Microbiologie'),
        Interest('Santé et Hygiène'),
        Interest('Sciences Alimentaires'),
        Interest('Nature et Découverte'),
        Interest('Projets Scientifiques en Biologie'),
      ]),
      Interest('Environnement et Durabilité', [
        Interest('Écosystèmes et Habitats'),
        Interest('Changement Climatique et Impact sur l\'Environnement'),
        Interest('Conservation et Protection de la Nature'),
        Interest('Ressources Naturelles et Énergie Durable'),
        Interest('Pollution et Gestion des Déchets'),
        Interest('Agriculture et Alimentation Durables'),
        Interest('Cycle de l\'Eau et Conservation de l\'Eau'),
        Interest('Nature et Exploration'),
        Interest('Sensibilisation à l\'Écologie'),
      ]),
      Interest('Histoire et Sciences Humaines', [
        Interest('Histoire Locale et Familiale'),
        Interest('Civilisations Anciennes'),
        Interest('Géographie et Cultures du Monde'),
        Interest('Périodes Historiques'),
        Interest('Histoire de l\'Art'),
        Interest('Inventions et Découvertes'),
        Interest('Traditions et Célébrations'),
        Interest('Économie et Vie Quotidienne'),
        Interest('Projets et Activités en Histoire et Sciences Humaines'),
      ]),
    ]),
    Interest('Arts et Créativité', [
      Interest('Arts Visuels', [
        Interest('Dessin et Illustration'),
        Interest('Peinture et Couleurs'),
        Interest('Arts et Artisanat'),
        Interest('Photographie et Médias Visuels'),
        Interest('Sculpture et Modelage'),
        Interest('Art Numérique et Graphisme'),
        Interest('Histoire de l\'Art et Artistes Célèbres'),
        Interest('Expression Créative et Imagination'),
        Interest('Expositions et Projets d\'Art de Groupe'),
      ]),
      Interest('Musique', [
        Interest('Découverte des Instruments de Musique'),
        Interest('Rythme et Percussions'),
        Interest('Chant et Voix'),
        Interest('Genres Musicaux et Histoire de la Musique'),
        Interest('Éducation Musicale et Théorie de la Musique'),
        Interest('Fabrication d\'Instruments Simples'),
        Interest('Musique et Mouvement'),
        Interest('Appréciation Musicale et Écoute Active'),
        Interest('Projets et Performances Musicales'),
      ]),
      Interest('Théàtre et Performance', [
        Interest('Initiation au Théâtre'),
        Interest('Expression Corporelle et Mime'),
        Interest('Marionnettes et Théâtre d\'Objets'),
        Interest('Contes et Narration'),
        Interest('Techniques de Scène et Présence'),
        Interest('Costumes et Décor'),
        Interest('Musique et Théâtre Musical'),
        Interest('Projets de Théâtre et Performances'),
        Interest('Appréciation du Théâtre'),
      ]),
      Interest('Arts Manuels et Artisanat', [
        Interest('Travaux en Papier et Papier Mâché'),
        Interest('Peinture et Dessin sur Divers Supports'),
        Interest('Modelage et Sculpture'),
        Interest('Travaux de Fil et Tissu'),
        Interest('Projets de Recyclage Créatif'),
        Interest('Bijouterie et Création de Bijoux'),
        Interest('Projets d\'Art et d\'Artisanat Thématiques'),
        Interest('Techniques Mixtes et Collage'),
        Interest('Expositions et Partage d\'Artisanat'),
      ]),
      Interest('Photographie et Arts Numériques', [
        Interest('Initiation à la Photographie'),
        Interest('Techniques de Photographie'),
        Interest('Art Numérique et Création Graphique'),
        Interest('Traitement de l\'Image et Montage'),
        Interest('Animation et Création de Vidéos'),
        Interest('Projets Multimédias'),
        Interest('Sécurité et Éthique dans le Numérique'),
        Interest('Exposition et Partage des Créations'),
        Interest('Expérimentation et Exploration Créative'),
      ]),
      Interest('Expression Créative', [
        Interest('Ateliers d\'Art et de Création'),
        Interest('Écriture Créative et Poésie'),
        Interest('Expression Corporelle et Danse'),
        Interest('Théâtre et Jeux de Rôle'),
        Interest('Musique et Chant'),
        Interest('Artisanat et Projets Manuels'),
        Interest('Art Visuel et Projets Multimédia'),
        Interest('Projets de Groupe et Collaboration'),
        Interest('Développement de la Confiance et de l\'Estime de Soi'),
      ]),
    ]),
    Interest('Nature et Animaux', [
      Interest('Découverte des Animaux', [
        Interest('Animaux Domestiques et de Compagnie'),
        Interest('Animaux de la Ferme'),
        Interest('Animaux Sauvages et Habitats Naturels'),
        Interest('Insectes et Petites Créatures'),
        Interest('Oiseaux et Ornithologie'),
        Interest('Animaux Aquatiques et Vie Marine'),
        Interest('Animaux Préhistoriques et Dinosaures'),
        Interest('Conservation et Protection des Animaux'),
        Interest('Interactions avec les Animaux'),
      ]),
      Interest('Observation de la Nature', [
        Interest('Exploration de Divers Écosystèmes'),
        Interest('Activités d\'Observation dans la Nature'),
        Interest('Observation des Plantes et Fleurs'),
        Interest('Observation des Animaux et Insectes'),
        Interest('Phénomènes Naturels et Saisonniers'),
        Interest('Activités Nocturnes et Astronomie'),
        Interest('Protection de l\'Environnement et Sensibilisation'),
        Interest('Photographie et Journal de la Nature'),
        Interest('Expériences Sensorielles et Découvertes'),
      ]),
      Interest('Sciences Envirronementales', [
        Interest('Écosystèmes et Biodiversité'),
        Interest('Conservation et Protection de la Nature'),
        Interest('Changement Climatique et Impact Humain'),
        Interest('Ressources Naturelles et Durabilité'),
        Interest('Cycle de l\'Eau et Hydrologie'),
        Interest('Gestion des Déchets et Recyclage'),
        Interest('Faune et Flore Locales'),
        Interest('Climatologie et Phénomènes Météorologiques'),
        Interest('Activités et Projets Pratiques'),
      ]),
      Interest('Activités Extérieures', [
        Interest('Randonnées et Explorations Naturelles'),
        Interest('Jardinage et Horticulture'),
        Interest('Observation de la Faune'),
        Interest('Activités Aquatiques'),
        Interest('Sports et Jeux en Plein Air'),
        Interest('Campement et Activités de Survie'),
        Interest('Activités de Sensibilisation à l\'Environnement'),
        Interest('Photographie et Art en Plein Air'),
        Interest('Excursions et Voyages Éducatifs'),
      ]),
      Interest('Interations avec les Animaux', [
        Interest('Soins aux Animaux Domestiques'),
        Interest('Interaction avec les Animaux de Ferme'),
        Interest('Programmes de Thérapie Assistée par les Animaux'),
        Interest('Activités d\'Observation de la Faune'),
        Interest('Visites de Zoos et d\'Aquariums'),
        Interest('Activités de Sensibilisation aux Animaux'),
        Interest('Interaction avec les Animaux dans la Nature'),
        Interest('Ateliers et Clubs sur les Animaux'),
        Interest('Interaction avec les Petites Créatures'),
      ]),
      Interest('Projets et Expériences', [
        Interest('Expériences Scientifiques Simples'),
        Interest('Projets de Science Naturelle'),
        Interest('Activités d\'Art et de Créativité'),
        Interest('Projets de Jardinage et d\'Horticulture'),
        Interest('Observation et Étude des Animaux'),
        Interest('Expériences de Sciences de la Terre'),
        Interest('Projets de Sensibilisation à l\'Environnement'),
        Interest('Ateliers de Cuisine et Découverte Alimentaire'),
        Interest('Projets de Technologie et D\'ingénierie'),
      ]),
      Interest('Education sur la Nature', [
        Interest('Découverte des Écosystèmes'),
        Interest('Étude de la Faune et de la Flore'),
        Interest('Sensibilisation à l\'Environnement'),
        Interest('Observation et Exploration de la Nature'),
        Interest('Cycles Naturels et Phénomènes Météorologiques'),
        Interest('Projet sur l\'Écologie et la Biodiversité'),
        Interest('Initiation aux Sciences de la Terre'),
        Interest('Agriculture et Jardinage'),
        Interest('Activités Artistiques et Créatives sur la Nature'),
      ]),
    ]),
    Interest('Sports et Activités Physiques', [
      Interest('Sports Individuels', [
        Interest('Athlétisme et Course à Pied'),
        Interest('Natation et Activités Aquatiques'),
        Interest('Gymnastique et Exercices de Flexibilité'),
        Interest('Arts Martiaux et Autodéfense'),
        Interest('Cyclisme et Vélo'),
        Interest('Escalade et Alpinisme'),
        Interest('Tennis et Sports de Raquette'),
        Interest('Sports de Précision'),
        Interest('Activités de Plein Air et d\'Aventure'),
      ]),
      Interest('Sports d\'Equipe', [
        Interest('Football et Football Miniature'),
        Interest('Basketball et Mini-Basket'),
        Interest('Volleyball et Volleyball Simplifié'),
        Interest('Baseball et T-Ball'),
        Interest('Rugby et Tag Rugby'),
        Interest('Hockey et Floorball'),
        Interest('Ultimate Frisbee et Frisbee Modifié'),
        Interest('Relais et Courses d\'Équipe'),
        Interest('Activités de Team Building et de Coopération'),
      ]),
      Interest('Activités de Plein Air', [
        Interest('Exploration de la Nature'),
        Interest('Jardinage et Horticulture'),
        Interest('Activités Aquatiques'),
        Interest('Sports et Jeux en Plein Air'),
        Interest('Camping et Activités de Survie'),
        Interest('Observation des Étoiles et Astronomie'),
        Interest('Activités de Plein Air Créatives'),
        Interest('Jeux de Plein Air Traditionnels'),
        Interest('Excursions Éducatives'),
      ]),
      Interest('Gymnastique et Mouvement', [
        Interest('Gymnastique Basique'),
        Interest('Yoga pour Enfants'),
        Interest('Danse et Mouvement Créatif'),
        Interest('Équilibre et Coordination'),
        Interest('Acrobaties Simples'),
        Interest('Activités de Plein Air et d\'Aventure'),
        Interest('Activités de Gym Douce'),
        Interest('Jeux de Coordination en Groupe'),
        Interest('Activités Sensori-Motrices'),
      ]),
      Interest('Jeux de Coordination', [
        Interest('Jeux de Balle'),
        Interest('Jeux d\'Adresse'),
        Interest('Activités de Jonglage'),
        Interest('Jeux d\'Équilibre'),
        Interest('Jeux de Coordination en Groupe'),
        Interest('Activités de Motricité Fine'),
        Interest('Exercices de Coordination Bilatérale'),
        Interest('Jeux de Suivi de Rythme'),
        Interest('Activités de Précision'),
      ]),
      Interest('Arts Martiaux', [
        Interest('Karaté'),
        Interest('Judo'),
        Interest('Taekwondo'),
        Interest('Aïkido'),
        Interest('Kung Fu et Arts Martiaux Chinois'),
        Interest('Capoeira'),
        Interest('Self-Défense Adaptée'),
        Interest('Arts Martiaux Mixtes (MMA) pour Enfants'),
        Interest('Tai Chi et Mouvements Fluides'),
      ]),
      Interest('Activités Adaptées', [
        Interest('Thérapie par le Mouvement et la Danse'),
        Interest('Activités Sensori-Motrices'),
        Interest('Activités Aquatiques Adaptées'),
        Interest('Equithérapie et Activités avec des Animaux'),
        Interest('Gymnastique Douce et Yoga Adapté'),
        Interest('Activités de Plein Air Adaptées'),
        Interest('Thérapie par le Sport et l\'Activité Physique'),
        Interest('Activités Artistiques et Créatives'),
        Interest('Jeux et Activités de Groupe Adaptés'),
      ]),
    ]),
    Interest('Jeux et Divertissement', [
      Interest('Jeux de Société et Puzzles', [
        Interest('Jeux de société classiques'),
        Interest('Puzzles adaptés'),
        Interest('Jeux de mémoire et d\'attention'),
        Interest('Jeux de logique et de raisonnement'),
        Interest('Jeux de construction et de création'),
        Interest('Jeux de rôles et d\'imagination'),
        Interest('Jeux éducatifs et interactifs'),
        Interest('Jeux de société collaboratifs'),
        Interest('Jeux de motricité fine et de manipulation'),
      ]),
      Interest('Jeux de Construction', [
        Interest('Blocs de Construction'),
        Interest('LEGO et Briques de Construction'),
        Interest('Jeux de Construction Magnétiques'),
        Interest('Puzzles 3D et Maquettes'),
        Interest('Jeux de Construction avec des Tiges et des Connecteurs'),
        Interest('Constructions avec des Matériaux Naturels'),
        Interest('Jeux de Construction de Circuits et Électroniques'),
        Interest('Activités de Construction Collaboratives'),
        Interest('Jeux de Construction et de Création Libre'),
      ]),
      Interest('Jeux d\'Imagination et de Rôle', [
        Interest('Jeux de Faire Semblant'),
        Interest('Théâtre et Narration'),
        Interest('Jeux de Construction de Monde'),
        Interest('Jeux de Poupées et Figurines'),
        Interest('Jeux de Costume et Déguisement'),
        Interest('Jeux de Marionnettes et de Théâtre de Poupées'),
        Interest('Jeux de Société avec Éléments de Rôle'),
        Interest('Activités d\'Exploration et d\'Aventure'),
        Interest('Projets Collaboratifs et Créatifs'),
      ]),
      Interest('Jeux Vidéo et Interactifs', [
        Interest('Jeux Éducatifs sur Ordinateur ou Tablettes'),
        Interest('Jeux de Réalité Augmentée (AR)'),
        Interest('Jeux de Simulation'),
        Interest('Jeux de Puzzle et de Stratégie'),
        Interest('Jeux de Rôle et d\'Aventure'),
        Interest('Applications et Jeux Créatifs'),
        Interest('Jeux de Mouvement et de Coordination'),
        Interest('Jeux Sociaux et Collaboratifs'),
        Interest('Jeux de Découverte et d\'Exploration'),
      ]),
      Interest('Activités Créatives et Artistiques', [
        Interest('Arts Plastiques et Dessin'),
        Interest('Peinture et Coloriage'),
        Interest('Artisanat et Bricolage'),
        Interest('Musique et Chant'),
        Interest('Théâtre et Performance'),
        Interest('Dance et Mouvement'),
        Interest('Photographie et Arts Numériques'),
        Interest('Sculpture et Modelage'),
        Interest('Activités de Création et d\'Invention'),
      ]),
      Interest('Jeux Extérieurs et Activités Physiques', [
        Interest('Jeux de Plein Air Classiques'),
        Interest('Activités de Parc et de Nature'),
        Interest('Sports Adaptés'),
        Interest('Activités de Vélo et de Trottinette'),
        Interest('Jeux de Piste et Chasses au Trésor'),
        Interest('Ateliers de Jardinage'),
        Interest('Activités Aquatiques'),
        Interest('Jeux d\'Adresse et de Lancer'),
        Interest('Activités de Plein Air Collaboratives'),
      ]),
      Interest('Jeux de Coordination et d\'Adresse', [
        Interest('Jeux de Lancer'),
        Interest('Jeux d\'Équilibre'),
        Interest('Jeux de Balle et de Raquette'),
        Interest('Activités de Jonglage'),
        Interest('Jeux de Précision'),
        Interest('Jeux de Construction et de Manipulation'),
        Interest('Parcours d\'Obstacles'),
        Interest('Jeux de Réflexes et de Réaction'),
        Interest('Activités de Groupes et de Relais'),
      ]),
    ]),
    Interest('Loisirs Educatifs', [
      Interest('Activités de Lecture et d\'Ecriture', [
        Interest('Lectures Guidées'),
        Interest('Ateliers d\'Écriture Créative'),
        Interest('Jeux et Activités de Compréhension'),
        Interest('Exercices de Calligraphie et d\'Écriture Manuelle'),
        Interest('Lecture Interactive et Numérique'),
        Interest('Activités de Littératie Précoce'),
        Interest('Ateliers de Bande Dessinée et d\'Illustration'),
        Interest('Écriture de Poèmes et de Chansons'),
        Interest('Activités de Théâtre et de Narration'),
      ]),
      Interest('Activités Scientifiques et de Découverte', [
        Interest('Expériences de Science Basique'),
        Interest('Exploration de la Nature et de l\'Environnement'),
        Interest('Astronomie et Découverte de l\'Espace'),
        Interest('Biologie et Sciences de la Vie'),
        Interest('Géologie et Sciences de la Terre'),
        Interest('Expériences Sensorielles et Tactiles'),
        Interest('Technologie et Informatique pour Enfants'),
        Interest('Activités de Construction et d\'Ingénierie'),
        Interest('Projets Scientifiques Interactifs'),
      ]),
      Interest('Activités Mathématiques et de Logique', [
        Interest('Jeux de Nombres et de Calcul'),
        Interest('Activités de Logique et de Raisonnement'),
        Interest('Jeux de Formes et de Géométrie'),
        Interest('Activités de Mesure et d\'Estimation'),
        Interest('Initiation aux Graphiques et Données'),
        Interest('Jeux de Tri et de Classement'),
        Interest('Activités de Patterns et Séquences'),
        Interest('Mathématiques du Quotidien'),
        Interest('Technologie et Mathématiques'),
      ]),
      Interest('Arts et Artisanat', [
        Interest('Dessin et Peinture'),
        Interest('Bricolage et Artisanat'),
        Interest('Sculpture et Modelage'),
        Interest('Travaux Manuels et Créatifs'),
        Interest('Artisanat Traditionnel et Culturel'),
        Interest('Arts Numériques'),
        Interest('Activités de Bijouterie et de Décoration'),
        Interest('Projets de Construction et d\'Assemblage'),
        Interest('Ateliers Thématiques et Saisonniers'),
      ]),
      Interest('Musique et Rythme', [
        Interest('Initiation aux Instruments de Musique'),
        Interest('Chant et Expression Vocale'),
        Interest('Rythme et Mouvement'),
        Interest('Éveil Musical'),
        Interest('Fabrication d\'Instruments'),
        Interest('Musique et Histoires'),
        Interest('Ateliers de Percussions'),
        Interest('Thérapie Musicale'),
        Interest('Musique et Technologies'),
      ]),
      Interest('Technologie et Informatique', [
        Interest('Initiation à l\'Ordinateur et à Internet'),
        Interest('Jeux Éducatifs Informatiques'),
        Interest('Initiation à la Programmation'),
        Interest('Robotique pour Enfants'),
        Interest('Utilisation Créative de la Technologie'),
        Interest('Découverte des Médias Numériques'),
        Interest('Sécurité et Étiquette en Ligne'),
        Interest('Exploration de Gadgets et de Nouvelles Technologies'),
        Interest('Projets de Technologie Assistive'),
      ]),
      Interest('Activités de Découverte Culturelle', [
        Interest('Découverte de Différentes Cultures'),
        Interest('Cuisine et Gastronomie Internationale'),
        Interest('Musique et Danse Traditionnelle'),
        Interest('Langues et Communication'),
        Interest('Artisanat et Arts Visuels'),
        Interest('Littérature et Contes du Monde'),
        Interest('Festivals et Célébrations'),
        Interest('Histoire et Patrimoine'),
        Interest('Échanges et Partages Culturels'),
      ]),
      Interest('Observation et Astronomie', [
        Interest('Introduction à l\'Astronomie'),
        Interest('Observation du Ciel Nocturne'),
        Interest('Ateliers sur le Système Solaire'),
        Interest('Expériences sur la Lune'),
        Interest('Activités sur les Étoiles et les Galaxies'),
        Interest('Astronomie et Art'),
        Interest('Technologie et Exploration Spatiale'),
        Interest('Phénomènes Célestes'),
        Interest('Activités d\'Astronomie Pratique'),
      ]),
    ]),
    Interest('Langues et Premières Lectures', [
      Interest('Apprentissage de la Lecture', [
        Interest('Reconnaissance des Lettres et des Sons'),
        Interest('Lecture de Mots et de Phrases'),
        Interest('Lecture Compréhensive'),
        Interest('Livres Illustrés et Contes'),
        Interest('Lecture Interactive et Participative'),
        Interest('Initiation à la Poésie et aux Rimes'),
        Interest('Littérature Adaptée et Facile à Lire'),
        Interest('Activités d\'Écriture et de Lecture'),
        Interest('Lecture et Technologie'),
      ]),
      Interest('Écriture et Orthographe', [
        Interest('Apprentissage de l\'Écriture des Lettres'),
        Interest('Écriture de Mots et Phrases'),
        Interest('Orthographe et Vocabulaire'),
        Interest('Initiation à la Grammaire'),
        Interest('Écriture Créative'),
        Interest('Journal Intime et Écriture Personnelle'),
        Interest('Dictées et Tests d\'Orthographe'),
        Interest('Écriture et Technologie'),
        Interest('Lecture et Écriture Combinées'),
      ]),
      Interest('Langue Seconde et Bi-linguisme', [
        Interest('Initiation à une Langue Seconde'),
        Interest('Jeux et Activités Ludiques'),
        Interest('Écoute et Compréhension'),
        Interest('Expression Orale'),
        Interest('Culture et Traditions'),
        Interest('Écriture dans une Langue Seconde'),
        Interest('Interactions et Échanges'),
        Interest('Théâtre et Performances'),
        Interest('Technologie et Apprentissage de la Langue'),
      ]),
      Interest('Livres Interactifs et Multimédias', [
        Interest('E-books et Livres Numériques'),
        Interest('Applications de Lecture'),
        Interest('Livres Audio et Podcasts'),
        Interest('Livres avec Réalité Augmentée'),
        Interest('Vidéos Interactives et Éducatives'),
        Interest('CD-ROMs et Logiciels Éducatifs'),
        Interest('Projets Multimédias'),
        Interest('Lecture Interactive en Groupe'),
        Interest('Adaptation de Contenus pour l\'Accessibilité'),
      ]),
      Interest('Poésie et Chansons', [
        Interest('Découverte de la Poésie'),
        Interest('Chansons et Comptines'),
        Interest('Poésie et Art Visuel'),
        Interest('Rythme et Sonorité dans la Poésie'),
        Interest('Chansons Éducatives'),
        Interest('Narration et Poésie'),
        Interest('Poésie et Langue Seconde'),
        Interest('Poésie et Nature'),
        Interest('Chansons et Interactions Sociales'),
      ]),
      Interest('Activités de Narration', [
        Interest('Racontage d\'Histoires'),
        Interest('Utilisation de Marionnettes et de Théâtre'),
        Interest('Écriture et Illustration de Récits'),
        Interest('Narration Numérique'),
        Interest('Narration à travers l\'Art'),
        Interest('Narration Interactive'),
        Interest('Narration et Musique'),
        Interest('Narration et Nature'),
        Interest('Narration et Découverte Culturelle'),
      ]),
      Interest('Jeux de Langage et de Communication', [
        Interest('Jeux de Mots et de Vocabulaire'),
        Interest('Jeux de Phrases et de Grammaire'),
        Interest('Jeux de Communication Verbale'),
        Interest('Jeux d\'Écoute et de Compréhension'),
        Interest('Jeux de Prononciation et d\'Articulation'),
        Interest('Jeux de Narration et d\'Expression'),
        Interest('Jeux de Rhymes et de Poésie'),
        Interest('Jeux d\'Interaction Sociale'),
        Interest('Jeux de Langue Seconde et Bilinguisme'),
      ]),
    ]),
    Interest('Initiation aux Mathématiques et à la Logique', [
      Interest('Concepts de Base en Mathématiques', [
        Interest('Nombres et Comptage'),
        Interest('Opérations de Base'),
        Interest('Formes et Géométrie'),
        Interest('Mesures et Comparaisons'),
        Interest('Patterns et Séquences'),
        Interest('Concepts de Base en Temps et en Argent'),
        Interest('Résolution de Problèmes Simples'),
        Interest('Mathématiques et Nature'),
        Interest('Mathématiques et Créativité'),
      ]),
      Interest('Résolution de Problèmes et Logique', [
        Interest('Jeux de Logique'),
        Interest('Jeux de Stratégie'),
        Interest('Activités de Résolution de Problèmes'),
        Interest('Exercices de Pensée Critique'),
        Interest('Jeux de Construction et de Création'),
        Interest('Activités de Classement et de Catégorisation'),
        Interest('Jeux de Puzzle et d\'Assemblage'),
        Interest('Activités de Planification et d\'Organisation'),
        Interest('Activités de Séquençage et d\'Ordre'),
      ]),
      Interest('Mathématiques Appliquées', [
        Interest('Utilisation des Mathématiques dans la Vie Quotidienne'),
        Interest('Mathématiques et Nature'),
        Interest('Mathématiques et Jeux'),
        Interest('Mathématiques et Art'),
        Interest('Mathématiques et Sciences'),
        Interest('Mathématiques et Technologie'),
        Interest('Problèmes de Mathématiques du Monde Réel'),
        Interest('Mathématiques et Construction'),
        Interest('Mathématiques et Santé'),
      ]),
      Interest('Jeux Mathématiques et Interactifs', [
        Interest('Jeux de Calcul'),
        Interest('Jeux Éducatifs sur Ordinateur ou Tablette'),
        Interest('Puzzles et Casse-têtes Mathématiques'),
        Interest('Jeux de Construction et de Mesure'),
        Interest('Jeux de Séquences et de Patterns'),
        Interest('Jeux de Tri et de Catégorisation'),
        Interest('Jeux de Réflexion et de Stratégie'),
        Interest('Jeux de Correspondance et d\'Association'),
        Interest('Jeux d\'Estimation et de Probabilités'),
      ]),
      Interest('Activités de Groupe en Mathématiques', [
        Interest('Jeux de Société Mathématiques'),
        Interest('Ateliers de Construction Collective'),
        Interest('Activités de Mesure en Groupe'),
        Interest('Jeux de Résolution de Problèmes'),
        Interest('Activités de Tri et de Classement'),
        Interest('Projets Mathématiques Créatifs'),
        Interest('Jeux de Nombres et de Séquences en Groupe'),
        Interest('Compétitions Amicales de Mathématiques'),
        Interest(
            'Activités Collaboratives de Planification et de Budgétisation'),
      ]),
      Interest('Introduction aux Statistiques et Données', [
        Interest('Collecte et Classement de Données'),
        Interest('Création de Graphiques Simples'),
        Interest('Interprétation de Données'),
        Interest('Mesures et Comparaisons'),
        Interest('Probabilités et Chances'),
        Interest('Utilisation de Tableaux et de Listes'),
        Interest('Projets de Statistiques Basiques'),
        Interest('Jeux de Déduction et d\'Analyse'),
        Interest('Statistiques et Projets du Monde Réel'),
      ]),
      Interest('Pensée Abstraite et Conceptuelle', [
        Interest('Collecte et Classement de Données'),
        Interest('Création de Graphiques Simples'),
        Interest('Interprétation de Données'),
        Interest('Mesures et Comparaisons'),
        Interest('Probabilités et Chances'),
        Interest('Utilisation de Tableaux et de Listes'),
        Interest('Projets de Statistiques Basiques'),
        Interest('Jeux de Déduction et d\'Analyse'),
        Interest('Statistiques et Projets du Monde Réel'),
      ]),
    ]),
    Interest('Environnement et Planète Terre', [
      Interest('Découverte de l\'Environnement Naturel', [
        Interest('Exploration de la Faune et de la Flore'),
        Interest('Activités de Jardinage et de Cultivation'),
        Interest('Expéditions et Excursions Naturelles'),
        Interest('Projets d\'Observation de la Nature'),
        Interest('Activités de Sensibilisation à l\'Environnement'),
        Interest('Jeux et Activités Interactives en Extérieur'),
        Interest('Projets de Sciences Naturelles'),
        Interest('Ateliers de Création Naturelle'),
        Interest('Initiation aux Concepts Écologiques'),
      ]),
      Interest('Phénomènes Naturels', [
        Interest('Météorologie et Phénomènes Météorologiques'),
        Interest('Astronomie et Exploration de l\'Espace'),
        Interest('Phénomènes Géologiques'),
        Interest('Cycle de l\'Eau et Processus Aquatiques'),
        Interest('Phénomènes Biologiques'),
        Interest('Événements Atmosphériques'),
        Interest('Activités de Sensibilisation à l\'Environnement'),
        Interest('Excursions Éducatives'),
        Interest('Ateliers Créatifs sur la Nature'),
      ]),
      Interest('Conservation et Protection de l\'Environnement', [
        Interest('Éducation sur la Faune et la Flore'),
        Interest('Pratiques de Développement Durable'),
        Interest('Protection des Écosystèmes et des Habitats'),
        Interest('Sensibilisation au Changement Climatique'),
        Interest('Activités de Conservation de la Nature'),
        Interest('Éducation sur la Pollution et ses Effets'),
        Interest('Initiatives de Sensibilisation Communautaire'),
        Interest('Observation et Interaction avec la Nature'),
        Interest('Art et Expression Créative sur l\'Environnement'),
      ]),
      Interest('Activité Extérieures et Exploration', [
        Interest('Découvertes dans la Nature'),
        Interest('Jardinage et Horticulture'),
        Interest('Exploration de la Faune'),
        Interest('Activités de Plein Air'),
        Interest('Jeux et Sports Extérieurs'),
        Interest('Éducation Environnementale'),
        Interest('Excursions Éducatives'),
        Interest('Projets de Conservation et de Sensibilisation'),
        Interest('Art et Créativité en Extérieur'),
      ]),
      Interest('Géographie et Cartographie', [
        Interest('Cartes et Navigation'),
        Interest('Géographie Physique et Naturelle'),
        Interest('Géographie Humaine et Culturelle'),
        Interest('Outils de Cartographie'),
        Interest('Études Régionales et Comparatives'),
        Interest('Sensibilisation à l\'Environnement Global'),
        Interest('Activités Pratiques et Interactives'),
        Interest('Expéditions et Excursions'),
        Interest('Art et Géographie'),
      ]),
      Interest('Education sur la Durabilité', [
        Interest('Principes de Durabilité'),
        Interest('Recyclage et Gestion des Déchets'),
        Interest('Conservation de l\'Eau et de l\'Énergie'),
        Interest('Protection de la Faune et de la Flore'),
        Interest('Alimentation Durable'),
        Interest('Projets Écologiques'),
        Interest('Sensibilisation Communautaire'),
        Interest('Exploration de la Nature'),
        Interest('Art et Durabilité'),
      ]),
      Interest('Activités et Projets Pratiques', [
        Interest('Jardinage et Horticulture'),
        Interest('Projets de Science Naturelle'),
        Interest('Activités Artisanales'),
        Interest('Observation et Exploration de la Nature'),
        Interest('Activités d\'Éducation Environnementale'),
        Interest('Alimentation et Cuisine'),
        Interest('Projets de Construction et Modélisation'),
        Interest('Ateliers de Créativité'),
        Interest('Éducation sur les Animaux'),
        Interest('Projets de Sensibilisation Communautaire'),
      ])
    ]),
    Interest('Culture et Traditions', [
      Interest('Découverte des Cultures du Monde', [
        Interest('Traditions et Coutumes'),
        Interest('Cuisine Internationale'),
        Interest('Musique et Danse'),
        Interest('Langues et Littérature'),
        Interest('Art et Artisanat'),
        Interest('Géographie et Découvertes'),
        Interest('Histoire et Civilisations'),
        Interest('Célébrations Multiculturelles'),
        Interest('Mode et Costumes'),
        Interest('Cinéma et Médias'),
      ]),
      Interest('Arts et Artisanat Culturels', [
        Interest('Peinture et Dessin Culturels'),
        Interest('Artisanat et Techniques Traditionnelles'),
        Interest('Fabrication de Costumes et d\'Accessoires'),
        Interest('Arts Visuels et Expression'),
        Interest('Musique et Instruments'),
        Interest('Textiles et Tissus'),
        Interest('Papeterie et Décoration'),
        Interest('Art de la Céramique'),
        Interest('Projet Multiculturel'),
      ]),
      Interest('Musique et Danse Traditionnelles', [
        Interest('Découverte de Musiques Traditionnelles'),
        Interest('Ateliers de Danse Culturelle'),
        Interest('Rythme et Percussion'),
        Interest('Chants Traditionnels'),
        Interest('Instruments de Musique DIY'),
        Interest('Histoire de la Musique et de la Danse'),
        Interest('Expression Corporelle et Mouvement'),
        Interest('Festivals et Célébrations Culturelles'),
        Interest('Projets Collaboratifs et Performances'),
      ]),
      Interest('Fêtes et Célébrations', [
        Interest('Célébrations Internationales'),
        Interest('Activités de Décoration'),
        Interest('Musique et Danse de Fête'),
        Interest('Cuisine Festive'),
        Interest('Histoire et Signification'),
        Interest('Costumes et Parades'),
        Interest('Projets Artistiques et Créatifs'),
        Interest('Activités Communautaires'),
        Interest('Jeux et Divertissements de Fête'),
      ]),
      Interest('Cuisine et Gastronomie', [
        Interest('Découverte de la Cuisine Mondiale'),
        Interest('Ateliers de Cuisine Pratique'),
        Interest('Découverte des Ingrédients'),
        Interest('Pâtisserie et Boulangerie'),
        Interest('Cuisine Culturelle et Fêtes'),
        Interest('Alimentation et Nutrition'),
        Interest('Activités Sensorielles et Dégustation'),
        Interest('Recettes Faciles et Amusantes'),
        Interest('Hygiène et Sécurité en Cuisine'),
        Interest('Projets de Cuisine Communautaire'),
      ]),
      Interest('Langues et Communication', [
        Interest('Initiation aux Langues Étrangères'),
        Interest('Communication Non Verbale'),
        Interest('Lecture et Écriture'),
        Interest('Jeux Linguistiques et de Communication'),
        Interest('Compréhension Interculturelle'),
        Interest('Activités d\'Écoute Active'),
        Interest('Prononciation et Diction'),
        Interest('Communication Visuelle'),
        Interest('Techniques de Présentation'),
        Interest('Ateliers de Théâtre et d\'Expression'),
      ]),
      Interest('Histoire et Civilisations', [
        Interest('Civilisations Antiques'),
        Interest('Histoire Locale et Régionale'),
        Interest('Explorateurs et Voyages Découverte'),
        Interest('Traditions et Coutumes'),
        Interest('Histoire des Inventions et Découvertes'),
        Interest('Civilisations du Monde'),
        Interest('Mythologies et Légendes'),
        Interest('Époques Historiques'),
        Interest('Histoire du Quotidien'),
        Interest('Projets Interactifs et Expositions'),
      ]),
    ]),
    Interest('Cuisine et Découvertes Alimentaires', [
      Interest('Initiation à la Cuisine', [
        Interest('Techniques de Cuisine de Base'),
        Interest('Préparation de Snacks Sains'),
        Interest('Découverte des Aliments'),
        Interest('Cuisine Thématique et Culturelle'),
        Interest('Pâtisserie pour Enfants'),
        Interest('Hygiène et Sécurité Alimentaire'),
        Interest('Cuisine et Sciences'),
        Interest('Recettes Créatives'),
        Interest('Cuisine et Mathématiques'),
        Interest('Projets de Cuisine en Groupe'),
      ]),
      Interest('Alimentation et Nutrition', [
        Interest('Principes de Base de la Nutrition'),
        Interest('Alimentation Équilibrée'),
        Interest('Découverte des Aliments Sains'),
        Interest('Hydratation et Boissons'),
        Interest('Cuisine et Nutrition'),
        Interest('Lecture d\'Étiquettes Alimentaires'),
        Interest('Activités Sensorielles avec la Nourriture'),
        Interest('Allergies et Intolérances Alimentaires'),
        Interest('Projet de Jardinage et Alimentation'),
        Interest('Habitudes Alimentaires Saines'),
      ]),
      Interest('Découverte des Saveurs et des Aliments', [
        Interest('Ateliers de Dégustation'),
        Interest('Reconnaissance des Aliments'),
        Interest('Cuisine Sensorielle'),
        Interest('Découverte des Fruits et Légumes'),
        Interest('Aliments du Monde'),
        Interest('Herbes et Épices'),
        Interest('Alimentation et Saisons'),
        Interest('Petits Chefs en Herbe'),
        Interest('Nutrition et Santé'),
        Interest('Projets Alimentaires Créatifs'),
      ]),
      Interest('Cuisine Culturelle et Traditionnelle', [
        Interest('Découverte des Cuisines du Monde'),
        Interest('Recettes Traditionnelles'),
        Interest('Fêtes et Célébrations'),
        Interest('Ingrédients Spéciaux du Monde'),
        Interest('Histoire de la Cuisine'),
        Interest('Cuisine et Contes'),
        Interest('Cuisine Régionale'),
        Interest('Activités de Cuisine Participative'),
        Interest('Cuisine et Artisanat'),
        Interest('Cuisine et Éducation Culturelle'),
      ]),
      Interest('Jardinage et Provenance des Aliments', [
        Interest('Initiation au Jardinage'),
        Interest('Provenance des Aliments'),
        Interest('Culture de Fruits et Légumes'),
        Interest('Plantes Aromatiques et Médicinales'),
        Interest('Éducation sur l\'Agriculture'),
        Interest('Aliments et Saisons'),
        Interest('Compostage et Recyclage'),
        Interest('Plantes et Écologie'),
        Interest('Jardins Sensoriels'),
        Interest('Nutrition et Jardinage'),
      ]),
      Interest('Cuisine Sensorielle et Expérimentale', [
        Interest('Découverte Sensorielle des Aliments'),
        Interest('Cuisine Créative'),
        Interest('Expériences Culinaires'),
        Interest('Aliments du Monde'),
        Interest('Herbes et Épices'),
        Interest('Cuisine et Émotions'),
        Interest('Cuisine Thématique'),
        Interest('Exploration des Saveurs'),
        Interest('Cuisine et Sens'),
        Interest('Cuisine et Narration'),
      ]),
      Interest('Sécurité et Hygiène en Cuisine', [
        Interest('Principes de Base de l\'Hygiène Alimentaire'),
        Interest('Sécurité Alimentaire'),
        Interest('Utilisation Sécurisée des Ustensiles de Cuisine'),
        Interest('Cuisson et Préparation des Aliments'),
        Interest('Identification et Gestion des Allergènes'),
        Interest('Alimentation Saine et Équilibrée'),
        Interest('Sécurité Incendie en Cuisine'),
        Interest('Respect de l\'Environnement'),
        Interest('Étiquetage et Lecture des Étiquettes Alimentaires'),
        Interest('Projets Pratiques en Cuisine'),
      ]),
    ]),
  ];

  Interest? selectedInterest;

  List<Interest> selectedInterestsLevel1 = [];
  List<Interest> selectedInterestsLevel2 = [];
  List<Interest> selectedInterestsLevel3 = [];

  List<Interest> subInterestsLevel2 = [];
  List<Interest> subInterestsLevel3 = [];


  Future<void> _saveInterestsToFirestore() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Check if user is signed in
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Get the user ID
      String userId = user.uid;

      // Préparation des données d'intérêts avec des listes pour chaque niveau
      // Supposons que selectedInterestsLevel1, selectedInterestsLevel2, et selectedInterestsLevel3 sont des List<Interest>
      List<String> interestsLevel1Names = selectedInterestsLevel1.map((interest) => interest.name).toList();
      List<String> interestsLevel2Names = selectedInterestsLevel2.map((interest) => interest.name).toList();
      List<String> interestsLevel3Names = selectedInterestsLevel3.map((interest) => interest.name).toList();

      Map<String, dynamic> interestsData = {
        "interestLevel1": interestsLevel1Names,
        "interestLevel2": interestsLevel2Names,
        "interestLevel3": interestsLevel3Names,
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


  void _showInterestSelectionDialog(List<Interest> interests, List<Interest> selectedInterests, VoidCallback onSelectionChanged) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Sélectionnez les centres d'intérêt"),
          content: SingleChildScrollView(
            child: ListBody(
              children: interests.map((interest) {
                return CheckboxListTile(
                  title: Text(interest.name),
                  value: selectedInterests.contains(interest),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true && !selectedInterests.contains(interest)) {
                        if (selectedInterests.length < 3) {
                          selectedInterests.add(interest);
                        }
                      } else {
                        selectedInterests.remove(interest);
                      }
                      onSelectionChanged();
                    });
                  },
                );
              }).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
                ElevatedButton(
                  onPressed: () => _showInterestSelectionDialog(
                    interests, // Pour le niveau 1, utilisez la liste principale des intérêts
                    selectedInterestsLevel1, // La liste de sélection pour le niveau 1
                        () {
                      // Vous pouvez ajouter du code ici si vous avez besoin de faire quelque chose immédiatement après la modification de la sélection
                    },
                  ),
                  child: Text("Choisir les centres d'intérêt de niveau 1"),
                ),


                // DropdownButton for level 2 interests
                ElevatedButton(
                  onPressed: () => _showInterestSelectionDialog(
                    interests, // Pour le niveau 1, utilisez la liste principale des intérêts
                    selectedInterestsLevel2, // La liste de sélection pour le niveau 1
                        () {
                      // Vous pouvez ajouter du code ici si vous avez besoin de faire quelque chose immédiatement après la modification de la sélection
                    },
                  ),
                  child: Text("Choisir les centres d'intérêt de niveau 2"),
                ),


                // DropdownButton for level 3 interests
                ElevatedButton(
                  onPressed: () => _showInterestSelectionDialog(
                    interests, // Pour le niveau 1, utilisez la liste principale des intérêts
                    selectedInterestsLevel3, // La liste de sélection pour le niveau 1
                        () {
                      // Vous pouvez ajouter du code ici si vous avez besoin de faire quelque chose immédiatement après la modification de la sélection
                    },
                  ),
                  child: Text("Choisir les centres d'intérêt de niveau 3"),
                )

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
                          if (selectedInterestsLevel1.isNotEmpty && selectedInterestsLevel2.isNotEmpty && selectedInterestsLevel3.isNotEmpty) {
                            return Colors.white; // Enabled
                          }
                          return Colors.grey; // Disabled
                        },
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    onPressed: (selectedInterestsLevel1.isNotEmpty && selectedInterestsLevel2.isNotEmpty && selectedInterestsLevel3.isNotEmpty)
                        ? _saveInterestsToFirestore
                        : null, // Enable or disable the button based on the selection
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
