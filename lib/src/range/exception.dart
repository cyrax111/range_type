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

class OperationRangeException extends RangeException {
  OperationRangeException([dynamic message]) : super(message);
}
