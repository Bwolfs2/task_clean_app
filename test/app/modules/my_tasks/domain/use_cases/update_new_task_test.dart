import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/entities/task.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/errors/erros.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/repositories/task_repository_interface.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/use_cases/update_task.dart';

class TaskRepositoryMock extends Mock implements ITaskRepository {}

void main() {
  TaskRepositoryMock repository;
  UpdateTask updateTask;
  Task completeTask;

  setUp(() {
    repository = TaskRepositoryMock();
    updateTask = UpdateTask(repository);
    completeTask = Task(
        id: 1,
        endTime: DateTime.now().add(Duration(hours: 2)),
        startTime: DateTime.now().add(Duration(hours: 1)),
        description: "My Description");
  });

  group('UpdateTask Test happy path', () {
    test("Update a Task Right Way", () async {
      when(repository.updateTask(any))
          .thenAnswer((_) async => right(completeTask));
      var result = await updateTask(completeTask);
      expect(result | null, completeTask);
    });
  });

  group('UpdateTask Test not so happy path', () {
    group('RemoveTask Test not so happy path', () {
      test("Test id with Assert", () async {
        when(repository.addNewTask(any))
            .thenAnswer((_) async => right(completeTask));
        bool assertionError = false;
        try {
          var currentTask = completeTask.copyWith();
          currentTask.id = null;
          await updateTask(currentTask);
        } on AssertionError {
          assertionError = true;
        }
        expect(assertionError, true);
      });
    });

    test("Test init time empty", () async {
      when(repository.updateTask(any))
          .thenAnswer((_) async => right(completeTask));

      var currentTask = completeTask.copyWith();
      currentTask.startTime = null;

      var result = await updateTask(currentTask);
      var errorResult = result.fold(id, id);

      expect(errorResult, isA<InvalidTask>());
      expect(errorResult.toString(), "Hora inicial não foi informada.");
    });

    test("Test end time empty", () async {
      when(repository.updateTask(any))
          .thenAnswer((_) async => right(completeTask));

      var currentTask = completeTask.copyWith();
      currentTask.endTime = null;

      var result = await updateTask(currentTask);
      var errorResult = result.fold(id, id);

      expect(errorResult, isA<InvalidTask>());
      expect(errorResult.toString(), "Hora final não foi informada.");
    });

    test("Test end time before end time", () async {
      when(repository.updateTask(any))
          .thenAnswer((_) async => right(completeTask));

      var currentTask = completeTask.copyWith();
      currentTask.endTime = DateTime.now().subtract(Duration(hours: 4));

      var result = await updateTask(currentTask);
      var errorResult = result.fold(id, id);

      expect(errorResult, isA<InvalidTask>());
      expect(errorResult.toString(),
          "Hora inicial deve ser maior que a hora final.");
    });

    test("Test init time before date time now", () async {
      when(repository.updateTask(any))
          .thenAnswer((_) async => right(completeTask));

      var currentTask = completeTask.copyWith();
      currentTask.startTime = DateTime.now().subtract(Duration(hours: 4));

      var result = await updateTask(currentTask);
      var errorResult = result.fold(id, id);

      expect(errorResult, isA<InvalidTask>());
      expect(errorResult.toString(),
          "Hora inicial deve ser maior que a hora atual.");
    });

    test("Test description empty", () async {
      when(repository.updateTask(any))
          .thenAnswer((_) async => right(completeTask));

      var result = await updateTask(completeTask.copyWith(description: ""));
      var errorResult = result.fold(id, id);
      expect(errorResult, isA<InvalidTask>());
      expect(errorResult.toString(), "Descrição deve ser informado.");
    });

    test("Test description null", () async {
      when(repository.updateTask(any))
          .thenAnswer((_) async => right(completeTask));
      var currentTask = completeTask.copyWith();
      currentTask.description = null;
      var result = await updateTask(currentTask);

      var errorResult = result.fold(id, id);

      expect(errorResult, isA<InvalidTask>());
      expect(errorResult.toString(), "Descrição deve ser informado.");
    });
  });
}
