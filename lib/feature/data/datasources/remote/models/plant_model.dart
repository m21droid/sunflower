class PlantModel {
  final String plantId;
  final String name;
  final String description;
  final int growZoneNumber;
  final int wateringInterval;
  final String imageUrl;

  PlantModel(
      {required this.plantId,
      required this.name,
      required this.description,
      required this.growZoneNumber,
      required this.wateringInterval,
      required this.imageUrl});

  factory PlantModel.fromJson(Map<String, dynamic> json) {
    return PlantModel(
        plantId: json["plantId"] ?? "",
        name: json["name"] ?? "",
        description: json["description"] ?? "",
        growZoneNumber: json["growZoneNumber"] ?? 0,
        wateringInterval: json["wateringInterval"] ?? 0,
        imageUrl: json["imageUrl"] ?? "");
  }
}
