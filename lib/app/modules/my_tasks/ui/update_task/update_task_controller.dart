import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/entities/task.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/use_cases/update_task.dart';

part 'update_task_controller.g.dart';

@Injectable(singleton: false)
class UpdateTaskController = _UpdateTaskControllerBase
    with _$UpdateTaskController;

abstract class _UpdateTaskControllerBase with Store {
  final IUpdateTask _updateTask;

  _UpdateTaskControllerBase(this._updateTask);

  @observable
  Task task = Task();

  @action
  void setTask(Task _task) => task = _task;

  @action
  setInitDate(DateTime date) => task = task.copyWith(initTime: date);

  @action
  setEndDate(DateTime date) => task = task.copyWith(endTime: date);

  @action
  setDescription(String description) =>
      task = task.copyWith(description: description);

  Future<void> updatetask() async {
    try {
      var result = await _updateTask(task);
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
