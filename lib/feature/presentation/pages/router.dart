import 'package:flutter/cupertino.dart';
import 'package:sunflower/feature/domain/entities/plant_entity.dart';
import 'package:sunflower/feature/presentation/pages/anim/sun_page.dart';
import 'package:sunflower/feature/presentation/pages/garden/garden_page.dart';
import 'package:sunflower/feature/presentation/pages/plant/plant_page.dart';
import 'package:sunflower/feature/presentation/pages/splash/splash_page.dart';

Route router(RouteSettings settings) {
  switch (settings.name) {
    case GardenPage.routeName:
      return CupertinoPageRoute(builder: (_) => const GardenPage());
    case PlantPage.routeName:
      return CupertinoPageRoute(builder: (_) {
        final plant = settings.arguments as PlantEntity;
        return PlantPage(plant);
      });
    case SunPage.routeName:
      return CupertinoPageRoute(builder: (_) => const SunPage());
    default:
      return CupertinoPageRoute(builder: (_) => const SplashPage());
  }
}
