import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:sunflower/feature/data/datasources/local/dto/plant_dto.dart';
import 'package:sunflower/feature/data/datasources/local/plant_dao.dart';

part 'database.g.dart';

@Database(version: 1, entities: [PlantDTO])
abstract class AppDatabase extends FloorDatabase {
  PlantDao get plantDao;
}
