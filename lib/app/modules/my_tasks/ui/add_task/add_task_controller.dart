import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/entities/task.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/use_cases/add_new_task.dart';

part 'add_task_controller.g.dart';

class AddTaskController = _AddTaskControllerBase with _$AddTaskController;

abstract class _AddTaskControllerBase with Store {
  final IAddNewTask _addNewTask;

  _AddTaskControllerBase(this._addNewTask);

  @observable
  Task task = Task();

  @action
  setInitDate(DateTime date) => task = task.copyWith(initTime: date);

  @action
  setEndDate(DateTime date) => task = task.copyWith(endTime: date);

  @action
  setDescription(String description) =>
      task = task.copyWith(description: description);

  Future<void> addNewtask() async {
    try {
      var result = await _addNewTask(task);
      result.fold(
        (left) => BotToast.showText(text: left.message),
        (right) => Modular.to.pop(),
      );
    } catch (e) {
      print(e);
      BotToast.showText(text: e);
    }
  }
}
