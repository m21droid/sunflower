import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sunflower/core/error/failure.dart';
import 'package:sunflower/core/ext/pair.dart';
import 'package:sunflower/feature/data/datasources/weather_data_source.dart';
import 'package:sunflower/feature/data/repositories/mappers/mapper_to_entity.dart';
import 'package:sunflower/feature/domain/entities/sun_times_entity.dart';
import 'package:sunflower/feature/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherDataSource _weatherDataSource;

  WeatherRepositoryImpl(this._weatherDataSource);

  @override
  Future<Either<Failure, SunTimesEntity>> getSunTimes(
      Pair<LatLng, DateTime> pair) async {
    final either = await _weatherDataSource.getSunTimes(pair.first, pair.last);
    return either.fold(
        (l) => left(ServerFailure()), (r) => right(r.toEntity()));
  }
}
