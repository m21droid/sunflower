import 'package:dartz/dartz.dart';
import 'package:sunflower/core/error/failure.dart';
import 'package:sunflower/core/usecases/use_case.dart';
import 'package:sunflower/feature/domain/entities/plant_entity.dart';
import 'package:sunflower/feature/domain/repositories/plant_repository.dart';

class GetMyPlants extends UseCase<void, Either<Failure, List<PlantEntity>>> {
  final PlantRepository _plantRepository;

  GetMyPlants(this._plantRepository);

  @override
  Future<Either<Failure, List<PlantEntity>>> call(void input) async {
    return await _plantRepository.getMyPlants();
  }
}
