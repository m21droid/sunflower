import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sunflower/core/ext/pair.dart';
import 'package:sunflower/core/locator.dart';
import 'package:sunflower/feature/domain/entities/plant_entity.dart';
import 'package:sunflower/feature/domain/usecases/get_sun_times.dart';
import 'package:sunflower/feature/presentation/pages/garden/garden_page.dart';
import 'package:sunflower/feature/presentation/pages/map/map_page.dart';
import 'package:sunflower/feature/presentation/pages/plant/plant_page.dart';
import 'package:sunflower/feature/presentation/pages/splash/splash_page.dart';
import 'package:sunflower/feature/presentation/pages/sun/bloc/sun_bloc.dart';
import 'package:sunflower/feature/presentation/pages/sun/sun_page.dart';

Route router(RouteSettings settings) {
  switch (settings.name) {
    case GardenPage.routeName:
      return CupertinoPageRoute(builder: (_) => const GardenPage());
    case MapPage.routeName:
      return CupertinoPageRoute(builder: (_) => const MapPage());
    case PlantPage.routeName:
      final plant = settings.arguments as PlantEntity;
      return CupertinoPageRoute(builder: (_) => PlantPage(plant));
    case SunPage.routeName:
      final pair = settings.arguments as Pair<LatLng, DateTime>;
      return CupertinoPageRoute(
        builder: (_) => BlocProvider(
          create: (context) =>
              SunBloc(getSunTimes: locator<GetSunTimes>())..load(pair),
          child: const SunPage(),
        ),
      );
    default:
      return CupertinoPageRoute(builder: (_) => const SplashPage());
  }
}
