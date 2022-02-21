import 'bound.dart';
import 'empty_bound.dart';

class UpperBound<T> extends Bound<T> {
  const UpperBound({T? value, BoundType type = BoundType.inclusive})
      : super(value: value, type: type);

  const UpperBound.unbounded() : super.unbounded();

  factory UpperBound.from(Bound<T>? bound) {
    if (bound is EmptyBound<T>) {
      return EmptyBound<T>();
    }
    return UpperBound(
      type: bound?.type ?? BoundType.unbounded,
      value: bound?.value,
    );
  }

  @override
  String toString() {
    switch (type) {
      case BoundType.inclusive:
        return '$value]';
      case BoundType.exclusive:
        return '$value)';
      case BoundType.unbounded:
        return ')';
      default:
        assert(false, 'unknown bound type ($type)');
        return '';
    }
  }
}
