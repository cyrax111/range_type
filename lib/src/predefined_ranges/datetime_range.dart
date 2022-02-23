import 'package:range_type/range_type.dart';

class DateTimeRange extends ContinuosRange<DateTime> {
  DateTimeRange({
    Bound<DateTime>? lowerBound,
    Bound<DateTime>? upperBound,
  }) : super(
          lowerBound: lowerBound,
          upperBound: upperBound,
        );

  factory DateTimeRange.parse(String range) {
    final rangeParser =
        RangeParser<DateTime>(range, (val) => DateTime.parse(val));
    return DateTimeRange(
      lowerBound: rangeParser.lowerBound,
      upperBound: rangeParser.upperBound,
    );
  }

  DateTimeRange.empty() : super.empty();

  @override
  int comparator(DateTime value1, DateTime value2) => value1.compareTo(value2);

  @override
  Range<DateTime> createRange({
    Bound<DateTime>? lowerBound,
    Bound<DateTime>? upperBound,
    bool empty = false,
  }) {
    if (empty) {
      return DateTimeRange.empty();
    }
    return DateTimeRange(lowerBound: lowerBound, upperBound: upperBound);
  }
}
