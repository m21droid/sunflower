import 'package:get_it/get_it.dart';
import 'package:sunflower/feature/data/datasources/local/database.dart';
import 'package:sunflower/feature/data/datasources/local/plant_local_data_source_impl.dart';
import 'package:sunflower/feature/data/datasources/plant_local_data_source.dart';
import 'package:sunflower/feature/data/datasources/plant_remote_data_source.dart';
import 'package:sunflower/feature/data/datasources/remote/plant_remote_data_source_impl.dart';
import 'package:sunflower/feature/data/repositories/plant_repository_impl.dart';
import 'package:sunflower/feature/domain/repositories/plant_repository.dart';
import 'package:sunflower/feature/domain/usecases/get_all_plants.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder("app_database.db").build();
  locator.registerSingleton<AppDatabase>(database);

  locator.registerSingleton<PlantLocalDataSource>(
      PlantLocalDataSourceImpl(locator<AppDatabase>()));

  locator.registerSingleton<PlantRemoteDataSource>(PlantRemoteDataSourceImpl());

  locator.registerSingleton<PlantRepository>(
      PlantRepositoryImpl(locator<PlantRemoteDataSource>()));

  locator.registerSingleton<GetAllPlants>(
      GetAllPlants(locator<PlantRepository>()));
}
