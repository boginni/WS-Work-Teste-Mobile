import 'package:design_system/atoms/section_divider.dart';
import 'package:design_system/molecules/vertical_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';
import 'package:ws_work_test_mobile/app/ui/modules/home_module/controllers/home_controller.dart';
import 'package:ws_work_test_mobile/app/ui/widgets/listenable_widget.dart';

import 'leads_empty.dart';
import 'leads_vertical_card.dart';

class LeadsSection extends ListenableWidget {
  const LeadsSection({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Listenable get listenable => controller.leadsStore;

  @override
  Widget build(BuildContext context) {
    final store = controller.leadsStore;

    // store.loading = true;
    // store.loading = false;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SectionDivider(
            leading: Text(
              context.appLocalizations.leads,
              style: context.textTheme.titleMedium,
            ),
            trailing: store.hasLeads
                ? FilledButton.icon(
                    style: FilledButton.styleFrom(
                      visualDensity: VisualDensity.compact,
                    ),
                    onPressed: () {
                      controller.syncLeads();
                    },
                    icon: const Icon(Icons.sync),
                    label: Text(context.appLocalizations.sync),
                  )
                : null,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: VerticalCard.size.height,
          child: Visibility(
            visible: store.loading || store.hasLeads,
            replacement: const LeadsEmpty(),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemExtent: VerticalCard.size.width + 8,
              itemCount: store.leadsCount,
              padding: const EdgeInsets.only(left: 16),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Visibility(
                    visible: store.loading,
                    replacement: Builder(
                      builder: (context) {
                        return LeadsVerticalCard(
                          index: index,
                          userLeadEntity: store.leads[index],
                        );
                      },
                    ),
                    child: VerticalCard.skeleton(),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
