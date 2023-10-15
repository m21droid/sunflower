import 'package:sunflower/feature/data/datasources/local/dto/plant_dto.dart';
import 'package:sunflower/feature/data/datasources/remote/models/plant_model.dart';
import 'package:sunflower/feature/domain/entities/plant_entity.dart';

extension AppPlantEntity on PlantEntity {
  PlantDTO toDTO() {
    return PlantDTO(
        plantId: plantId,
        name: name,
        description: description,
        growZoneNumber: growZoneNumber,
        wateringInterval: wateringInterval,
        imageUrl: imageUrl);
  }

  PlantModel toModel() {
    return PlantModel(
        plantId: plantId,
        name: name,
        description: description,
        growZoneNumber: growZoneNumber,
        wateringInterval: wateringInterval,
        imageUrl: imageUrl);
  }
}
