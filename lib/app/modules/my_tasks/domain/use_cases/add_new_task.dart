import 'package:dartz/dartz.dart' hide Task;
import 'package:task_clean_app/app/modules/my_tasks/domain/entities/task.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/errors/erros.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/repositories/task_repository_interface.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/specs/has_description.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/specs/has_end_time.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/specs/has_start_time.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/specs/start_time_is_after_end_time.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/specs/start_time_is_before_now.dart';

abstract class IAddNewTask {
  Future<Either<IFailure, Task>> call(Task task);
}

class AddNewTask implements IAddNewTask {
  final ITaskRepository repository;

  AddNewTask(this.repository);

  @override
  Future<Either<IFailure, Task>> call(Task task) async {
    assert(HasDescription().isSatisfiedBy(task));

    if (HasStartTime().isSatisfiedBy(task)) {
      return Left(
        InvalidTask(
          message: "Hora inicial não foi informada.",
        ),
      );
    }

    if (HasEndTime().isSatisfiedBy(task)) {
      return Left(
        InvalidTask(
          message: "Hora final não foi informada.",
        ),
      );
    }

    if (StartTimeIsAfterEndTime().isSatisfiedBy(task)) {
      return Left(
        InvalidTask(
          message: "Hora inicial deve ser maior que a hora final.",
        ),
      );
    }

    if (StartTimeIsBeforeNow().isSatisfiedBy(task)) {
      return Left(
        InvalidTask(
          message: "Hora inicial deve ser maior que a hora atual.",
        ),
      );
    }

    if (HasDescription().isSatisfiedBy(task)) {
      return Left(
        InvalidTask(
          message: "Descrição deve ser informado.",
        ),
      );
    }

    return await repository.addNewTask(task);
  }
}
