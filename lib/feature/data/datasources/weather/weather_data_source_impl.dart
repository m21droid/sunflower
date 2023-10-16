import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:sunflower/feature/data/datasources/weather/models/sun_response_model.dart';
import 'package:sunflower/feature/data/datasources/weather_data_source.dart';

class WeatherDataSourceImpl extends WeatherDataSource {
  final Dio _dio;

  WeatherDataSourceImpl(this._dio);

  @override
  Future<void> getSunTimes() async {
    final response = await _dio.get(
        'https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400');
    debugPrint('WeatherDataSourceImpl.getSunTimes: response - $response');
    final statusCode = response.statusCode;
    debugPrint('WeatherDataSourceImpl.getSunTimes: statusCode - $statusCode');
    final data = response.data;
    debugPrint('WeatherDataSourceImpl.getSunTimes: data - $data');
    if (response.statusCode == 200) {
      final sun = SunResponseModel.fromJson(data);
      debugPrint('WeatherDataSourceImpl.getSunTimes: sun - $sun');
    }
  }
}
