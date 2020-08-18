import 'package:specifications/specifications.dart';
import 'package:task_clean_app/app/modules/my_tasks/domain/entities/task.dart';

class HasNoIdentification extends CompositeSpecification<Task> {
  @override
  bool isSatisfiedBy(Task task) {
    return task.id != null;
  }
}
