import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SmallChip renders with label and background color', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: SmallChip(
            label: const Text('Test Label'),
            backgroundColor: Colors.blue,
          ),
        ),
      ),
    );

    final textFinder = find.text('Test Label');
    expect(textFinder, findsOneWidget);

    final chipFinder = find.byType(Chip);
    final chip = tester.widget<Chip>(chipFinder);
    expect(chip.backgroundColor, Colors.blue);
  });
}