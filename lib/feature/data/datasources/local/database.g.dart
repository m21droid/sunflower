// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PlantDao? _plantDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PlantDTO` (`plantId` TEXT NOT NULL, `name` TEXT NOT NULL, `description` TEXT NOT NULL, `growZoneNumber` INTEGER NOT NULL, `wateringInterval` INTEGER NOT NULL, `imageUrl` TEXT NOT NULL, PRIMARY KEY (`plantId`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PlantDao get plantDao {
    return _plantDaoInstance ??= _$PlantDao(database, changeListener);
  }
}

class _$PlantDao extends PlantDao {
  _$PlantDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _plantDTOInsertionAdapter = InsertionAdapter(
            database,
            'PlantDTO',
            (PlantDTO item) => <String, Object?>{
                  'plantId': item.plantId,
                  'name': item.name,
                  'description': item.description,
                  'growZoneNumber': item.growZoneNumber,
                  'wateringInterval': item.wateringInterval,
                  'imageUrl': item.imageUrl
                }),
        _plantDTODeletionAdapter = DeletionAdapter(
            database,
            'PlantDTO',
            ['plantId'],
            (PlantDTO item) => <String, Object?>{
                  'plantId': item.plantId,
                  'name': item.name,
                  'description': item.description,
                  'growZoneNumber': item.growZoneNumber,
                  'wateringInterval': item.wateringInterval,
                  'imageUrl': item.imageUrl
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PlantDTO> _plantDTOInsertionAdapter;

  final DeletionAdapter<PlantDTO> _plantDTODeletionAdapter;

  @override
  Future<List<PlantDTO>> getAllPlants() async {
    return _queryAdapter.queryList('SELECT * FROM PlantDTO',
        mapper: (Map<String, Object?> row) => PlantDTO(
            plantId: row['plantId'] as String,
            name: row['name'] as String,
            description: row['description'] as String,
            growZoneNumber: row['growZoneNumber'] as int,
            wateringInterval: row['wateringInterval'] as int,
            imageUrl: row['imageUrl'] as String));
  }

  @override
  Future<void> insertPlant(PlantDTO plant) async {
    await _plantDTOInsertionAdapter.insert(plant, OnConflictStrategy.abort);
  }

  @override
  Future<void> deletePlant(PlantDTO plant) async {
    await _plantDTODeletionAdapter.delete(plant);
  }
}
