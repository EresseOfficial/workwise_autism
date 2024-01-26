import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:workwise_autism/main.dart'; // Remplacez par le chemin vers votre fichier main.dart

void main() {
  testWidgets('App should build without crashing', (WidgetTester tester) async {
    // Exécutez l'app et attendez que tout soit construit
    await tester.pumpWidget(workwise_autism()); // Remplacez MyApp par le nom de votre widget principal

    // Vérifiez si un certain widget est trouvé dans l'arbre des widgets
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
