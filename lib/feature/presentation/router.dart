import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunflower/feature/domain/entities/plant_entity.dart';
import 'package:sunflower/feature/presentation/pages/garden_page.dart';
import 'package:sunflower/feature/presentation/pages/plant/plant_page.dart';

Route router(RouteSettings settings) {
  switch (settings.name) {
    case PlantPage.routeName:
      return CupertinoPageRoute(
          builder: (_) => PlantPage(settings.arguments as PlantEntity));
    default:
      return CupertinoPageRoute(builder: (_) => const GardenPage());
  }
}
