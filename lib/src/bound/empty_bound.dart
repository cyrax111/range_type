import 'package:range_type/range_type.dart';

class EmptyBound<T> implements LowerBound<T>, UpperBound<T> {
  const EmptyBound();

  @override
  bool get isExclusive => false;

  @override
  bool get isFinite => false;

  @override
  bool get isInclusive => false;

  @override
  bool get isInfinite => false;

  @override
  final BoundType type = BoundType.exclusive;

  @override
  final T? value = null;
}
