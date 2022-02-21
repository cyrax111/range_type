import 'package:range_type/range_type.dart';
import 'package:range_type/src/bound/bound.dart';
import 'package:test/test.dart';

void main() {
  group('Range -', () {
    setUp(() {
      // Additional setup goes here.
    });

    // test('First Test', () {
    //   final range = DiscreteRange<int>(
    //     lower: Bound<int>(value: 2, type: BoundType.inclusive),
    //     upper: Bound(value: 10, type: BoundType.inclusive),
    //   );
    //   print(range);
    // });

    // test('First Test2', () {
    //   final range = DiscreteRange<int>(
    //     lower: Bound(value: 2, type: BoundType.exclusive),
    //     upper: Bound(value: 10, type: BoundType.inclusive),
    //   );
    //   print(range);
    // });

    // test('First Test3', () {
    //   final range = DiscreteRange<int>(
    //     lower: Bound.empty(),
    //     upper: Bound(value: 10, type: BoundType.inclusive),
    //   );
    //   print(range);
    // });

    // group('emptiness -', () {
    //   test('int is not empty', () {
    //     final range = DiscreteRange<int>(
    //       lower: Bound.empty(),
    //       upper: Bound(value: 10, type: BoundType.inclusive),
    //     );
    //     expect(range.empty, false);
    //   });

    //   test('int is empty (no bounds)', () {
    //     final range = DiscreteRange<int>(
    //       lower: Bound.empty(),
    //       upper: Bound.empty(),
    //     );
    //     expect(range.empty, true);
    //   });
  });
}
