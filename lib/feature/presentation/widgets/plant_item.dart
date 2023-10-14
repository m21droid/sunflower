import 'package:flutter/material.dart';
import 'package:sunflower/feature/domain/entities/plant_entity.dart';

class PlantItem extends StatelessWidget {
  final PlantEntity plant;

  const PlantItem({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 112, alignment: Alignment.center, child: Text(plant.name));
  }
}
