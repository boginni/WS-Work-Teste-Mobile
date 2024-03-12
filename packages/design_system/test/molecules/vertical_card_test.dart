import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skeletons/skeletons.dart';

void main() {
  testWidgets(
    'VerticalCard renders all it\' mandatory elements',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: VerticalCard(
            imageBackgroundColor: Colors.red,
            child: Text('Test Child'),
          ),
        ),
      );

      final childText = find.text('Test Child');
      expect(childText, findsOneWidget);

      final verticalCardFinder = find.byType(VerticalCard);
      final verticalCard = tester.widget<VerticalCard>(verticalCardFinder);

      expect(verticalCard.imageBackgroundColor, Colors.red);
    },
  );

  testWidgets(
    'VerticalCard renders a skeleton lines',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: VerticalCard.skeleton(),
        ),
      );

      final skeletonLines = find.byType(SkeletonLine);
      expect(skeletonLines, findsWidgets);
    },
  );
}
