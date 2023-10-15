import 'dart:convert';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:sunflower/core/error/exception.dart';
import 'package:sunflower/feature/data/datasources/plant_remote_data_source.dart';
import 'package:sunflower/feature/data/datasources/remote/models/plant_model.dart';

class PlantRemoteDataSourceImpl extends PlantRemoteDataSource {
  @override
  Future<Either<ServerException, List<PlantModel>>> getAllPlants() async {
    await Future.delayed(const Duration(milliseconds: 1000)); // TODO loading
    if (Random().nextBool()) {
      final String response =
          await rootBundle.loadString('assets/mock/plants.json');
      final data = json.decode(response) as List;
      final plants = data.map((plant) => PlantModel.fromJson(plant)).toList();
      return right(plants);
    } else {
      return left(ServerException());
    }
  }
}
