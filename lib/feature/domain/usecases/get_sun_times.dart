import 'package:sunflower/core/usecases/use_case.dart';
import 'package:sunflower/feature/domain/repositories/weather_repository.dart';

class GetSunTimes extends UseCase<void, void> {
  final WeatherRepository _weatherRepository;

  GetSunTimes(this._weatherRepository);

  @override
  Future<void> call(void input) async {
    return await _weatherRepository.getSunTimes();
  }
}
