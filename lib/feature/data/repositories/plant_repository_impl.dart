import 'package:dartz/dartz.dart';
import 'package:sunflower/core/error/failure.dart';
import 'package:sunflower/feature/data/datasources/plant_remote_data_source.dart';
import 'package:sunflower/feature/domain/entities/plant_entity.dart';
import 'package:sunflower/feature/domain/repositories/plant_repository.dart';

class PlantRepositoryImpl extends PlantRepository {
  final PlantRemoteDataSource _plantRemoteDataSource;

  PlantRepositoryImpl(this._plantRemoteDataSource);

  @override
  Future<Either<Failure, List<PlantEntity>>> getAllPlants() async {
    final either = await _plantRemoteDataSource.getAllPlants();
    return either.fold((l) => left(ServerFailure()), (r) {
      final plants = r.map((plant) => plant.toEntity()).toList();
      return right(plants);
    });
  }

  @override
  Future<Either<Failure, List<PlantEntity>>> getMyPlants() {
    // TODO: implement getMyPlants
    throw UnimplementedError();
  }

  @override
  Future<void> saveMyPlants() {
    // TODO: implement saveMyPlants
    throw UnimplementedError();
  }

  @override
  Future<void> deleteMyPlants() {
    // TODO: implement deleteMyPlants
    throw UnimplementedError();
  }
}
