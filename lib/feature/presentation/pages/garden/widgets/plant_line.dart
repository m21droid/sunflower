import 'package:flutter/material.dart';
import 'package:sunflower/feature/domain/entities/plant_entity.dart';
import 'package:sunflower/feature/presentation/pages/garden/widgets/plant_item.dart';

class PlantLine extends StatelessWidget {
  final PlantEntity plant1;
  final PlantEntity? plant2;
  final bool isExtended;

  const PlantLine(
      {Key? key,
      required this.plant1,
      required this.plant2,
      this.isExtended = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstItem = PlantItem(plant1, isExtended: isExtended);
    final plant = plant2;
    final secondItem = (plant == null)
        ? Container()
        : PlantItem(plant, isExtended: isExtended);
    return Row(children: [
      Expanded(flex: 1, child: firstItem),
      const SizedBox(width: 16),
      Expanded(flex: 1, child: secondItem)
    ]);
  }
}
