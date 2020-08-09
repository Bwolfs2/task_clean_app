import 'package:task_clean_app/app/modules/my_tasks/domain/entities/task.dart';
import 'package:task_clean_app/app/modules/my_tasks/external/models/task_entidade.dart';
import 'package:task_clean_app/app/modules/my_tasks/infra/datasource/task_datasource_interface.dart';
import 'package:task_clean_app/app/modules/shared/database/local_database.dart';

class LocalDatasource extends ITaskDatasource {
  final AppDatabase appDatabase;

  LocalDatasource(this.appDatabase);

  @override
  Future<void> addNewTask(Task task) async {
    var tas = TaskEntidade.fromDomain(task);
    return await appDatabase.taskDao.addNewTask(tas);
  }

  @override
  Future<List<Task>> retrieveAllTask() async {
    var tasks = await appDatabase.taskDao.retrieveAllTask();
    return tasks?.map((e) => e.toDomain())?.toList();
  }

  @override
  Future<void> updateTask(Task task) async {
    return await appDatabase.taskDao.updateTask(TaskEntidade.fromDomain(task));
  }

  @override
  Future<void> removeTask(Task task) async {
    return await appDatabase.taskDao.deleteTask(TaskEntidade.fromDomain(task));
  }
}
