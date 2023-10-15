import 'package:flutter/cupertino.dart';
import 'package:sunflower/core/pair.dart';
import 'package:sunflower/feature/domain/entities/plant_entity.dart';
import 'package:sunflower/feature/presentation/pages/garden/garden_page.dart';
import 'package:sunflower/feature/presentation/pages/plant/plant_page.dart';

Route router(RouteSettings settings) {
  switch (settings.name) {
    case PlantPage.routeName:
      return CupertinoPageRoute(builder: (_) {
        final pair = settings.arguments as Pair<PlantEntity, bool>;
        return PlantPage(pair.first, isAdd: pair.last);
      });
    default:
      return CupertinoPageRoute(builder: (_) => const GardenPage());
  }
}
