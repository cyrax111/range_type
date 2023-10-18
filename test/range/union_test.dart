import 'package:range_type/predefined_ranges.dart';
import 'package:range_type/src/range/exception.dart';
import 'package:test/test.dart';

void main() {
  group('Union -', () {
    group('Discrete:', () {
      group('(,) +', () {
        test('(,)', () {
          expect(
            IntRange.parse('(,)').union(IntRange.parse('(,)')),
            IntRange.parse('(,)'),
          );
        });
        test('(,100)', () {
          expect(
            IntRange.parse('(,)').union(IntRange.parse('(,100)')),
            IntRange.parse('(,)'),
          );
        });
        test('[5,)', () {
          expect(
            IntRange.parse('(,)').union(IntRange.parse('[5,)')),
            IntRange.parse('(,)'),
          );
        });
        test('[5,100)', () {
          expect(
            IntRange.parse('(,)').union(IntRange.parse('[5,100)')),
            IntRange.parse('(,)'),
          );
        });
        test('empty', () {
          expect(
            IntRange.parse('(,)').union(IntRange.parse('empty')),
            IntRange.parse('(,)'),
          );
        });
      });

      group('(,100) +', () {
        test('(,)', () {
          expect(
            IntRange.parse('(,100)').union(IntRange.parse('(,)')),
            IntRange.parse('(,)'),
          );
        });
        test('(,100)', () {
          expect(
            IntRange.parse('(,100)').union(IntRange.parse('(,100)')),
            IntRange.parse('(,100)'),
          );
        });
        test('[5,)', () {
          expect(
            IntRange.parse('(,100)').union(IntRange.parse('[5,)')),
            IntRange.parse('(,)'),
          );
        });
        test('[5,100)', () {
          expect(
            IntRange.parse('(,100)').union(IntRange.parse('[5,100)')),
            IntRange.parse('(,100)'),
          );
        });
        test('empty', () {
          expect(
            IntRange.parse('(,100)').union(IntRange.parse('empty')),
            IntRange.parse('(,100)'),
          );
        });
      });

      group('[5,) +', () {
        test('(,)', () {
          expect(
            IntRange.parse('[5,)').union(IntRange.parse('(,)')),
            IntRange.parse('(,)'),
          );
        });
        test('(,100)', () {
          expect(
            IntRange.parse('[5,)').union(IntRange.parse('(,100)')),
            IntRange.parse('(,)'),
          );
        });
        test('[5,)', () {
          expect(
            IntRange.parse('[5,)').union(IntRange.parse('[5,)')),
            IntRange.parse('[5,)'),
          );
        });
        test('[5,100)', () {
          expect(
            IntRange.parse('[5,)').union(IntRange.parse('[5,100)')),
            IntRange.parse('[5,)'),
          );
        });
        test('empty', () {
          expect(
            IntRange.parse('[5,)').union(IntRange.parse('empty')),
            IntRange.parse('[5,)'),
          );
        });
      });

      group('[5,100) +', () {
        test('(,)', () {
          expect(
            IntRange.parse('[5,100)').union(IntRange.parse('(,)')),
            IntRange.parse('(,)'),
          );
        });
        test('(,100)', () {
          expect(
            IntRange.parse('[5,100)').union(IntRange.parse('(,100)')),
            IntRange.parse('(,100)'),
          );
        });
        test('[5,)', () {
          expect(
            IntRange.parse('[5,100)').union(IntRange.parse('[5,)')),
            IntRange.parse('[5,)'),
          );
        });
        test('[5,100)', () {
          expect(
            IntRange.parse('[5,100)').union(IntRange.parse('[5,100)')),
            IntRange.parse('[5,100)'),
          );
        });
        test('empty', () {
          expect(
            IntRange.parse('[5,100)').union(IntRange.parse('empty')),
            IntRange.parse('[5,100)'),
          );
        });
      });

      group('empty +', () {
        test('(,)', () {
          expect(
            IntRange.parse('empty').union(IntRange.parse('(,)')),
            IntRange.parse('(,)'),
          );
        });
        test('(,100)', () {
          expect(
            IntRange.parse('empty').union(IntRange.parse('(,100)')),
            IntRange.parse('(,100)'),
          );
        });
        test('[5,)', () {
          expect(
            IntRange.parse('empty').union(IntRange.parse('[5,)')),
            IntRange.parse('[5,)'),
          );
        });
        test('[5,100)', () {
          expect(
            IntRange.parse('empty').union(IntRange.parse('[5,100)')),
            IntRange.parse('[5,100)'),
          );
        });
        test('empty', () {
          expect(
            IntRange.parse('empty').union(IntRange.parse('empty')),
            IntRange.parse('empty'),
          );
        });
      });

      group('[1,20) +', () {
        test('(,)', () {
          expect(
            IntRange.parse('[1,20)').union(IntRange.parse('(,)')),
            IntRange.parse('(,)'),
          );
        });
        test('(,100)', () {
          expect(
            IntRange.parse('[1,20)').union(IntRange.parse('(,100)')),
            IntRange.parse('(,100)'),
          );
        });
        test('[5,)', () {
          expect(
            IntRange.parse('[1,20)').union(IntRange.parse('[5,)')),
            IntRange.parse('[1,)'),
          );
        });
        test('[5,100)', () {
          expect(
            IntRange.parse('[1,20)').union(IntRange.parse('[5,100)')),
            IntRange.parse('[1,100)'),
          );
        });
        test('empty', () {
          expect(
            IntRange.parse('[1,20)').union(IntRange.parse('empty')),
            IntRange.parse('[1,20)'),
          );
        });
      });

      group('[80,120) +', () {
        test('(,)', () {
          expect(
            IntRange.parse('[80,120)').union(IntRange.parse('(,)')),
            IntRange.parse('(,)'),
          );
        });
        test('(,100)', () {
          expect(
            IntRange.parse('[80,120)').union(IntRange.parse('(,100)')),
            IntRange.parse('(,119]'),
          );
        });
        test('[5,)', () {
          expect(
            IntRange.parse('[80,120)').union(IntRange.parse('[5,)')),
            IntRange.parse('[5,)'),
          );
        });
        test('[5,100)', () {
          expect(
            IntRange.parse('[80,120)').union(IntRange.parse('[5,100)')),
            IntRange.parse('[5,120)'),
          );
        });
        test('empty', () {
          expect(
            IntRange.parse('[80,120)').union(IntRange.parse('empty')),
            IntRange.parse('[80,120)'),
          );
        });
      });

      test('[0,120) + [5,100)', () {
        expect(
          IntRange.parse('[0,120)').union(IntRange.parse('[5,100)')),
          IntRange.parse('[0,120)'),
        );
      });

      test('[5,100) + [0,120)', () {
        expect(
          IntRange.parse('[5,100)').union(IntRange.parse('[0,120)')),
          IntRange.parse('[0,120)'),
        );
      });

      group('adjacent', () {
        test('[2022-07-01, 2022-08-01) + [2022-08-01, 2022-09-01)', () {
          final dateRange1 = DateTimeRange.parse('[2022-07-01, 2022-08-01)');
          final dateRange2 = DateTimeRange.parse('[2022-08-01, 2022-09-01)');
          expect(dateRange1.union(dateRange2), DateTimeRange.parse('[2022-07-01, 2022-09-01)'));
        });

        test('[2022-07-01, 2022-08-01) + (2022-08-01, 2022-09-01)', () {
          final dateRange1 = DateTimeRange.parse('[2022-07-01, 2022-08-01)');
          final dateRange2 = DateTimeRange.parse('(2022-08-01, 2022-09-01)');
          expect(
            () => dateRange1.union(dateRange2),
            throwsA(isA<OperationRangeException>()),
          );
        });

        test('[2022-07-01, 2022-08-01] + [2022-08-01, 2022-09-01)', () {
          final dateRange1 = DateTimeRange.parse('(2022-07-01, 2022-08-01]');
          final dateRange2 = DateTimeRange.parse('[2022-08-01, 2022-09-01)');
          expect(
            () => dateRange1.union(dateRange2),
            throwsA(isA<OperationRangeException>()),
          );
        });

        test('[5, 100) + [100, 120)', () {
          expect(
            IntRange.parse('[5, 100)').union(IntRange.parse('[100, 120)')),
            IntRange.parse('[5, 120)'),
          );
        });

        test('[5, 100) + (100, 120)', () {
          expect(
            () => IntRange.parse('[5, 100)').union(IntRange.parse('(100, 120)')),
            throwsA(isA<OperationRangeException>()),
          );
        });

        test('[5, 100] + [100, 120)', () {
          expect(
            IntRange.parse('[5, 100]').union(IntRange.parse('[100, 120)')),
            IntRange.parse('[5,120)'),
          );
        });
      });
    });
  });
}
