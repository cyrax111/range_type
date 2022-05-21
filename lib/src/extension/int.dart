import 'package:range_type/predefined_ranges.dart';
import 'package:range_type/range_type.dart';

extension RangeInt on int {
  bool contained(IntRange intRange) => intRange.containsElement(this);
  IntRange range(int upperBound) {
    return IntRange(
      lowerBound: Bound(type: BoundType.inclusive, value: this),
      upperBound: Bound(type: BoundType.inclusive, value: upperBound),
    );
  }
}
