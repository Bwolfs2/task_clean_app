import 'package:flutter_modular/flutter_modular.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/use_cases/add_new_task.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/use_cases/remove_task.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/use_cases/retrieve_all_task.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/use_cases/update_task.dart';
import 'package:task_clean_app/app/modules/my_tasks/external/local_datasource/local_datasource.dart';
import 'package:task_clean_app/app/modules/my_tasks/infra/repositories/task_repository.dart';

import 'ui/add_task/add_task_controller.dart';
import 'ui/list_tasks/list_tasks_controller.dart';
import 'ui/list_tasks/list_tasks_page.dart';
import 'ui/update_task/update_task_controller.dart';

class MyTasksModule extends ChildModule {
  @override
  List<Bind> get binds => [
        //Controllers
        $UpdateTaskController,
        $ListTasksController,
        $AddTaskController,
        //Repositories
        $TaskRepository,
        //DataSource
        $LocalDatasource,
        //Use Cases
        $AddNewTask,
        $RetrieveAllTask,
        $UpdateTask,
        $RemoveTask
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ListTasksPage()),
      ];

  static Inject get to => Inject<MyTasksModule>.of();
}