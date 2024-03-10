import 'package:design_system/molecules/vertical_card.dart';
import 'package:flutter/material.dart';

class CategoryVerticalCard extends StatelessWidget {
  const CategoryVerticalCard({
    super.key,
    required this.index,
    required this.skeleton,
  });

  final int index;
  final bool skeleton;

  @override
  Widget build(BuildContext context) {
    return VerticalCard(
      skeleton: skeleton,
      imageBackgroundColor: Colors.red,
      imageProvider: const NetworkImage('https://via.placeholder.com/160x160'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text('Category $index'),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                  ),
                  child: const Text('View'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
