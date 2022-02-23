import 'package:range_type/range_type.dart';

abstract class ContinuosRange<T> extends Range<T> {
  ContinuosRange({
    Bound<T>? lowerBound,
    Bound<T>? upperBound,
  }) : super(lowerBound: lowerBound, upperBound: upperBound);

  ContinuosRange.empty() : super.empty();
}
