import 'package:design_system/molecules/vertical_card.dart';
import 'package:flutter/material.dart';
import 'package:ws_work_test_mobile/app/domain/dto/entities/user/user_lead_entity.dart';

class LeadsVerticalCard extends StatelessWidget {
  const LeadsVerticalCard({
    super.key,
    required this.index,
    this.userLeadEntity,
  });

  final int index;
  final UserLeadEntity? userLeadEntity;

  @override
  Widget build(BuildContext context) {
    return VerticalCard(
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
