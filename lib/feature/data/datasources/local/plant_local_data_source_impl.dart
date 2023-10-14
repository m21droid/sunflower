import 'package:flutter/foundation.dart';
import 'package:sunflower/feature/data/datasources/local/database.dart';
import 'package:sunflower/feature/data/datasources/local/dto/plant_dto.dart';
import 'package:sunflower/feature/data/datasources/plant_local_data_source.dart';

class PlantLocalDataSourceImpl extends PlantLocalDataSource {
  final AppDatabase _appDatabase;

  PlantLocalDataSourceImpl(this._appDatabase);

  @override
  Future<List<PlantDTO>> getMyPlants() async {
    final plants = _appDatabase.plantDao.getAllPlants();
    debugPrint('PlantFloorDataSource.getMyPlants: plants - $plants');
    return plants;
  }

  @override
  Future<void> saveMyPlant(PlantDTO plant) async {
    return _appDatabase.plantDao.insertPlant(plant);
  }

  @override
  Future<void> deleteMyPlant(PlantDTO plant) async {
    return _appDatabase.plantDao.deletePlant(plant);
  }
}
