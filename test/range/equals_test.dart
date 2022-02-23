import 'package:range_type/range_type.dart';
import 'package:test/test.dart';

void main() {
  group('equals -', () {
    test('different bounds int (all combinations)', () {
      final rangeIE = IntRange(
        lowerBound: LowerBound(value: 3, type: BoundType.inclusive),
        upperBound: UpperBound(value: 10, type: BoundType.exclusive),
      );
      final rangeEE = IntRange(
        lowerBound: LowerBound(value: 2, type: BoundType.exclusive),
        upperBound: UpperBound(value: 10, type: BoundType.exclusive),
      );
      final rangeEI = IntRange(
        lowerBound: LowerBound(value: 2, type: BoundType.exclusive),
        upperBound: UpperBound(value: 9, type: BoundType.inclusive),
      );
      final rangeII = IntRange(
        lowerBound: LowerBound(value: 3, type: BoundType.inclusive),
        upperBound: UpperBound(value: 9, type: BoundType.inclusive),
      );

      expect(rangeIE.equal(rangeIE), true, reason: '[3,10) == [3,10)');
      expect(rangeIE.equal(rangeEE), true, reason: '[3,10) == (2,10)');
      expect(rangeIE.equal(rangeEI), true, reason: '[3,10) == (2,9]');
      expect(rangeIE.equal(rangeII), true, reason: '[3,10) == [3,9]');

      expect(rangeEE.equal(rangeEE), true, reason: '(2,10) == (2,10)');
      expect(rangeEE.equal(rangeEI), true, reason: '(2,10) == (2,9]');
      expect(rangeEE.equal(rangeII), true, reason: '(2,10) == [3,9]');

      expect(rangeEI.equal(rangeEI), true, reason: '(2,9] == (2,9]');
      expect(rangeEI.equal(rangeII), true, reason: '(2,9] == [3,9]');

      expect(rangeII.equal(rangeII), true, reason: '[3,9] == [3,9]');
    });

    test('different bounds double (all combinations)', () {
      final rangeIE = DoubleRange(
        lowerBound: LowerBound(value: 3.1, type: BoundType.inclusive),
        upperBound: UpperBound(value: 10.2, type: BoundType.exclusive),
      );
      final rangeEE = DoubleRange(
        lowerBound: LowerBound(value: 2.1, type: BoundType.exclusive),
        upperBound: UpperBound(value: 10.2, type: BoundType.exclusive),
      );
      final rangeEI = DoubleRange(
        lowerBound: LowerBound(value: 2.1, type: BoundType.exclusive),
        upperBound: UpperBound(value: 9.2, type: BoundType.inclusive),
      );
      final rangeII = DoubleRange(
        lowerBound: LowerBound(value: 3.1, type: BoundType.inclusive),
        upperBound: UpperBound(value: 9.2, type: BoundType.inclusive),
      );

      final rangeIE2 = DoubleRange(
        lowerBound: LowerBound(value: 3.1, type: BoundType.inclusive),
        upperBound: UpperBound(value: 10.2, type: BoundType.exclusive),
      );
      final rangeEE2 = DoubleRange(
        lowerBound: LowerBound(value: 2.1, type: BoundType.exclusive),
        upperBound: UpperBound(value: 10.2, type: BoundType.exclusive),
      );
      final rangeEI2 = DoubleRange(
        lowerBound: LowerBound(value: 2.1, type: BoundType.exclusive),
        upperBound: UpperBound(value: 9.2, type: BoundType.inclusive),
      );
      final rangeII2 = DoubleRange(
        lowerBound: LowerBound(value: 3.1, type: BoundType.inclusive),
        upperBound: UpperBound(value: 9.2, type: BoundType.inclusive),
      );

      expect(rangeIE.equal(rangeIE), true,
          reason: ' [3.1, 10.2) == [3.1, 10.2)');
      expect(rangeIE.equal(rangeEE), false,
          reason: '[3.1, 10.2) == (2.1, 10.2)');
      expect(rangeIE.equal(rangeEI), false,
          reason: '[3.1, 10.2) == (2.1, 9.2]');
      expect(rangeIE.equal(rangeII), false,
          reason: '[3.1, 10.2) == [3.1, 9.2]');
      expect(rangeIE.equal(rangeIE2), true,
          reason: '[3.1, 10.2) == [3.1, 10.2)');

      expect(rangeEE.equal(rangeEE), true, reason: '');
      expect(rangeEE.equal(rangeEI), false, reason: '');
      expect(rangeEE.equal(rangeII), false, reason: '');
      expect(rangeEE.equal(rangeEE2), true, reason: '');

      expect(rangeEI.equal(rangeEI), true, reason: '');
      expect(rangeEI.equal(rangeII), false, reason: '');
      expect(rangeEI.equal(rangeEI2), true, reason: '');

      expect(rangeII.equal(rangeII), true, reason: '');
      expect(rangeII.equal(rangeII2), true, reason: '');
    });
  });
}
