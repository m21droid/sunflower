import 'package:dartz/dartz.dart';
import 'package:sunflower/core/error/failure.dart';
import 'package:sunflower/feature/domain/entities/plant_entity.dart';

abstract class PlantRepository {
  Future<Either<Failure, List<PlantEntity>>> getAllPlants();

  Future<Either<Failure, List<PlantEntity>>> getMyPlants();

  Future<void> saveMyPlants(PlantEntity plant);

  Future<void> deleteMyPlants(PlantEntity plant);
}
