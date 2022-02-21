import 'package:range_type/range_type.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('RangeParser -', () {
    group('discrete -', () {
      test('(10, 30]', () {
        final etalonRange = IntRange(
          lowerBound: LowerBound(value: 10, type: BoundType.exclusive),
          upperBound: UpperBound(value: 30, type: BoundType.inclusive),
        );
        expect(IntRange.parse('(10, 30]').equal(etalonRange), true);
      });

      test('[10,)', () {
        final etalonRange = IntRange(
          lowerBound: LowerBound(value: 10, type: BoundType.inclusive),
        );
        expect(IntRange.parse('[10,)').equal(etalonRange), true);
      });

      test('(,40]', () {
        final etalonRange = IntRange(
          upperBound: UpperBound(value: 40, type: BoundType.inclusive),
        );
        expect(IntRange.parse('(,40]').equal(etalonRange), true);
      });

      test('(,)', () {
        final etalonRange = IntRange();
        expect(IntRange.parse('(,)').equal(etalonRange), true);
      });

      test('wrong string', () {
        expect(
            () => IntRange.parse('(-,,)'), throwsA(isA<ParseRangeException>()));
      });
    });

    group('continuos -', () {
      test('(2001.01.01, 2012.01.01]', () {
        final etalonRange = DateTimeRange(
          lowerBound: LowerBound(
              value: DateTime(2001, 01, 01), type: BoundType.exclusive),
          upperBound: UpperBound(
              value: DateTime(2021, 01, 01), type: BoundType.inclusive),
        );
        expect(
            DateTimeRange.parse('(2001-01-01, 2021-01-01]').equal(etalonRange),
            true);
      });

      test('[2001-01-01,)', () {
        final etalonRange = DateTimeRange(
          lowerBound: LowerBound(
              value: DateTime(2001, 01, 01), type: BoundType.inclusive),
        );
        expect(DateTimeRange.parse('[2001-01-01,)').equal(etalonRange), true);
      });

      test('(,2021-01-01]', () {
        final etalonRange = DateTimeRange(
          upperBound: UpperBound(
              value: DateTime(2021, 01, 01), type: BoundType.inclusive),
        );
        expect(DateTimeRange.parse('(,2021-01-01]').equal(etalonRange), true);
      });

      test('(,)', () {
        final etalonRange = DateTimeRange();
        expect(DateTimeRange.parse('(,)').equal(etalonRange), true);
      });

      test('wrong string', () {
        expect(() => DateTimeRange.parse('[2001,)'),
            throwsA(isA<ParseRangeException>()));
      });
    });
  });
}
