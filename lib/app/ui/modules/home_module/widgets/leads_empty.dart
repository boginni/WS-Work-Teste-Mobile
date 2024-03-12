import 'package:design_system/molecules/vertical_card.dart';
import 'package:flutter/material.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';

class LeadsEmpty extends StatelessWidget {
  const LeadsEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.search,
            size: 16 * 6,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            context.appLocalizations.no_leads_yet,
            style: context.textTheme.titleLarge,
          ),
          Text(
            context.appLocalizations.click_in_the_i_wish_button_inside_the_vehicle_card_to_add_a_lead,
            style: context.textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
