import 'package:sunflower/feature/data/datasources/weather_data_source.dart';
import 'package:sunflower/feature/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherDataSource _weatherDataSource;

  WeatherRepositoryImpl(this._weatherDataSource);

  @override
  Future<void> getSunTimes() async {
    return await _weatherDataSource.getSunTimes();
  }
}
