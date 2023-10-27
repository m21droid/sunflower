import 'package:json_annotation/json_annotation.dart';
import 'package:sunflower/feature/data/datasources/weather/models/sun_times_model.dart';

part 'sun_response_model.g.dart';

@JsonSerializable()
class SunResponseModel {
  final SunTimesModel? results;
  final String status;

  SunResponseModel({required this.results, required this.status});

  factory SunResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SunResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SunResponseModelToJson(this);
}
