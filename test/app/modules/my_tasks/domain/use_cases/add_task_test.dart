import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/entities/task.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/errors/erros.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/repositories/task_repository_interface.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/use_cases/add_or_update_task.dart';

class TaskRepositoryMock extends Mock implements ITaskRepository {}

void main() {
  TaskRepositoryMock repository;
  AddOrUpdateTask addNewTask;
  Task completeTask;

  setUp(() {
    repository = TaskRepositoryMock();
    addNewTask = AddOrUpdateTask(repository);
    completeTask = Task(
        endTime: DateTime.now().add(Duration(hours: 2)),
        startTime: DateTime.now().add(Duration(hours: 1)),
        description: "My Description");
  });

  group('AddNewTask Test happy path', () {
    test("Add a Task Right Way", () async {
      when(repository.addOrUpdate(any))
          .thenAnswer((_) async => right(completeTask));
      var result = await addNewTask(completeTask);
      expect(result | null, completeTask);
    });
  });

  group('AddNewTask Test not so happy path', () {
    test("Test init time empty", () async {
      when(repository.addOrUpdate(any))
          .thenAnswer((_) async => right(completeTask));

      var currentTask = completeTask.copyWith();
      currentTask.startTime = null;

      var result = await addNewTask(currentTask);
      var errorResult = result.fold(id, id);

      expect(errorResult, isA<InvalidTask>());
      expect(errorResult.toString(), "Hora inicial não foi informada.");
    });

    test("Test end time empty", () async {
      when(repository.addOrUpdate(any))
          .thenAnswer((_) async => right(completeTask));

      var currentTask = completeTask.copyWith();
      currentTask.endTime = null;

      var result = await addNewTask(currentTask);
      var errorResult = result.fold(id, id);

      expect(errorResult, isA<InvalidTask>());
      expect(errorResult.toString(), "Hora final não foi informada.");
    });

    test("Test end time before end time", () async {
      when(repository.addOrUpdate(any))
          .thenAnswer((_) async => right(completeTask));

      var currentTask = completeTask.copyWith();
      currentTask.endTime = DateTime.now().subtract(Duration(hours: 4));

      var result = await addNewTask(currentTask);
      var errorResult = result.fold(id, id);

      expect(errorResult, isA<InvalidTask>());
      expect(errorResult.toString(),
          "Hora inicial deve ser maior que a hora final.");
    });

    test("Test init time before date time now", () async {
      when(repository.addOrUpdate(any))
          .thenAnswer((_) async => right(completeTask));

      var currentTask = completeTask.copyWith();
      currentTask.startTime = DateTime.now().subtract(Duration(hours: 4));

      var result = await addNewTask(currentTask);
      var errorResult = result.fold(id, id);

      expect(errorResult, isA<InvalidTask>());
      expect(errorResult.toString(),
          "Hora inicial deve ser maior que a hora atual.");
    });

    test("Test description empty", () async {
      when(repository.addOrUpdate(any))
          .thenAnswer((_) async => right(completeTask));

      var result = await addNewTask(completeTask.copyWith(description: ""));
      var errorResult = result.fold(id, id);
      expect(errorResult, isA<InvalidTask>());
      expect(errorResult.toString(), "Descrição deve ser informado.");
    });

    test("Test description null", () async {
      when(repository.addOrUpdate(any))
          .thenAnswer((_) async => right(completeTask));
      var currentTask = completeTask.copyWith();
      currentTask.description = null;
      var result = await addNewTask(currentTask);

      var errorResult = result.fold(id, id);

      expect(errorResult, isA<InvalidTask>());
      expect(errorResult.toString(), "Descrição deve ser informado.");
    });
  });
}
