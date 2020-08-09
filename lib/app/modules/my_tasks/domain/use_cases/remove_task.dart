import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/entities/task.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/errors/erros.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/repositories/task_repository_interface.dart';

part 'remove_task.g.dart';

abstract class IRemoveTask {
  Future<Either<IFailure, void>> call(Task task);
}

@Injectable(singleton: false)
class RemoveTask implements IRemoveTask {
  final ITaskRepository repository;

  RemoveTask(this.repository);

  @override
  Future<Either<IFailure, void>> call(Task task) async {
    return await repository.removeTask(task);
  }
}
