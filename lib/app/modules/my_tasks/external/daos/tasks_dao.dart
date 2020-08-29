import 'package:floor/floor.dart';
import 'package:task_clean_app/app/modules/my_tasks/external/models/task_database_entity.dart';

@dao
abstract class TasksDao {
  @Query('SELECT * FROM TaskDataBaseEntity')
  Future<List<TaskDatabaseEntity>> retrieveAllTask();

  @update
  Future<void> updateTask(TaskDatabaseEntity task);

  @insert
  Future<void> addNewTask(TaskDatabaseEntity task);

  @delete
  Future<void> deleteTask(TaskDatabaseEntity task);
}
