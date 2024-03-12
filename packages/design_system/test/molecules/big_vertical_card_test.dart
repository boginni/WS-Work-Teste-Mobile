import 'package:design_system/src/molecules/big_vertical_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skeletons/skeletons.dart';

void main() {
  testWidgets('BigVerticalCard renders all it\' mandatory elements', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BigVerticalCard(
          imageBackgroundColor: Colors.red,
          child: Text('Test Child'),
        ),
      ),
    );

    final childText = find.text('Test Child');
    expect(childText, findsOneWidget);

    final bigVerticalCardFinder = find.byType(BigVerticalCard);
    final bigVerticalCard = tester.widget<BigVerticalCard>(bigVerticalCardFinder);

    expect(bigVerticalCard.imageBackgroundColor, Colors.red);

  });

  testWidgets('SkeletonBigVerticalCard renders a skeleton lines', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BigVerticalCard.skeleton(),
      ),
    );

    final skeletonLines = find.byType(SkeletonLine);
    expect(skeletonLines, findsWidgets);
  });
}
