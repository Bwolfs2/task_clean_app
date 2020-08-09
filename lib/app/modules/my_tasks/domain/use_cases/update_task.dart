import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/entities/task.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/errors/erros.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/repositories/task_repository_interface.dart';

part 'update_task.g.dart';

abstract class IUpdateTask {
  Future<Either<IFailure, Task>> call(Task task);
}

@Injectable(singleton: false)
class UpdateTask implements IUpdateTask {
  final ITaskRepository repository;

  UpdateTask(this.repository);

  @override
  Future<Either<IFailure, Task>> call(Task task) async {
    if (task.id == null || task.id == 0) {
      return Left(
        InvalidTask(
          message: "Id não informado.",
        ),
      );
    }

    if (task.initTime.isAfter(task.endTime)) {
      return Left(
        InvalidTask(
          message: "Hora inicial deve ser maior que a hora final.",
        ),
      );
    }

    if (task.initTime.isBefore(DateTime.now())) {
      return Left(
        InvalidTask(
          message: "Hora inicial deve ser maior que a hora atual.",
        ),
      );
    }

    if (task.description == null || task.description.trim().length == 0) {
      return Left(
        InvalidTask(
          message: "Descrição deve ser informado.",
        ),
      );
    }

    return await repository.updateTask(task);
  }
}