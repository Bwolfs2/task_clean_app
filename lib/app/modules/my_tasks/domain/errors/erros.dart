abstract class IFailure implements Exception {
  String get message;
}

class InvalidTask extends IFailure {
  final String message;
  InvalidTask({this.message});
}

class DatabaseError extends IFailure {
  final String message;
  DatabaseError({this.message});
}
