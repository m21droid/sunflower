import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunflower/feature/domain/usecases/get_my_plants.dart';
import 'package:sunflower/feature/presentation/bloc/plants_event.dart';
import 'package:sunflower/feature/presentation/bloc/plants_state.dart';

class MyPlantsBloc extends Bloc<PlantsEvent, PlantsState> {
  final GetMyPlants getMyPlants;

  MyPlantsBloc({required this.getMyPlants}) : super(PlantsEmptyState()) {
    on<PlantsLoadEvent>((event, emit) async {
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
    });

    on<PlantsClearEvent>((event, emit) {
      emit(PlantsEmptyState());
    });
  }
}
