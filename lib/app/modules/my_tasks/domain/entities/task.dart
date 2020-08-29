import 'package:task_clean_app/app/domain_core/entity_interface.dart';

class Task extends IEntity {
  int id;
  DateTime startTime;
  DateTime endTime;
  String description;

  Task({this.id, this.startTime, this.endTime, this.description});

  bool get isFinished => endTime.isBefore(DateTime.now());

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Task && o.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        startTime.hashCode ^
        endTime.hashCode ^
        description.hashCode;
  }

  Task copyWith({
    int id,
    DateTime initTime,
    DateTime endTime,
    String description,
  }) {
    return Task(
      id: id ?? this.id,
      startTime: initTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      description: description ?? this.description,
    );
  }
}
