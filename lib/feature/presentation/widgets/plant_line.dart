import 'package:flutter/material.dart';
import 'package:sunflower/feature/domain/entities/plant_entity.dart';
import 'package:sunflower/feature/presentation/widgets/plant_item.dart';

class PlantLine extends StatelessWidget {
  final PlantEntity plant1;
  final PlantEntity? plant2;

  const PlantLine({Key? key, required this.plant1, required this.plant2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstItem = PlantItem(plant: plant1);
    final plant = plant2;
    final secondItem = (plant == null) ? Container() : PlantItem(plant: plant);
    return Row(children: [
      Expanded(flex: 1, child: firstItem),
      const SizedBox(width: 16),
      Expanded(flex: 1, child: secondItem)
    ]);
  }
}
