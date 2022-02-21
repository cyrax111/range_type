import 'package:range_type/range_type.dart';

// mixin ContinuosMixin<T> on Range<T> {
//   // @override
//   // bool contains(Range<T> range) {
//   // }
// }

abstract class ContinuosRange<T> extends Range<T> {
  ContinuosRange({
    Bound<T>? lowerBound,
    Bound<T>? upperBound,
  }) : super(lowerBound: lowerBound, upperBound: upperBound);

  ContinuosRange.empty() : super.empty();
}
