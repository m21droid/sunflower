import 'package:sunflower/feature/domain/entities/plant_entity.dart';

abstract class PlantsState {}

class PlantsLoadingState extends PlantsState {}

class PlantsFailureState extends PlantsState {}

class PlantsEmptyState extends PlantsState {}

class PlantsLoadedState extends PlantsState {
  List<PlantEntity> plants;

  PlantsLoadedState({required this.plants});
}
