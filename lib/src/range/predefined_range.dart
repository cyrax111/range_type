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

typedef Comparator<T> = int Function(T value1, T value2);
typedef Increaser<T> = T Function(T value);

class CustomContinuosRange<T> extends ContinuosRange<T> {
  CustomContinuosRange({
    Bound<T>? lowerBound,
    Bound<T>? upperBound,
    required Comparator<T> comparator,
  })  : _comparator = comparator,
        super(
          lowerBound: lowerBound,
          upperBound: upperBound,
        );
  CustomContinuosRange.empty()
      : _comparator = null,
        super.empty();

  final Comparator<T>? _comparator;

  @override
  int comparator(T value1, T value2) => _comparator!(value1, value2);

  @override
  Range<T> createRange({
    Bound<T>? lowerBound,
    Bound<T>? upperBound,
    bool empty = false,
  }) {
    if (empty) {
      return CustomContinuosRange.empty();
    }
    return CustomContinuosRange(
      lowerBound: lowerBound,
      upperBound: upperBound,
      comparator: comparator,
    );
  }
}

class CustomDiscreteRange<T> extends DiscreteRange<T> {
  CustomDiscreteRange({
    Bound<T>? lowerBound,
    Bound<T>? upperBound,
    required Comparator<T> comparator,
    required Increaser<T> increaser,
  })  : _comparator = comparator,
        _increaser = increaser,
        super(
          lowerBound: lowerBound,
          upperBound: upperBound,
        );
  CustomDiscreteRange.empty()
      : _comparator = null,
        _increaser = null,
        super.empty();

  final Comparator<T>? _comparator;
  final Increaser<T>? _increaser;

  @override
  int comparator(T value1, T value2) => _comparator!(value1, value2);

  @override
  T increase(T operand) => _increaser!(operand);

  @override
  Range<T> createRange({
    Bound<T>? lowerBound,
    Bound<T>? upperBound,
    bool empty = false,
  }) {
    if (empty) {
      return CustomDiscreteRange.empty();
    }
    return CustomDiscreteRange(
      lowerBound: lowerBound,
      upperBound: upperBound,
      comparator: comparator,
      increaser: increase,
    );
  }
}
