import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:task_clean_app/app/modules/my_tasks/ui/add_task/add_task_page.dart';
import 'package:task_clean_app/app/modules/my_tasks/ui/update_task/update_task_page.dart';
import 'list_tasks_controller.dart';

class ListTasksPage extends StatefulWidget {
  @override
  _ListTasksPageState createState() => _ListTasksPageState();
}

class _ListTasksPageState
    extends ModularState<ListTasksPage, ListTasksController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas Tarefas"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: AddTaskPage(),
                );
              });
          await controller.getAllTasks();
        },
        child: Icon(Icons.add),
      ),
      body: Observer(
        builder: (BuildContext context) {
          if (controller.tasks == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (controller.tasks.length == 0) {
            return Center(
              child: Text("Nenhuma tarefa cadastrada!!!"),
            );
          }

          return ListView.builder(
              itemCount: controller.tasks.length,
              itemBuilder: (_, index) {
                var task = controller.tasks[index];
                return Card(
                  elevation: 0,
                  margin: EdgeInsets.all(5),
                  color: task.isFinished
                      ? Colors.blue[300].withOpacity(.5)
                      : Colors.green[300].withOpacity(.5),
                  child: ListTile(
                    title: Text(
                      task.description,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () async {
                      await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: UpdateTaskPage(task: task),
                            );
                          });
                      controller.getAllTasks();
                    },
                    trailing: IconButton(
                        icon: Icon(
                          Icons.remove_circle,
                          color: Colors.red[300],
                        ),
                        onPressed: () async {
                          await controller.remove(task);
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("${task.description} dismissed")));
                        }),
                  ),
                );
              });
        },
      ),
    );
  }
}
