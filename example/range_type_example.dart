import 'package:range_type/predefined_ranges.dart';
import 'package:range_type/range_type.dart';
import 'package:range_type/src/extension/int.dart';

void main() {
  // int range example
  // it will write numbers from 5 to 10
  for (int i = 0; i < 15; i++) {
    if (i.contained(5.range(10))) {
      print(i);
    }
  }

  // DateTime range example
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

  // three ways to make a range

  // through common constructor
  var range = IntRange(
    lowerBound: Bound(type: BoundType.inclusive, value: 1),
    upperBound: Bound(type: BoundType.exclusive, value: 10),
  );
  print('int range [1, 10): $range');

  // through parsing from string
  range = IntRange.parse('[1, 10)');
  print('int range [1, 10): $range');

  // through extension
  range = 1.range(10);
  print('int range [1, 11): $range');
}
