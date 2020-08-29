import 'package:dartz/dartz.dart' hide Task;
import 'package:task_clean_app/app/modules/my_tasks/domain/errors/erros.dart';

import 'entity_interface.dart';

abstract class IRepository<T extends IEntity> {
  Future<Either<IFailure, T>> addOrUpdate(T obj);

  Future<Either<IFailure, List<T>>> retrieveAll();

  Future<Either<IFailure, bool>> remove(T obj);
}
