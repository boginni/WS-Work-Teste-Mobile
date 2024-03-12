import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SmallChip renders label correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SmallChip(
          label: const Text('Test Label'),
          backgroundColor: Colors.blue,
        ),
      ),
    );

    // Use a Finder to locate the Text widget with your label
    final textFinder = find.text('Test Label');

    // Assert that it exists
    expect(textFinder, findsOneWidget);
  });
}
