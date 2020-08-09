import 'package:bot_toast/bot_toast.dart';
import 'package:mobx/mobx.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/entities/task.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/use_cases/remove_task.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/use_cases/retrieve_all_task.dart';

part 'list_tasks_controller.g.dart';

class ListTasksController = _ListTasksControllerBase with _$ListTasksController;

abstract class _ListTasksControllerBase with Store {
  final IRetrieveAllTask _retrieveAllTasks;
  final IRemoveTask _removeTask;

  _ListTasksControllerBase(this._retrieveAllTasks, this._removeTask) {
    getAllTasks();
  }

  Future<void> getAllTasks() async {
    var result = await _retrieveAllTasks();

    result.fold(
      (left) => BotToast.showText(text: left.message),
      (right) => tasks = right,
    );
  }

  Future<void> remove(Task task) async {
    var result = await _removeTask(task);

    result.fold(
      (left) => BotToast.showText(text: left.message),
      (right) => getAllTasks(),
    );
  }

  @observable
  List<Task> tasks;
}
