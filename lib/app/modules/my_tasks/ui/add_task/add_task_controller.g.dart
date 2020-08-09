// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_task_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $AddTaskController = BindInject(
  (i) => AddTaskController(i<IAddNewTask>()),
  singleton: false,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddTaskController on _AddTaskControllerBase, Store {
  final _$taskAtom = Atom(name: '_AddTaskControllerBase.task');

  @override
  Task get task {
    _$taskAtom.reportRead();
    return super.task;
  }

  @override
  set task(Task value) {
    _$taskAtom.reportWrite(value, super.task, () {
      super.task = value;
    });
  }

  final _$_AddTaskControllerBaseActionController =
      ActionController(name: '_AddTaskControllerBase');

  @override
  dynamic setInitDate(DateTime date) {
    final _$actionInfo = _$_AddTaskControllerBaseActionController.startAction(
        name: '_AddTaskControllerBase.setInitDate');
    try {
      return super.setInitDate(date);
    } finally {
      _$_AddTaskControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEndDate(DateTime date) {
    final _$actionInfo = _$_AddTaskControllerBaseActionController.startAction(
        name: '_AddTaskControllerBase.setEndDate');
    try {
      return super.setEndDate(date);
    } finally {
      _$_AddTaskControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescription(String description) {
    final _$actionInfo = _$_AddTaskControllerBaseActionController.startAction(
        name: '_AddTaskControllerBase.setDescription');
    try {
      return super.setDescription(description);
    } finally {
      _$_AddTaskControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
task: ${task}
    ''';
  }
}
