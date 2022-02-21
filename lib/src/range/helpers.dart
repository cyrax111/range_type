import 'package:range_type/range_type.dart';

mixin DynamicComparator<T> on Range<T> {
  @override
  int comparator(T value1, T value2) {
    // If K <: Comparable, then we can just use Comparable.compare
    // with no casts.
    Object compare = Comparable.compare;
    if (compare is Comparator<T>) {
      return compare(value1, value2);
    }
    // Otherwise wrap and cast the arguments on each call.
    return Comparable.compare(
        value1 as Comparable<dynamic>, value2 as Comparable<dynamic>);
  }
}
