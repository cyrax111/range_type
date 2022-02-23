import 'package:range_type/range_type.dart';

class IntRange extends DiscreteRange<int> {
  IntRange({
    Bound<int>? lowerBound,
    Bound<int>? upperBound,
  }) : super(
          lowerBound: lowerBound,
          upperBound: upperBound,
        );

  factory IntRange.parse(String range) {
    final rangeParser = RangeParser<int>(range, (val) => int.parse(val));
    return IntRange(
      lowerBound: rangeParser.lowerBound,
      upperBound: rangeParser.upperBound,
    );
  }

  IntRange.empty() : super.empty();

  @override
  int increase(int operand) => ++operand;

  @override
  int comparator(int value1, int value2) => value1.compareTo(value2);

  @override
  Range<int> createRange({
    Bound<int>? lowerBound,
    Bound<int>? upperBound,
    bool empty = false,
  }) {
    if (empty) {
      return IntRange.empty();
    }
    return IntRange(lowerBound: lowerBound, upperBound: upperBound);
  }
}
