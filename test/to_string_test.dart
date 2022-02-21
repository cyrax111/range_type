import 'package:range_type/range_type.dart';
import 'package:test/test.dart';

void main() {
  group('toString -', () {
    group('discrete -', () {
      test('IntRange', () {
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

        final rangeInfI = IntRange(
          upperBound: UpperBound(value: 9, type: BoundType.inclusive),
        );
        final rangeIInf = IntRange(
          lowerBound: LowerBound(value: 3, type: BoundType.inclusive),
        );
        final rangeInfE = IntRange(
          upperBound: UpperBound(value: 9, type: BoundType.exclusive),
        );
        final rangeEInf = IntRange(
          lowerBound: LowerBound(value: 3, type: BoundType.exclusive),
        );
        final rangeInfInf = IntRange();

        expect(rangeIE.toString(), '[3, 10)', reason: 'rangeIE');
        expect(rangeEE.toString(), '[3, 10)', reason: 'rangeEE');
        expect(rangeEI.toString(), '[3, 10)', reason: 'rangeEI');
        expect(rangeII.toString(), '[3, 10)', reason: 'rangeII');

        expect(rangeInfI.toString(), '(,10)', reason: 'rangeInfI');
        expect(rangeIInf.toString(), '[3,)', reason: 'rangeIInf');
        expect(rangeInfE.toString(), '(,9)', reason: 'rangeInfE');
        expect(rangeEInf.toString(), '[4,)', reason: 'rangeEInf');
        expect(rangeInfInf.toString(), '(,)', reason: 'rangeInfInf');
      });
    });

    group('continuos -', () {
      test('DoubleRange', () {
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

        final rangeInfI = DoubleRange(
          upperBound: UpperBound(value: 9.3, type: BoundType.inclusive),
        );
        final rangeIInf = DoubleRange(
          lowerBound: LowerBound(value: 3.4, type: BoundType.inclusive),
        );
        final rangeInfE = DoubleRange(
          upperBound: UpperBound(value: 9.5, type: BoundType.exclusive),
        );
        final rangeEInf = DoubleRange(
          lowerBound: LowerBound(value: 3.1, type: BoundType.exclusive),
        );
        final rangeInfInf = IntRange();

        expect(rangeIE.toString(), '[3.1, 10.2)', reason: 'rangeIE');
        expect(rangeEE.toString(), '(2.1, 10.2)', reason: 'rangeEE');
        expect(rangeEI.toString(), '(2.1, 9.2]', reason: 'rangeEI');
        expect(rangeII.toString(), '[3.1, 9.2]', reason: 'rangeII');

        expect(rangeInfI.toString(), '(,9.3]', reason: 'rangeInfI');
        expect(rangeIInf.toString(), '[3.4,)', reason: 'rangeIInf');
        expect(rangeInfE.toString(), '(,9.5)', reason: 'rangeInfE');
        expect(rangeEInf.toString(), '(3.1,)', reason: 'rangeEInf');
        expect(rangeInfInf.toString(), '(,)', reason: 'rangeInfInf');
      });

      test('DateTime', () {
        final rangeIE = DateTimeRange(
          lowerBound: LowerBound(
              value: DateTime(2050, 01, 03), type: BoundType.inclusive),
          upperBound: UpperBound(
              value: DateTime(2051, 09, 26), type: BoundType.exclusive),
        );
        final rangeII = DateTimeRange(
          lowerBound: LowerBound(
              value: DateTime(2050, 01, 03), type: BoundType.inclusive),
          upperBound: UpperBound(
              value: DateTime(2051, 09, 26), type: BoundType.inclusive),
        );

        final rangeInfI = DateTimeRange(
          upperBound: UpperBound(
              value: DateTime(2050, 01, 03), type: BoundType.inclusive),
        );

        expect(rangeIE.toString(),
            '[2050-01-03 00:00:00.000, 2051-09-26 00:00:00.000)',
            reason: 'rangeIE');
        expect(rangeII.toString(),
            '[2050-01-03 00:00:00.000, 2051-09-26 00:00:00.000]',
            reason: 'rangeII');

        expect(rangeInfI.toString(), '(,2050-01-03 00:00:00.000]',
            reason: 'rangeInfI');
      });
    });
  });
}
