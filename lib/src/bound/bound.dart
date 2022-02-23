import 'package:range_type/range_type.dart';

enum BoundType {
  inclusive,
  exclusive,
  unbounded,
}

class Bound<T> {
  const Bound({this.value, this.type = BoundType.inclusive})
      : assert(value != null &&
                (type == BoundType.inclusive || type == BoundType.exclusive) ||
            value == null && type == BoundType.unbounded);

  Bound.from(Bound<T>? bound)
      : type = bound?.type ?? BoundType.unbounded,
        value = bound?.value;

  const Bound.unbounded()
      : type = BoundType.unbounded,
        value = null;

  final BoundType type;
  final T? value;

  bool get isInfinite => type == BoundType.unbounded;
  bool get isFinite => !isInfinite;
  bool get isInclusive => type == BoundType.inclusive;
  bool get isExclusive => type == BoundType.exclusive;

  bool get isLower => this is LowerBound;
  bool get isUpper => this is UpperBound;
  bool get isNotEmpty => this is! EmptyBound;

  Bound<T> invert() {
    if (isExclusive) {
      return Bound(value: value, type: BoundType.inclusive);
    } else if (isInclusive) {
      return Bound(value: value, type: BoundType.exclusive);
    }
    return this;
  }

  @override
  String toString() {
    return 'Bound($value, $type)';
  }
}
