import 'package:range_type/range_type.dart';

class LowerBound<T> extends Bound<T> {
  const LowerBound({T? value, BoundType type = BoundType.inclusive})
      : super(value: value, type: type);

  const LowerBound.unbounded() : super.unbounded();

  factory LowerBound.from(Bound<T>? bound) {
    if (bound is EmptyBound<T>) {
      return EmptyBound<T>();
    }
    return LowerBound(
      type: bound?.type ?? BoundType.unbounded,
      value: bound?.value,
    );
  }

  @override
  String toString() {
    switch (type) {
      case BoundType.inclusive:
        return '[$value';
      case BoundType.exclusive:
        return '($value';
      case BoundType.unbounded:
        return '(';
      default:
        assert(false, 'unknown bound type ($type)');
        return '';
    }
  }

  @override
  Bound<T> invert() {
    if (isExclusive) {
      return LowerBound(value: value, type: BoundType.inclusive);
    } else if (isInclusive) {
      return LowerBound(value: value, type: BoundType.exclusive);
    }
    return this;
  }
}
