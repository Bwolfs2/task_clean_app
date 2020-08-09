import 'package:flutter_modular/flutter_modular.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/errors/erros.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/entities/task.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:task_clean_app/app/modules/my_tasks/domain/repositories/task_repository_interface.dart';
import 'package:task_clean_app/app/modules/my_tasks/infra/datasource/task_datasource_interface.dart';

part 'task_repository.g.dart';

@Injectable(singleton: false)
class TaskRepository extends ITaskRepository {
  final ITaskDatasource taskDatasource;

  TaskRepository(this.taskDatasource);

  @override
  Future<Either<IFailure, Task>> addNewTask(Task task) async {
    try {
      await taskDatasource.addNewTask(task);
      return Right(task);
    } catch (e) {
      return Left(DatabaseError(message: e.toString()));
    }
  }

  @override
  Future<Either<IFailure, List<Task>>> retrieveAllTask() async {
    try {
      var tasks = await taskDatasource.retrieveAllTask();
      return Right(tasks);
    } catch (e) {
      return Left(DatabaseError(message: e.toString()));
    }
  }

  @override
  Future<Either<IFailure, Task>> updateTask(Task task) async {
    try {
      await taskDatasource.updateTask(task);
      return Right(task);
    } catch (e) {
      return Left(DatabaseError(message: e.toString()));
    }
  }

  @override
  Future<Either<IFailure, bool>> removeTask(Task task) async {
    try {
      await taskDatasource.removeTask(task);
      return Right(true);
    } catch (e) {
      return Left(DatabaseError(message: e.toString()));
    }
  }
}
