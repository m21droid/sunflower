import 'package:flutter/material.dart';
import 'package:sunflower/feature/domain/entities/plant_entity.dart';
import 'package:sunflower/feature/presentation/pages/garden/widgets/plant_line.dart';

class PlantList extends StatelessWidget {
  final List<PlantEntity> _plants;
  final bool isExtended;

  const PlantList(this._plants, {Key? key, this.isExtended = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemCount = _plants.length;
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (contex, index) {
          final i = index + 1;
          if (index % 2 == 0) {
            final key = Key('Line $index');
            final plant1 = _plants[index];
            final plant2 = (i < itemCount) ? _plants[i] : null;
            return PlantLine(
                key: key,
                plant1: plant1,
                plant2: plant2,
                isExtended: isExtended);
          } else {
            final height = (i == itemCount) ? 0.0 : 16.0;
            return SizedBox(height: height);
          }
        },
        itemCount: itemCount);
  }
}
