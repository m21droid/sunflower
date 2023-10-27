import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sunflower/core/error/failure.dart';
import 'package:sunflower/core/ext/pair.dart';
import 'package:sunflower/core/usecases/use_case.dart';
import 'package:sunflower/feature/domain/entities/sun_times_entity.dart';
import 'package:sunflower/feature/domain/repositories/weather_repository.dart';

class GetSunTimes
    extends UseCase<Pair<LatLng, DateTime>, Either<Failure, SunTimesEntity>> {
  final WeatherRepository _weatherRepository;

  GetSunTimes(this._weatherRepository);

  @override
  Future<Either<Failure, SunTimesEntity>> call(
      Pair<LatLng, DateTime> input) async {
    return await _weatherRepository.getSunTimes(input);
  }
}
