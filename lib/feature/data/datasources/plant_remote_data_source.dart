import 'package:dartz/dartz.dart';
import 'package:sunflower/core/error/exception.dart';
import 'package:sunflower/feature/data/datasources/remote/models/plant_model.dart';

abstract class PlantRemoteDataSource {
  Future<Either<ServerException, List<PlantModel>>> getAllPlants();
}
