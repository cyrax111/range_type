import 'package:range_type/range_type.dart';

abstract class RangeGenerator<T> {
  const RangeGenerator({
    required this.lowerBoundValue,
    required this.upperBoundValue,
  });
  final T lowerBoundValue;
  final T upperBoundValue;

  Range<T> createRange({
    Bound<T>? lowerBound,
    Bound<T>? upperBound,
    bool isEmpty = false,
  });

  List<Range<T>> generate() => [
        empty(),
        unlimited(),
        ...halfUnlimited(),
        ...limited(),
      ];

  Range<T> empty() => createRange(isEmpty: true);

  Range<T> unlimited() => createRange();

  List<Range<T>> halfUnlimited() => [
        createRange(
          upperBound:
              UpperBound(value: upperBoundValue, type: BoundType.exclusive),
        ),
        createRange(
          upperBound:
              UpperBound(value: upperBoundValue, type: BoundType.inclusive),
        ),
        createRange(
          lowerBound:
              LowerBound(value: lowerBoundValue, type: BoundType.exclusive),
        ),
        createRange(
          lowerBound:
              LowerBound(value: lowerBoundValue, type: BoundType.inclusive),
        ),
      ];
  List<Range<T>> limited() => [
        createRange(
          lowerBound:
              LowerBound(value: lowerBoundValue, type: BoundType.inclusive),
          upperBound:
              UpperBound(value: upperBoundValue, type: BoundType.exclusive),
        ),
        createRange(
          lowerBound:
              LowerBound(value: lowerBoundValue, type: BoundType.exclusive),
          upperBound:
              UpperBound(value: upperBoundValue, type: BoundType.inclusive),
        ),
        createRange(
          lowerBound:
              LowerBound(value: lowerBoundValue, type: BoundType.inclusive),
          upperBound:
              UpperBound(value: upperBoundValue, type: BoundType.inclusive),
        ),
        createRange(
          lowerBound:
              LowerBound(value: lowerBoundValue, type: BoundType.exclusive),
          upperBound:
              UpperBound(value: upperBoundValue, type: BoundType.exclusive),
        ),
      ];
}

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
