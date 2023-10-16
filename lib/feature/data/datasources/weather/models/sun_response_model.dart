import 'package:sunflower/feature/data/datasources/weather/models/sun_times_model.dart';

class SunResponseModel {
  final SunTimesModel? results;
  final String status;

  SunResponseModel({required this.results, required this.status});

  factory SunResponseModel.fromJson(Map<String, dynamic> json) {
    final results = json["results"];
    return SunResponseModel(
      results: results == null ? null : SunTimesModel.fromJson(results),
      status: json["status"] ?? "",
    );
  }
}
