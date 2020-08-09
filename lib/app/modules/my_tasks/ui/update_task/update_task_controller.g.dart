// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_task_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $UpdateTaskController = BindInject(
  (i) => UpdateTaskController(i<IUpdateTask>()),
  singleton: false,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UpdateTaskController on _UpdateTaskControllerBase, Store {
  final _$taskAtom = Atom(name: '_UpdateTaskControllerBase.task');

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

  final _$_UpdateTaskControllerBaseActionController =
      ActionController(name: '_UpdateTaskControllerBase');

  @override
  void setTask(Task _task) {
    final _$actionInfo = _$_UpdateTaskControllerBaseActionController
        .startAction(name: '_UpdateTaskControllerBase.setTask');
    try {
      return super.setTask(_task);
    } finally {
      _$_UpdateTaskControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setInitDate(DateTime date) {
    final _$actionInfo = _$_UpdateTaskControllerBaseActionController
        .startAction(name: '_UpdateTaskControllerBase.setInitDate');
    try {
      return super.setInitDate(date);
    } finally {
      _$_UpdateTaskControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEndDate(DateTime date) {
    final _$actionInfo = _$_UpdateTaskControllerBaseActionController
        .startAction(name: '_UpdateTaskControllerBase.setEndDate');
    try {
      return super.setEndDate(date);
    } finally {
      _$_UpdateTaskControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescription(String description) {
    final _$actionInfo = _$_UpdateTaskControllerBaseActionController
        .startAction(name: '_UpdateTaskControllerBase.setDescription');
    try {
      return super.setDescription(description);
    } finally {
      _$_UpdateTaskControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
task: ${task}
    ''';
  }
}
