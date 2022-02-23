import 'package:range_type/range_type.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

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

      // test('upper bound is infinite and lower bound is finite', () {
      //   expect(
      //     IntRange.parse('[5,)').difference(IntRange.parse('[5,)')),
      //     IntRange.parse('[5,)'),
      //   );
      //   expect(
      //     IntRange.parse('[5,)').difference(IntRange.parse('[5,100)')),
      //     IntRange.parse('[5,100)'),
      //   );
      //   expect(
      //     IntRange.parse('[5,)').difference(IntRange.parse('empty')),
      //     IntRange.parse('empty'),
      //   );
      // });

      // test('all bound are finite', () {
      //   expect(
      //     IntRange.parse('[5,100)').difference(IntRange.parse('[5,100)')),
      //     IntRange.parse('[5,100)'),
      //   );
      //   expect(
      //     IntRange.parse('[5,100)').difference(IntRange.parse('empty')),
      //     IntRange.parse('empty'),
      //   );
      // });

      // test('empty range', () {
      //   expect(
      //     IntRange.parse('empty').difference(IntRange.parse('empty')),
      //     IntRange.parse('empty'),
      //   );
      // });
    });
  });
}
