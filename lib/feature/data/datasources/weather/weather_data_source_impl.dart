import 'package:dartz/dartz.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sunflower/core/error/exception.dart';
import 'package:sunflower/feature/data/datasources/weather/models/sun_response_status.dart';
import 'package:sunflower/feature/data/datasources/weather/models/sun_times_model.dart';
import 'package:sunflower/feature/data/datasources/weather/weather_rest_client.dart';
import 'package:sunflower/feature/data/datasources/weather_data_source.dart';

class WeatherDataSourceImpl extends WeatherDataSource {
  final WeatherRestClient _client;

  WeatherDataSourceImpl(this._client);

  @override
  Future<Either<ServerException, SunTimesModel>> getSunTimes(
      LatLng latLng, DateTime date) async {
    final sunResponse = await _client
        .getSunTimes(latLng.latitude, latLng.longitude,
            DateFormat('yyyy-MM-dd').format(date))
        .catchError((e) {
      // TODO return left(ServerException());
    });
    debugPrint('WeatherDataSourceImpl.getSunTimes: sunResponse - $sunResponse');
    switch (sunResponse.status) {
      case SunResponseStatus.ok:
        final sunTimes = sunResponse.results;
        return (sunTimes == null) ? left(ServerException()) : right(sunTimes);
      default:
        return left(ServerException());
    }
  }
}
