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
    test('Discrete', () {
      expect(
        IntRange.parse('[41,100)').intersection(IntRange.parse('[5,50)')),
        IntRange.parse('[41,50)'),
      );
      expect(
        IntRange.parse('[5,50)').intersection(IntRange.parse('[41,100)')),
        IntRange.parse('[41,50)'),
      );

      expect(
        IntRange.parse('[5,50)').intersection(IntRange.parse('[16,45)')),
        IntRange.parse('[16,45)'),
      );
      expect(
        IntRange.parse('[16,45)').intersection(IntRange.parse('[5,50)')),
        IntRange.parse('[16,45)'),
      );

      expect(
        IntRange.parse('[5,50)').intersection(IntRange.parse('[55,100)')),
        IntRange.parse('empty'),
      );
      expect(
        IntRange.parse('[55,100)').intersection(IntRange.parse('[5,50)')),
        IntRange.parse('empty'),
      );

      expect(
        IntRange.parse('[55,100)').intersection(IntRange.parse('[55,100)')),
        IntRange.parse('[55,100)'),
      );
    });
  });
}
