import 'package:design_system/atoms/section_divider.dart';
import 'package:design_system/molecules/big_vertical_card.dart';
import 'package:design_system/molecules/vertical_card.dart';
import 'package:flutter/material.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';
import 'package:ws_work_test_mobile/app/ui/modules/home_module/widgets/category_vertical_card.dart';
import 'package:ws_work_test_mobile/app/ui/modules/home_module/widgets/vehicle_big_vertical_card.dart';

import '../../../domain/dto/entities/vehicle/vehicle_entity.dart';
import '../../../domain/repositories/vehicle_repository.dart';

class HomeWire extends StatefulWidget {
  const HomeWire({super.key, required this.vehicleRepository});

  final VehicleRepository vehicleRepository;

  @override
  State<HomeWire> createState() => _HomeWireState();
}

class _HomeWireState extends State<HomeWire> {
  bool isLoading = true;

  List<VehicleEntity> vehicles = [];

  @override
  void initState() {
    super.initState();
    widget.vehicleRepository.index().then((value) {
      setState(() {
        vehicles = value;
        isLoading = false;
      });
    });
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
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            physics: const NeverScrollableScrollPhysics(),
            itemExtent: BigVerticalCard.height + 16,
            itemCount: isLoading ? 3 : vehicles.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: isLoading
                    ? BigVerticalCard.skeleton()
                    : VehicleBigVerticalCard(
                        vehicle: vehicles[index],
                        onPressed: () {

                        },
                      ),
              );
            },
          )
        ],
      ),
    );
  }
}
