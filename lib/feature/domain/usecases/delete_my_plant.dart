import 'package:sunflower/core/usecases/use_case.dart';
import 'package:sunflower/feature/domain/entities/plant_entity.dart';
import 'package:sunflower/feature/domain/repositories/plant_repository.dart';

class DeleteMyPlant extends UseCase<PlantEntity, void> {
  final PlantRepository _plantRepository;

  DeleteMyPlant(this._plantRepository);

  @override
  Future<void> call(PlantEntity input) async {
    return await _plantRepository.deleteMyPlants(input);
  }
}
