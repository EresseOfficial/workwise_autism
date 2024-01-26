import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:workwise_autism/main.dart';

void main() {
  testWidgets('App should build without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(workwise_autism());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
