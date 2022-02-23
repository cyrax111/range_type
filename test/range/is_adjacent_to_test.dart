import 'package:range_type/predefined_ranges.dart';
import 'package:test/test.dart';

void main() {
  group('isAdjacentTo', () {
    group('Discrete:', () {
      test('[20,100) | [100, 130)', () {
        expect(
          IntRange.parse('[20,100)').isAdjacentTo(IntRange.parse('[100, 130)')),
          true,
        );
      });
      test('[20,100] | [100, 130)', () {
        expect(
          IntRange.parse('[20,100]').isAdjacentTo(IntRange.parse('[100, 130)')),
          false,
        );
      });
      test('[20,100) | (100, 130)', () {
        expect(
          IntRange.parse('[20,100)').isAdjacentTo(IntRange.parse('(100, 130)')),
          false,
        );
      });
      test('(,100) | [100, )', () {
        expect(
          IntRange.parse('(,100)').isAdjacentTo(IntRange.parse('[100,)')),
          true,
        );
      });
    });
  });
}
