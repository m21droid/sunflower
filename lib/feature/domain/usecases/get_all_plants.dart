import 'package:dartz/dartz.dart';
import 'package:sunflower/core/error/failure.dart';
import 'package:sunflower/core/usecases/use_case.dart';
import 'package:sunflower/feature/domain/entities/plant_entity.dart';
import 'package:sunflower/feature/domain/repositories/plant_repository.dart';

class GetAllPlants extends UseCase<void, List<PlantEntity>> {
  final PlantRepository plantRepository;

  GetAllPlants(this.plantRepository);

  @override
  Future<Either<Failure, List<PlantEntity>>> call(void input) async {
    return await plantRepository.getAllPlants();
  }
}
