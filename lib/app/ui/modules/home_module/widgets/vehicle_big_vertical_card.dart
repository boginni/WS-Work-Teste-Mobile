import 'package:design_system/molecules/big_vertical_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ws_work_test_mobile/app/domain/dto/entities/vehicle/vehicle_entity.dart';

class VehicleBigVerticalCard extends StatelessWidget {
  const VehicleBigVerticalCard({super.key, required this.vehicle});

  final VehicleEntity vehicle;

  @override
  Widget build(BuildContext context) {
    return BigVerticalCard(
      imageBackgroundColor: Colors.red,
      child: Column(
        children: [
          Text(vehicle.nomeModelo),
          Text(vehicle.ano.toString()),
          Text(vehicle.combustivel),
          Text(vehicle.numPortas.toString()),
          Text(vehicle.cor),
          Text(vehicle.valor.toString()),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16).copyWith(top: 0),
            child: Row(
              children: [
                const Icon(Icons.favorite),
                const SizedBox(width: 8),
                const Icon(Icons.share),
              ],
            ),
          )
        ],
      ),
    );
  }
}
