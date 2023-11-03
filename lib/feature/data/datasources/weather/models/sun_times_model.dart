import 'package:json_annotation/json_annotation.dart';

part 'sun_times_model.g.dart';

@JsonSerializable()
class SunTimesModel {
  @JsonKey(name: 'sunrise')
  final String sunrise;
  @JsonKey(name: 'sunset')
  final String sunset;
  @JsonKey(name: 'solar_noon')
  final String solarNoon;
  @JsonKey(name: 'day_length')
  final int dayLength;
  @JsonKey(name: 'civil_twilight_begin')
  final String civilTwilightBegin;
  @JsonKey(name: 'civil_twilight_end')
  final String civilTwilightEnd;
  @JsonKey(name: 'nautical_twilight_begin')
  final String nauticalTwilightBegin;
  @JsonKey(name: 'nautical_twilight_end')
  final String nauticalTwilightEnd;
  @JsonKey(name: 'astronomical_twilight_begin')
  final String astronomicalTwilightBegin;
  @JsonKey(name: 'astronomical_twilight_end')
  final String astronomicalTwilightEnd;

  const SunTimesModel({
    required this.sunrise,
    required this.sunset,
    required this.solarNoon,
    required this.dayLength,
    required this.civilTwilightBegin,
    required this.civilTwilightEnd,
    required this.nauticalTwilightBegin,
    required this.nauticalTwilightEnd,
    required this.astronomicalTwilightBegin,
    required this.astronomicalTwilightEnd,
  });

  factory SunTimesModel.fromJson(Map<String, dynamic> json) =>
      _$SunTimesModelFromJson(json);

  Map<String, dynamic> toJson() => _$SunTimesModelToJson(this);
}
