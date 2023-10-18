import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sunflower/feature/data/datasources/local/database.dart';
import 'package:sunflower/feature/data/datasources/local/plant_local_data_source_impl.dart';
import 'package:sunflower/feature/data/datasources/plant_local_data_source.dart';
import 'package:sunflower/feature/data/datasources/plant_remote_data_source.dart';
import 'package:sunflower/feature/data/datasources/remote/plant_remote_data_source_impl.dart';
import 'package:sunflower/feature/data/datasources/weather/weather_data_source_impl.dart';
import 'package:sunflower/feature/data/datasources/weather_data_source.dart';
import 'package:sunflower/feature/data/repositories/plant_repository_impl.dart';
import 'package:sunflower/feature/data/repositories/weather_repository_impl.dart';
import 'package:sunflower/feature/domain/repositories/plant_repository.dart';
import 'package:sunflower/feature/domain/repositories/weather_repository.dart';
import 'package:sunflower/feature/domain/usecases/delete_my_plant.dart';
import 'package:sunflower/feature/domain/usecases/get_all_plants.dart';
import 'package:sunflower/feature/domain/usecases/get_my_plants.dart';
import 'package:sunflower/feature/domain/usecases/get_sun_times.dart';
import 'package:sunflower/feature/domain/usecases/save_my_plant.dart';

// Dependency injection

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  // Plants --------------------------------------------------------------------

  final database =
      await $FloorAppDatabase.databaseBuilder("app_database.db").build();
  locator.registerSingleton<AppDatabase>(database);

  locator.registerSingleton<PlantLocalDataSource>(
      PlantLocalDataSourceImpl(locator<AppDatabase>()));

  locator.registerSingleton<PlantRemoteDataSource>(PlantRemoteDataSourceImpl());

  locator.registerSingleton<PlantRepository>(PlantRepositoryImpl(
      locator<PlantLocalDataSource>(), locator<PlantRemoteDataSource>()));

  locator.registerSingleton<GetAllPlants>(
      GetAllPlants(locator<PlantRepository>()));

  locator
      .registerSingleton<GetMyPlants>(GetMyPlants(locator<PlantRepository>()));

  locator
      .registerSingleton<SaveMyPlant>(SaveMyPlant(locator<PlantRepository>()));

  locator.registerSingleton<DeleteMyPlant>(
      DeleteMyPlant(locator<PlantRepository>()));

  // Weather -------------------------------------------------------------------

  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());
  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<WeatherDataSource>(
      WeatherDataSourceImpl(locator<Dio>()));

  locator.registerSingleton<WeatherRepository>(
      WeatherRepositoryImpl(locator<WeatherDataSource>()));

  locator.registerSingleton<GetSunTimes>(
      GetSunTimes(locator<WeatherRepository>()));
}
