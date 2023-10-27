import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sunflower/core/ext/pair.dart';
import 'package:sunflower/feature/domain/entities/sun_entity.dart';
import 'package:sunflower/feature/domain/usecases/get_sun_times.dart';
import 'package:sunflower/feature/presentation/pages/sun/bloc/sun_state.dart';

class SunBloc extends Cubit<SunState> {
  final GetSunTimes getSunTimes;

  SunBloc({required this.getSunTimes}) : super(SunEmptyState());

  void load(Pair<LatLng, DateTime> pair) async {
    emit(SunLoadingState());
    try {
      final result = await getSunTimes.call(pair);
      result.fold((l) {
        emit(SunFailureState());
      }, (r) {
        final sun = SunEntity(latLng: pair.first, date: pair.last, sunTimes: r);
        emit(SunLoadedState(sun: sun));
      });
    } catch (_) {
      emit(SunFailureState());
    }
  }

  void clear() {
    emit(SunEmptyState());
  }
}
