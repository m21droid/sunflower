import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sunflower/core/error/failure.dart';
import 'package:sunflower/core/ext/pair.dart';
import 'package:sunflower/feature/domain/entities/sun_times_entity.dart';

abstract class WeatherRepository {
  Future<Either<Failure, SunTimesEntity>> getSunTimes(
      Pair<LatLng, DateTime> pair);
}
