# Range package for Dart
The convenient pure Dart library of ranges representation. Range types are data types representing a range of values of some element type.

### Examples

##### Creation of a range
```dart
  // common way
  var range = IntRange(
    lowerBound: Bound(type: BoundType.inclusive, value: 1),
    upperBound: Bound(type: BoundType.exclusive, value: 10),
  );

  // through parsing from a string
  range = IntRange.parse('[1, 10)');

  // through an extension
  range = 1.range(10);
```

##### Checking for an element in the range
```dart
  var range = IntRange.parse('[1, 10)');

  // common way
  if(range.containsElement(7)) {
    print('contains');
  }

  // through an extension
  if(7.contained(range)) {
    print('contains');
  }
```
##### DateTime range
```dart
import 'package:range_type/predefined_ranges.dart';

void main() {
  final july = DateTimeRange.parse('[2022-07-01, 2022-08-01)');

  final scheduleDate1 = DateTime(2022, 07, 02);
  final scheduleDate2 = DateTime(2022, 08, 07);

  final workingDays = DateTimeRange.parse('[2022-07-20, 2022-08-15)');

  print('Is scheduleDate1 in July? ${july.containsElement(scheduleDate1)}');
  print('Is scheduleDate2 in July? ${july.containsElement(scheduleDate2)}');
  print('Is workingDays overlaps? ${july.overlap(workingDays)}');
  print('workingDays intersection: ${july.intersection(workingDays)}');
  print('workingDays union: ${july.union(workingDays)}');
  print('july difference workingDays: ${july.difference(workingDays)}');
}
```