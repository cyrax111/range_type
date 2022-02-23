import 'package:range_type/predefined_ranges.dart';
import 'package:range_type/range_type.dart';

class IntRangeGenerator extends RangeGenerator<int> {
  const IntRangeGenerator({
    required int lowerBoundValue,
    required int upperBoundValue,
  }) : super(
          lowerBoundValue: lowerBoundValue,
          upperBoundValue: upperBoundValue,
        );

  @override
  Range<int> createRange(
      {Bound<int>? lowerBound, Bound<int>? upperBound, bool isEmpty = false}) {
    if (isEmpty) {
      return IntRange.empty();
    }
    return IntRange(lowerBound: lowerBound, upperBound: upperBound);
  }
}
