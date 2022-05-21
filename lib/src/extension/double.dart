import 'package:range_type/predefined_ranges.dart';
import 'package:range_type/range_type.dart';

extension RangeDouble on double {
  bool contained(DoubleRange doubleRange) => doubleRange.containsElement(this);
  DoubleRange range(double upperBound) {
    return DoubleRange(
      lowerBound: Bound(type: BoundType.inclusive, value: this),
      upperBound: Bound(type: BoundType.inclusive, value: upperBound),
    );
  }
}
