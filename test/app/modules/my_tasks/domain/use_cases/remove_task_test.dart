import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/entities/task.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/repositories/task_repository_interface.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/use_cases/remove_task.dart';

class TaskRepositoryMock extends Mock implements ITaskRepository {}

void main() {
  TaskRepositoryMock repository;
  RemoveTask removeTask;
  Task completeTask;

  setUp(() {
    repository = TaskRepositoryMock();
    removeTask = RemoveTask(repository);
    completeTask = Task(
        id: 1,
        endTime: DateTime.now().add(Duration(hours: 2)),
        startTime: DateTime.now().add(Duration(hours: 1)),
        description: "My Description");
  });

  group('RemoveTask Test happy path', () {
    test("Remove a Task Right Way", () async {
      when(repository.removeTask(any)).thenAnswer((_) async => right(true));
      var result = await removeTask(completeTask);
      expect(result | null, true);
    });
  });

  group('RemoveTask Test not so happy path', () {
    test("Test id with Assert", () async {
      when(repository.addNewTask(any))
          .thenAnswer((_) async => right(completeTask));
      bool assertionError = false;
      try {
        var currentTask = completeTask.copyWith();
        currentTask.id = null;
        await removeTask(currentTask);
      } on AssertionError {
        assertionError = true;
      }
      expect(assertionError, true);
    });
  });
}
