import 'package:range_type/range_type.dart';

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
