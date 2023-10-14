import 'package:floor/floor.dart';
import 'package:sunflower/feature/data/datasources/local/dto/plant_dto.dart';

@dao
abstract class PlantDao {
  @Query('SELECT * FROM PlantDTO')
  Future<List<PlantDTO>> getAllPlants();

  @insert
  Future<void> insertPlant(PlantDTO plant);

  @delete
  Future<void> deletePlant(PlantDTO plant);
}
