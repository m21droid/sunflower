import 'package:sunflower/feature/data/datasources/local/dto/plant_dto.dart';
import 'package:sunflower/feature/data/datasources/remote/models/plant_model.dart';
import 'package:sunflower/feature/data/datasources/weather/models/sun_times_model.dart';
import 'package:sunflower/feature/domain/entities/plant_entity.dart';
import 'package:sunflower/feature/domain/entities/sun_times_entity.dart';

extension AppPlantDTO on PlantDTO {
  PlantEntity toEntity() {
    return PlantEntity(
        plantId: plantId,
        name: name,
        description: description,
        growZoneNumber: growZoneNumber,
        wateringInterval: wateringInterval,
        imageUrl: imageUrl);
  }
}

extension AppPlantModel on PlantModel {
  PlantEntity toEntity() {
    return PlantEntity(
        plantId: plantId,
        name: name,
        description: description,
        growZoneNumber: growZoneNumber,
        wateringInterval: wateringInterval,
        imageUrl: imageUrl);
  }
}

extension AppSunTimesModel on SunTimesModel {
  SunTimesEntity toEntity() {
    return SunTimesEntity(sunrise: sunrise, sunset: sunset);
  }
}
