// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_tasks_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ListTasksController = BindInject(
  (i) => ListTasksController(i<IRetrieveAllTask>(), i<IRemoveTask>()),
  singleton: false,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListTasksController on _ListTasksControllerBase, Store {
  final _$tasksAtom = Atom(name: '_ListTasksControllerBase.tasks');

  @override
  List<Task> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(List<Task> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  @override
  String toString() {
    return '''
tasks: ${tasks}
    ''';
  }
}
