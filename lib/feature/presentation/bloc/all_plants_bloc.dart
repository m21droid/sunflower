import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunflower/feature/domain/usecases/get_all_plants.dart';
import 'package:sunflower/feature/presentation/bloc/plants_event.dart';
import 'package:sunflower/feature/presentation/bloc/plants_state.dart';

class AllPlantsBloc extends Bloc<PlantsEvent, PlantsState> {
  final GetAllPlants getAllPlants;

  AllPlantsBloc({required this.getAllPlants}) : super(PlantsEmptyState()) {
    on<PlantsLoadEvent>((event, emit) async {
      emit(PlantsLoadingState());
      try {
        final result = await getAllPlants.call(null);
        result.fold((l) {
          emit(PlantsFailureState());
        }, (r) {
          emit(PlantsLoadedState(plants: r));
        });
      } catch (_) {
        emit(PlantsFailureState());
      }
    });

    on<PlantsClearEvent>((event, emit) {
      emit(PlantsEmptyState());
    });
  }
}
