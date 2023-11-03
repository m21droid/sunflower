// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sun_times_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SunTimesModel _$SunTimesModelFromJson(Map<String, dynamic> json) =>
    SunTimesModel(
      sunrise: json['sunrise'] as String,
      sunset: json['sunset'] as String,
      solarNoon: json['solar_noon'] as String,
      dayLength: json['day_length'] as int,
      civilTwilightBegin: json['civil_twilight_begin'] as String,
      civilTwilightEnd: json['civil_twilight_end'] as String,
      nauticalTwilightBegin: json['nautical_twilight_begin'] as String,
      nauticalTwilightEnd: json['nautical_twilight_end'] as String,
      astronomicalTwilightBegin: json['astronomical_twilight_begin'] as String,
      astronomicalTwilightEnd: json['astronomical_twilight_end'] as String,
    );

Map<String, dynamic> _$SunTimesModelToJson(SunTimesModel instance) =>
    <String, dynamic>{
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'solar_noon': instance.solarNoon,
      'day_length': instance.dayLength,
      'civil_twilight_begin': instance.civilTwilightBegin,
      'civil_twilight_end': instance.civilTwilightEnd,
      'nautical_twilight_begin': instance.nauticalTwilightBegin,
      'nautical_twilight_end': instance.nauticalTwilightEnd,
      'astronomical_twilight_begin': instance.astronomicalTwilightBegin,
      'astronomical_twilight_end': instance.astronomicalTwilightEnd,
    };
