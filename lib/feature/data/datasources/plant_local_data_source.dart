import 'package:sunflower/feature/data/datasources/local/dto/plant_dto.dart';

abstract class PlantLocalDataSource {
  Future<List<PlantDTO>> getMyPlants();

  Future<void> saveMyPlant(PlantDTO plant);

  Future<void> deleteMyPlant(PlantDTO plant);
}
