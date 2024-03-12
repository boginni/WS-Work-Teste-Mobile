import 'package:design_system/atoms/chip.dart';
import 'package:design_system/molecules/big_vertical_card.dart';
import 'package:flutter/material.dart';
import 'package:ws_work_test_mobile/app/domain/dto/entities/vehicle/vehicle_entity.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';

class VehicleBigVerticalCard extends StatelessWidget {
  const VehicleBigVerticalCard({super.key, required this.vehicle, this.onPressed});

  final VehicleEntity vehicle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BigVerticalCard(
          imageBackgroundColor: context.colorScheme.primaryContainer,
          imageProvider: const AssetImage('assets/vehicle-none.png'),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          vehicle.nomeModelo,
                          style: context.textTheme.titleLarge,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              color: context.colorScheme.primary,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              '${vehicle.ano} - ${vehicle.cor}',
                            ),
                          ],
                        ),
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'R\$',
                        style: context.textTheme.titleSmall,
                        children: [
                          TextSpan(
                            text: vehicle.valor.toStringAsFixed(2),
                            style: context.textTheme.titleLarge?.copyWith(
                              color: context.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    SmallChip(
                      label: Text(
                        vehicle.combustivel,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.colorScheme.onPrimary,
                        ),
                      ),
                      backgroundColor: context.colorScheme.primary,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SmallChip(
                      label: Text(
                        context.appLocalizations.doors_x(vehicle.numPortas),
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.colorScheme.onPrimary,
                        ),
                      ),
                      backgroundColor: context.colorScheme.primary,
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16).copyWith(top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FilledButton(
                        onPressed: onPressed,
                        child: Text(context.appLocalizations.i_wish),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 8,
          top: 8,
          child: Material(
            shape: const CircleBorder(),
            color: context.colorScheme.surfaceVariant,
            child: IconButton(
              color: context.colorScheme.primary,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
              ),
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            ),
          ),
        ),
      ],
    );
  }
}
