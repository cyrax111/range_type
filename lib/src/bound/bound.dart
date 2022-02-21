enum BoundType {
  inclusive,
  exclusive,
  unbounded,
}

BoundType invertBoundType(BoundType type) {
  if (type == BoundType.inclusive) {
    return BoundType.exclusive;
  }
  if (type == BoundType.exclusive) {
    return BoundType.inclusive;
  }
  return type;
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

  @override
  String toString() {
    return 'Bound($value, $type)';
  }
}
