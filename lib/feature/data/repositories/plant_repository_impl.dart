import 'package:dartz/dartz.dart';
import 'package:sunflower/core/error/failure.dart';
import 'package:sunflower/feature/data/datasources/plant_local_data_source.dart';
import 'package:sunflower/feature/data/datasources/plant_remote_data_source.dart';
import 'package:sunflower/feature/data/repositories/mappers/mapper_from_entity.dart';
import 'package:sunflower/feature/data/repositories/mappers/mapper_to_entity.dart';
import 'package:sunflower/feature/domain/entities/plant_entity.dart';
import 'package:sunflower/feature/domain/repositories/plant_repository.dart';

class PlantRepositoryImpl extends PlantRepository {
  final PlantLocalDataSource _plantLocalDataSource;
  final PlantRemoteDataSource _plantRemoteDataSource;

  PlantRepositoryImpl(this._plantLocalDataSource, this._plantRemoteDataSource);

  @override
  Future<Either<Failure, List<PlantEntity>>> getAllPlants() async {
    final either = await _plantRemoteDataSource.getAllPlants();
    return either.fold((l) => left(ServerFailure()), (r) {
      final plants = r.map((plant) => plant.toEntity()).toList();
      return right(plants);
    });
  }

  @override
  Future<Either<Failure, List<PlantEntity>>> getMyPlants() async {
    final either = await _plantLocalDataSource.getMyPlants();
    final plants = either.map((plant) => plant.toEntity()).toList();
    return right(plants);
  }

  @override
  Future<void> saveMyPlants(PlantEntity plant) async {
    return _plantLocalDataSource.saveMyPlant(plant.toDTO());
  }

  @override
  Future<void> deleteMyPlants(PlantEntity plant) async {
    return _plantLocalDataSource.deleteMyPlant(plant.toDTO());
  }
}
