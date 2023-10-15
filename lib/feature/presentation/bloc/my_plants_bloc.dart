import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunflower/feature/domain/entities/plant_entity.dart';
import 'package:sunflower/feature/domain/usecases/get_my_plants.dart';
import 'package:sunflower/feature/presentation/bloc/plants_state.dart';

class MyPlantsBloc extends Cubit<PlantsState> {
  final GetMyPlants getMyPlants;

  MyPlantsBloc({required this.getMyPlants}) : super(PlantsEmptyState());

  void load() async {
    emit(PlantsLoadingState());
    try {
      final result = await getMyPlants.call(null);
      result.fold((l) {
        emit(PlantsFailureState());
      }, (r) {
        if (r.isEmpty) {
          emit(PlantsEmptyState());
        } else {
          emit(PlantsLoadedState(plants: r));
        }
      });
    } catch (_) {
      emit(PlantsFailureState());
    }
  }

  void addPlant(PlantEntity plant) {
    if (state is PlantsLoadedState) {
      final plants = (state as PlantsLoadedState).plants;
      if (!plants.contains(plant)) {
        plants.add(plant);
        emit(PlantsLoadedState(plants: plants));
      }
    } else {
      if (state is PlantsEmptyState) {
        emit(PlantsLoadedState(plants: [plant]));
      }
    }
  }

  void removePlant(PlantEntity plant) {
    if (state is PlantsLoadedState) {
      final plants = (state as PlantsLoadedState).plants;
      if (plants.contains(plant)) {
        plants.remove(plant);
        if (plants.isEmpty) {
          emit(PlantsEmptyState());
        } else {
          emit(PlantsLoadedState(plants: plants));
        }
      }
    }
  }

  void clear() {
    emit(PlantsEmptyState());
  }
}
