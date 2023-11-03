import 'package:equatable/equatable.dart';

class SunTimesEntity extends Equatable {
  final DateTime sunrise;
  final DateTime sunset;

  const SunTimesEntity({
    required this.sunrise,
    required this.sunset,
  });

  @override
  List<Object?> get props => [sunrise, sunset];
}
