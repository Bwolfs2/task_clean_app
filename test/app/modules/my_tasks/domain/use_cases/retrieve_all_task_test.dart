import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/entities/task.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/repositories/task_repository_interface.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/use_cases/retrieve_all_task.dart';

class TaskRepositoryMock extends Mock implements ITaskRepository {}

void main() {
  TaskRepositoryMock repository;
  RetrieveAllTask retrieveAllTask;

  setUp(() {
    repository = TaskRepositoryMock();
    retrieveAllTask = RetrieveAllTask(repository);
  });

  group('Retrieve all tasks Test happy path', () {
    test("Retrieve all tasks Right Way", () async {
      when(repository.retrieveAllTask())
          .thenAnswer((_) async => right(<Task>[]));
      var result = await retrieveAllTask();
      expect(result | null, <Task>[]);
    });
  });
}
