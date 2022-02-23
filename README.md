# Range package for Dart
The convenient pure Dart library of ranges representation. Range types are data types representing a range of values of some element type.

## Example

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