import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sunflower/feature/data/datasources/weather/models/sun_response_model.dart';

part 'weather_rest_client.g.dart';

@RestApi(baseUrl: 'https://api.sunrise-sunset.org/')
abstract class WeatherRestClient {
  factory WeatherRestClient(Dio dio, {String baseUrl}) = _WeatherRestClient;

  @GET('/json')
  Future<SunResponseModel> getSunTimes(
    @Query('lat') double lat,
    @Query('lng') double lng,
    @Query('date') String date,
  );
}
