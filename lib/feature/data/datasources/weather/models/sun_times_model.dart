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

  SunTimesModel(
      {required this.sunrise,
      required this.sunset,
      required this.solar_noon,
      required this.day_length,
      required this.civil_twilight_begin,
      required this.civil_twilight_end,
      required this.nautical_twilight_begin,
      required this.nautical_twilight_end,
      required this.astronomical_twilight_begin,
      required this.astronomical_twilight_end});

  factory SunTimesModel.fromJson(Map<String, dynamic> json) {
    return SunTimesModel(
      sunrise: json["sunrise"] ?? "",
      sunset: json["sunset"] ?? "",
      solar_noon: json["solar_noon"] ?? "",
      day_length: json["day_length"] ?? "",
      civil_twilight_begin: json["civil_twilight_begin"] ?? "",
      civil_twilight_end: json["civil_twilight_end"] ?? "",
      nautical_twilight_begin: json["nautical_twilight_begin"] ?? "",
      nautical_twilight_end: json["nautical_twilight_end"] ?? "",
      astronomical_twilight_begin: json["astronomical_twilight_begin"] ?? "",
      astronomical_twilight_end: json["astronomical_twilight_end"] ?? "",
    );
  }
}
