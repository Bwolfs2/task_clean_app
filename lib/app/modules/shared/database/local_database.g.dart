// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

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

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

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
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
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
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TasksDao _taskDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
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
            'CREATE TABLE IF NOT EXISTS `TaskEntidade` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `initTime` INTEGER, `endTime` INTEGER, `description` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TasksDao get taskDao {
    return _taskDaoInstance ??= _$TasksDao(database, changeListener);
  }
}

class _$TasksDao extends TasksDao {
  _$TasksDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _taskEntidadeInsertionAdapter = InsertionAdapter(
            database,
            'TaskEntidade',
            (TaskDatabaseEntity item) => <String, dynamic>{
                  'id': item.id,
                  'initTime': item.startTime,
                  'endTime': item.endTime,
                  'description': item.description
                }),
        _taskEntidadeUpdateAdapter = UpdateAdapter(
            database,
            'TaskEntidade',
            ['id'],
            (TaskDatabaseEntity item) => <String, dynamic>{
                  'id': item.id,
                  'initTime': item.startTime,
                  'endTime': item.endTime,
                  'description': item.description
                }),
        _taskEntidadeDeletionAdapter = DeletionAdapter(
            database,
            'TaskEntidade',
            ['id'],
            (TaskDatabaseEntity item) => <String, dynamic>{
                  'id': item.id,
                  'initTime': item.startTime,
                  'endTime': item.endTime,
                  'description': item.description
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _taskEntidadeMapper = (Map<String, dynamic> row) =>
      TaskDatabaseEntity(row['id'] as int, row['initTime'] as int,
          row['endTime'] as int, row['description'] as String);

  final InsertionAdapter<TaskDatabaseEntity> _taskEntidadeInsertionAdapter;

  final UpdateAdapter<TaskDatabaseEntity> _taskEntidadeUpdateAdapter;

  final DeletionAdapter<TaskDatabaseEntity> _taskEntidadeDeletionAdapter;

  @override
  Future<List<TaskDatabaseEntity>> retrieveAllTask() async {
    return _queryAdapter.queryList('SELECT * FROM TaskEntidade',
        mapper: _taskEntidadeMapper);
  }

  @override
  Future<void> addNewTask(TaskDatabaseEntity task) async {
    await _taskEntidadeInsertionAdapter.insert(task, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateTask(TaskDatabaseEntity task) async {
    await _taskEntidadeUpdateAdapter.update(task, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteTask(TaskDatabaseEntity task) async {
    await _taskEntidadeDeletionAdapter.delete(task);
  }
}
