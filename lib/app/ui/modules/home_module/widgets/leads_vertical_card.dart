import 'package:design_system/molecules/vertical_card.dart';
import 'package:flutter/material.dart';
import 'package:ws_work_test_mobile/app/domain/dto/entities/user/user_lead_entity.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';

class LeadsVerticalCard extends StatelessWidget {
  const LeadsVerticalCard({
    super.key,
    required this.index,
    required this.userLeadEntity,
  });

  final int index;
  final UserLeadEntity userLeadEntity;

  @override
  Widget build(BuildContext context) {
    return VerticalCard(
      imageBackgroundColor: context.colorScheme.primaryContainer,
      imageProvider: const AssetImage('assets/default.png'),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userLeadEntity.vehicleName,
                      style: context.textTheme.titleMedium,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'R\$: ',
                          style: context.textTheme.labelSmall,
                        ),
                        TextSpan(
                          text: userLeadEntity.vehiclePrice.toStringAsFixed(2),
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.colorScheme.primary,
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 4,
            right: 4,
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
          ),
        ],
      ),
    );
  }
}
