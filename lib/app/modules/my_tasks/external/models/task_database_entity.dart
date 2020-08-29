import 'package:floor/floor.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/entities/task.dart';

@Entity(tableName: 'TaskDatabaseEntity')
class TaskDatabaseEntity {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final int startTime;
  final int endTime;
  final String description;

  TaskDatabaseEntity(this.id, this.startTime, this.endTime, this.description);

  factory TaskDatabaseEntity.fromDomain(Task task) {
    return TaskDatabaseEntity(
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
