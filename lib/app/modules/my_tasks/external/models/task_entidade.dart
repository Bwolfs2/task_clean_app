import 'package:floor/floor.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/entities/task.dart';

@Entity(tableName: 'TaskEntidade')
class TaskEntidade {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final int startTime;
  final int endTime;
  final String description;

  TaskEntidade(this.id, this.startTime, this.endTime, this.description);

  factory TaskEntidade.fromDomain(Task task) {
    return TaskEntidade(
      task.id,
      task.startTime.millisecondsSinceEpoch,
      task.endTime.millisecondsSinceEpoch,
      task.description,
    );
  }

  Task toDomain() {
    return Task(
      id: id,
      startTime: DateTime.fromMillisecondsSinceEpoch(startTime),
      endTime: DateTime.fromMillisecondsSinceEpoch(endTime),
      description: description,
    );
  }
}
