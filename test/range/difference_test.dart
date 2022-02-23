import 'package:range_type/range_type.dart';
import 'package:test/test.dart';

void main() {
  group('Difference -', () {
    group('Discrete:', () {
      group('(,) -', () {
        test('(,)', () {
          expect(
            IntRange.parse('(,)').difference(IntRange.parse('(,)')),
            IntRange.parse('empty'),
          );
        });

        test('(,100)', () {
          expect(
            IntRange.parse('(,)').difference(IntRange.parse('(,100)')),
            IntRange.parse('[100,)'),
          );
        });
        test('[5,)', () {
          expect(
            IntRange.parse('(,)').difference(IntRange.parse('[5,)')),
            IntRange.parse('(,5)'),
          );
        });
        test('[5,100)', () {
          expect(
            () => IntRange.parse('(,)').difference(IntRange.parse('[5,100)')),
            throwsA(isA<ContiguousRangeException>()),
          );
        });
        test('empty', () {
          expect(
            IntRange.parse('(,)').difference(IntRange.parse('empty')),
            IntRange.parse('(,)'),
          );
        });
      });

      group('(,100) -', () {
        test('(,)', () {
          expect(
            IntRange.parse('(,100)').difference(IntRange.parse('(,)')),
            IntRange.parse('empty'),
          );
        });
        test('(,100)', () {
          expect(
            IntRange.parse('(,100)').difference(IntRange.parse('(,100)')),
            IntRange.parse('empty'),
          );
        });
        test('[5,)', () {
          expect(
            IntRange.parse('(,100)').difference(IntRange.parse('[5,)')),
            IntRange.parse('(,5)'),
          );
        });
        test('[5,100)', () {
          expect(
            IntRange.parse('(,100)').difference(IntRange.parse('[5,100)')),
            IntRange.parse('(,5)'),
          );
        });
        test('empty', () {
          expect(
            IntRange.parse('(,100)').difference(IntRange.parse('empty')),
            IntRange.parse('(,100)'),
          );
        });
      });

      group('[5,) -', () {
        test('(,)', () {
          expect(
            IntRange.parse('[5,)').difference(IntRange.parse('(,)')),
            IntRange.parse('empty'),
          );
        });
        test('(,100)', () {
          expect(
            IntRange.parse('[5,)').difference(IntRange.parse('(,100)')),
            IntRange.parse('[100,)'),
          );
        });
        test('[5,)', () {
          expect(
            IntRange.parse('[5,)').difference(IntRange.parse('[5,)')),
            IntRange.parse('empty'),
          );
        });
        test('[5,100)', () {
          expect(
            IntRange.parse('[5,)').difference(IntRange.parse('[5,100)')),
            IntRange.parse('[100,)'),
          );
        });
        test('empty', () {
          expect(
            IntRange.parse('[5,)').difference(IntRange.parse('empty')),
            IntRange.parse('[5,)'),
          );
        });
      });

      group('[5,100) -', () {
        test('(,)', () {
          expect(
            IntRange.parse('[5,100)').difference(IntRange.parse('(,)')),
            IntRange.parse('empty'),
          );
        });
        test('(,100)', () {
          expect(
            IntRange.parse('[5,100)').difference(IntRange.parse('(,100)')),
            IntRange.parse('empty'),
          );
        });
        test('[5,)', () {
          expect(
            IntRange.parse('[5,100)').difference(IntRange.parse('[5,)')),
            IntRange.parse('empty'),
          );
        });
        test('[5,100)', () {
          expect(
            IntRange.parse('[5,100)').difference(IntRange.parse('[5,100)')),
            IntRange.parse('empty'),
          );
        });
        test('empty', () {
          expect(
            IntRange.parse('[5,100)').difference(IntRange.parse('empty')),
            IntRange.parse('[5,100)'),
          );
        });
      });

      group('empty -', () {
        test('(,)', () {
          expect(
            IntRange.parse('empty').difference(IntRange.parse('(,)')),
            IntRange.parse('empty'),
          );
        });
        test('(,100)', () {
          expect(
            IntRange.parse('empty').difference(IntRange.parse('(,100)')),
            IntRange.parse('empty'),
          );
        });
        test('[5,)', () {
          expect(
            IntRange.parse('empty').difference(IntRange.parse('[5,)')),
            IntRange.parse('empty'),
          );
        });
        test('[5,100)', () {
          expect(
            IntRange.parse('empty').difference(IntRange.parse('[5,100)')),
            IntRange.parse('empty'),
          );
        });
        test('empty', () {
          expect(
            IntRange.parse('empty').difference(IntRange.parse('empty')),
            IntRange.parse('empty'),
          );
        });
      });

      group('[1,20) -', () {
        test('(,)', () {
          expect(
            IntRange.parse('[1,20)').difference(IntRange.parse('(,)')),
            IntRange.parse('empty'),
          );
        });
        test('(,100)', () {
          expect(
            IntRange.parse('[1,20)').difference(IntRange.parse('(,100)')),
            IntRange.parse('empty'),
          );
        });
        test('[5,)', () {
          expect(
            IntRange.parse('[1,20)').difference(IntRange.parse('[5,)')),
            IntRange.parse('[1,5)'),
          );
        });
        test('[5,100)', () {
          expect(
            IntRange.parse('[1,20)').difference(IntRange.parse('[5,100)')),
            IntRange.parse('[1,5)'),
          );
        });
        test('empty', () {
          expect(
            IntRange.parse('[1,20)').difference(IntRange.parse('empty')),
            IntRange.parse('[1,20)'),
          );
        });
      });

      group('[80,120) -', () {
        test('(,)', () {
          expect(
            IntRange.parse('[80,120)').difference(IntRange.parse('(,)')),
            IntRange.parse('empty'),
          );
        });
        test('(,100)', () {
          expect(
            IntRange.parse('[80,120)').difference(IntRange.parse('(,100)')),
            IntRange.parse('[100,119]'),
          );
        });
        test('[5,)', () {
          expect(
            IntRange.parse('[80,120)').difference(IntRange.parse('[5,)')),
            IntRange.parse('empty'),
          );
        });
        test('[5,100)', () {
          expect(
            IntRange.parse('[80,120)').difference(IntRange.parse('[5,100)')),
            IntRange.parse('[100,120)'),
          );
        });
        test('empty', () {
          expect(
            IntRange.parse('[80,120)').difference(IntRange.parse('empty')),
            IntRange.parse('[80,120)'),
          );
        });
      });

      test('[0,120) - [5,100)', () {
        expect(
          () => IntRange.parse('[0,120)').difference(IntRange.parse('[5,100)')),
          throwsA(isA<ContiguousRangeException>()),
        );
      });

      test('[5,100) - [0,120)', () {
        expect(
          IntRange.parse('[5,100)').difference(IntRange.parse('[0,120)')),
          IntRange.empty(),
        );
      });
    });
  });
}
