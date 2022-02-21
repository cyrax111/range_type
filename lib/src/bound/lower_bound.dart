import 'empty_bound.dart';
import 'bound.dart';

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

  /// Returns positive if [LowerBound] include the [value]
  // bool contains({T? value, }) {
  //   if (isInfinite) {
  //     return true;
  //   }
  //   if()
  // }
}
