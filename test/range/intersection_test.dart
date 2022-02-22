import 'package:range_type/range_type.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test(
    'description',
    () {
      final generator = IntRangeGenerator(
        lowerBoundValue: 41,
        upperBoundValue: 100,
      );
      final generated = generator.generate();
    },
    skip: true,
  );

  group('Intersection -', () {
    group('Discrete -', () {});

    test('all bounds are infinite', () {
      expect(
        IntRange.parse('(,)').intersection(IntRange.parse('(,)')),
        IntRange.parse('(,)'),
      );
      expect(
        IntRange.parse('(,)').intersection(IntRange.parse('(,100)')),
        IntRange.parse('(,100)'),
      );
      expect(
        IntRange.parse('(,)').intersection(IntRange.parse('[5,)')),
        IntRange.parse('[5,)'),
      );
      expect(
        IntRange.parse('(,)').intersection(IntRange.parse('[5,100)')),
        IntRange.parse('[5,100)'),
      );
      expect(
        IntRange.parse('(,)').intersection(IntRange.parse('empty')),
        IntRange.parse('empty'),
      );
    });

    test('lower bound is infinite and upper bound is finite', () {
      expect(
        IntRange.parse('(,100)').intersection(IntRange.parse('(,100)')),
        IntRange.parse('(,100)'),
      );
      expect(
        IntRange.parse('(,100)').intersection(IntRange.parse('[5,)')),
        IntRange.parse('[5,100)'),
      );
      expect(
        IntRange.parse('(,100)').intersection(IntRange.parse('[5,100)')),
        IntRange.parse('[5,100)'),
      );
      expect(
        IntRange.parse('(,100)').intersection(IntRange.parse('empty')),
        IntRange.parse('empty'),
      );
    });

    test('upper bound is infinite and lower bound is finite', () {
      expect(
        IntRange.parse('[5,)').intersection(IntRange.parse('[5,)')),
        IntRange.parse('[5,)'),
      );
      expect(
        IntRange.parse('[5,)').intersection(IntRange.parse('[5,100)')),
        IntRange.parse('[5,100)'),
      );
      expect(
        IntRange.parse('[5,)').intersection(IntRange.parse('empty')),
        IntRange.parse('empty'),
      );
    });

    test('all bound are finite', () {
      expect(
        IntRange.parse('[5,100)').intersection(IntRange.parse('[5,100)')),
        IntRange.parse('[5,100)'),
      );
      expect(
        IntRange.parse('[5,100)').intersection(IntRange.parse('empty')),
        IntRange.parse('empty'),
      );
    });

    test('empty range', () {
      expect(
        IntRange.parse('empty').intersection(IntRange.parse('empty')),
        IntRange.parse('empty'),
      );
    });
  });
}
