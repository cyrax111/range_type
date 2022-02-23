import 'package:range_type/range_type.dart';

class DoubleRange extends ContinuosRange<double> {
  DoubleRange({
    Bound<double>? lowerBound,
    Bound<double>? upperBound,
  }) : super(
          lowerBound: lowerBound,
          upperBound: upperBound,
        );

  factory DoubleRange.parse(String range) {
    final rangeParser = RangeParser<double>(range, (val) => double.parse(val));
    return DoubleRange(
      lowerBound: rangeParser.lowerBound,
      upperBound: rangeParser.upperBound,
    );
  }

  DoubleRange.empty() : super.empty();

  @override
  int comparator(double value1, double value2) => value1.compareTo(value2);

  @override
  Range<double> createRange({
    Bound<double>? lowerBound,
    Bound<double>? upperBound,
    bool empty = false,
  }) {
    if (empty) {
      return DoubleRange.empty();
    }
    return DoubleRange(lowerBound: lowerBound, upperBound: upperBound);
  }
}
