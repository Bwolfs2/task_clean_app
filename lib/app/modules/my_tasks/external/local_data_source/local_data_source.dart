import 'package:task_clean_app/app/modules/my_tasks/domain/entities/task.dart';
import 'package:task_clean_app/app/modules/my_tasks/external/models/task_database_entity.dart';
import 'package:task_clean_app/app/modules/my_tasks/infra/data_source/task_data_source_interface.dart';
import 'package:task_clean_app/app/modules/shared/database/local_database.dart';

class LocalDataSource extends ITaskDataSource {
  final AppDatabase appDatabase;

  LocalDataSource(this.appDatabase);

  @override
  Future<void> addNewTask(Task task) async {
    var tas = TaskDatabaseEntity.fromDomain(task);
    return await appDatabase.taskDao.addNewTask(tas);
  }

  @override
  Future<List<Task>> retrieveAllTask() async {
    var tasks = await appDatabase.taskDao.retrieveAllTask();
    return tasks?.map((e) => e.toDomain())?.toList();
  }

  @override
  Future<void> updateTask(Task task) async {
    return await appDatabase.taskDao
        .updateTask(TaskDatabaseEntity.fromDomain(task));
  }

  @override
  Future<void> removeTask(Task task) async {
    return await appDatabase.taskDao
        .deleteTask(TaskDatabaseEntity.fromDomain(task));
  }
}
