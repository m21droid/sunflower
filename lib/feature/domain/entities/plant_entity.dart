import 'package:equatable/equatable.dart';

class PlantEntity extends Equatable {
  final String plantId;
  final String name;
  final String description;
  final int growZoneNumber;
  final int wateringInterval;
  final String imageUrl;

  const PlantEntity(
      {required this.plantId,
      required this.name,
      required this.description,
      required this.growZoneNumber,
      required this.wateringInterval,
      required this.imageUrl});

  @override
  List<Object?> get props => [plantId];
}
