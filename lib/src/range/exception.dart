abstract class RangeException implements Exception {
  RangeException([this.message]);
  final dynamic message;

  @override
  String toString() {
    Object? message = this.message;
    if (message == null) return runtimeType.toString();
    return "$runtimeType: $message";
  }
}

class ParseRangeException extends RangeException {
  ParseRangeException([dynamic message]) : super(message);
}

// TODO: maybe NeverRangeException
class NonExistentCaseRangeException extends RangeException {
  NonExistentCaseRangeException() : super('it was never meant to happen');
}

class OperationRangeException extends RangeException {
  OperationRangeException([dynamic message]) : super(message);
}

class ContiguousRangeException extends OperationRangeException {
  ContiguousRangeException()
      : super('result of range difference would not be contiguous');
}
