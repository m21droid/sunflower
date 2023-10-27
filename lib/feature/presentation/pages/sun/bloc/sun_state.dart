import 'package:sunflower/feature/domain/entities/sun_entity.dart';

sealed class SunState {}

class SunLoadingState extends SunState {}

class SunFailureState extends SunState {}

class SunEmptyState extends SunState {}

class SunLoadedState extends SunState {
  SunEntity sun;

  SunLoadedState({required this.sun});
}
