import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sunflower/core/error/exception.dart';
import 'package:sunflower/feature/data/datasources/weather/models/sun_times_model.dart';

abstract class WeatherDataSource {
  Future<Either<ServerException, SunTimesModel>> getSunTimes(
      LatLng latLng, DateTime date);
}
