import 'package:range_type/range_type.dart';
import 'package:test/test.dart';

void main() {
  group('Overlap -', () {
    test('Discrete', () {
      expect(
        IntRange.parse('[41,100)').overlap(IntRange.parse('[5,50)')),
        true,
      );
      expect(
        IntRange.parse('[5,50)').overlap(IntRange.parse('[41,100)')),
        true,
      );

      expect(
        IntRange.parse('[5,50)').overlap(IntRange.parse('[16,45)')),
        true,
      );
      expect(
        IntRange.parse('[16,45)').overlap(IntRange.parse('[5,50)')),
        true,
      );

      expect(
        IntRange.parse('[5,50)').overlap(IntRange.parse('[55,100)')),
        false,
      );
      expect(
        IntRange.parse('[55,100)').overlap(IntRange.parse('[5,50)')),
        false,
      );

      expect(
        IntRange.parse('[55,100)').overlap(IntRange.parse('[55,100)')),
        true,
      );
    });
  });
}
