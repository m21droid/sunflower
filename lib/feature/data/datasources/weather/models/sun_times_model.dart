import 'package:json_annotation/json_annotation.dart';

part 'sun_times_model.g.dart';

@JsonSerializable()
class SunTimesModel {
  final String sunrise;
  final String sunset;
  final String solar_noon;
  final String day_length;
  final String civil_twilight_begin;
  final String civil_twilight_end;
  final String nautical_twilight_begin;
  final String nautical_twilight_end;
  final String astronomical_twilight_begin;
  final String astronomical_twilight_end;

  const SunTimesModel({
    required this.sunrise,
    required this.sunset,
    required this.solar_noon,
    required this.day_length,
    required this.civil_twilight_begin,
    required this.civil_twilight_end,
    required this.nautical_twilight_begin,
    required this.nautical_twilight_end,
    required this.astronomical_twilight_begin,
    required this.astronomical_twilight_end,
  });

  factory SunTimesModel.fromJson(Map<String, dynamic> json) =>
      _$SunTimesModelFromJson(json);

  Map<String, dynamic> toJson() => _$SunTimesModelToJson(this);
}
