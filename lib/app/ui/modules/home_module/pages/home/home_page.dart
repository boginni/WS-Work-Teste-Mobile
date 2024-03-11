import 'package:design_system/atoms/section_divider.dart';
import 'package:design_system/molecules/big_vertical_card.dart';
import 'package:design_system/molecules/vertical_card.dart';
import 'package:flutter/material.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';
import 'package:ws_work_test_mobile/app/ui/modules/home_module/home_controller.dart';
import 'package:ws_work_test_mobile/app/ui/modules/home_module/widgets/category_vertical_card.dart';
import 'package:ws_work_test_mobile/app/ui/modules/home_module/widgets/vehicle_big_vertical_card.dart';

class HomeWire extends StatefulWidget {
  const HomeWire({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  State<HomeWire> createState() => _HomeWireState();
}

class _HomeWireState extends State<HomeWire> {
  HomeController get controller => widget.homeController;

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Welcome back!',
                  style: context.textTheme.titleLarge,
                ),
                // say to enjoy the app in a fancy way
                const Text('Enjoy the app in a fancy way!'),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SectionDivider(
                  leading: Text(
                    'Categories',
                    style: context.textTheme.titleMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: VerticalCard.size.height,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemExtent: VerticalCard.size.width + 16,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: CategoryVerticalCard(
                    index: index,
                    skeleton: true,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SectionDivider(
              leading: Text(
                'Featured',
                style: context.textTheme.titleMedium,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ListenableBuilder(
            listenable: controller.store,
            builder: (context, child) {
              final store = controller.store;

              return ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                physics: const NeverScrollableScrollPhysics(),
                itemExtent: BigVerticalCard.height + 16,
                itemCount: store.vehiclesCount,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: store.loading
                        ? BigVerticalCard.skeleton()
                        : VehicleBigVerticalCard(
                            vehicle: store.vehicles[index],
                            onPressed: () {
                              controller.leadVehicle(store.vehicles[index]);
                            },
                          ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
