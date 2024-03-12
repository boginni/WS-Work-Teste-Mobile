import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Section Divider renders Leading and trailing', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: SectionDivider(
            leading: Text('Leading'),
            trailing: Text('Trailing'),
          ),
        ),
      ),
    );

    final leadingFinder = find.text('Leading');
    expect(leadingFinder, findsOneWidget);

    final trailingFinder = find.text('Trailing');
    expect(trailingFinder, findsOneWidget);
  });
}
