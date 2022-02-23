import 'package:range_type/range_type.dart';

import '../bound/empty_bound.dart';

abstract class DiscreteRange<T> extends Range<T> {
  DiscreteRange({
    Bound<T>? lowerBound,
    Bound<T>? upperBound,
  }) : super(lowerBound: lowerBound, upperBound: upperBound);

  DiscreteRange.empty() : super.empty();

  @override
  LowerBound<T> get lowerBound {
    if (super.lowerBound is EmptyBound) {
      return super.lowerBound;
    }
    if (super.lowerBound.type == BoundType.exclusive) {
      assert(super.lowerBound.value != null);
      return LowerBound<T>(
        value: increase(super.lowerBound.value!),
        type: BoundType.inclusive,
      );
    }
    return super.lowerBound;
  }

  @override
  UpperBound<T> get upperBound {
    if (super.upperBound is EmptyBound) {
      return super.upperBound;
    }
    if (super.upperBound.type == BoundType.inclusive) {
      assert(super.upperBound.value != null);
      return UpperBound<T>(
        value: increase(super.upperBound.value!),
        type: BoundType.exclusive,
      );
    }
    return super.upperBound;
  }

  T increase(T operand);
}
