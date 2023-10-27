import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sunflower/feature/domain/entities/sun_times_entity.dart';

class SunEntity extends Equatable {
  final LatLng latLng;
  final DateTime date;
  final SunTimesEntity sunTimes;

  const SunEntity(
      {required this.latLng, required this.date, required this.sunTimes});

  @override
  List<Object?> get props => [latLng, date];
}
