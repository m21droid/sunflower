// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sun_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SunResponseModel _$SunResponseModelFromJson(Map<String, dynamic> json) =>
    SunResponseModel(
      results: json['results'] == null
          ? null
          : SunTimesModel.fromJson(json['results'] as Map<String, dynamic>),
      status: json['status'] as String,
    );

Map<String, dynamic> _$SunResponseModelToJson(SunResponseModel instance) =>
    <String, dynamic>{
      'results': instance.results,
      'status': instance.status,
    };
