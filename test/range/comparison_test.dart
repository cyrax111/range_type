import 'package:range_type/range_type.dart';
import 'package:test/test.dart';

void main() {
  group('Comparison -', () {
    //TODO: other comparison tests
    test('less than', () {
      expect(
        IntRange.parse('[41,100)').lessThan(IntRange.parse('[5,50)')),
        false,
      );

      expect(
        IntRange.parse('[1,100)').lessThan(IntRange.parse('[5,50)')),
        true,
      );

      expect(
        IntRange.parse('[5,100)').lessThan(IntRange.parse('[5,50)')),
        false,
      );

      expect(
        IntRange.parse('empty').lessThan(IntRange.parse('[5,50)')),
        true,
      );

      expect(
        IntRange.parse('[5,100)').lessThan(IntRange.parse('empty')),
        false,
      );
    });
  });
}
