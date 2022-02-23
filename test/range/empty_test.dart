import 'package:range_type/predefined_ranges.dart';
import 'package:test/test.dart';

void main() {
  group(
    'is range empty -',
    () {
      test('(,)', () {
        expect(IntRange.parse('(,)').empty, false, reason: '(,)');
      });
      test('(10,10)', () {
        expect(IntRange.parse('(10,10)').empty, true, reason: '(10,10)');
      });
      test('[11,)', () {
        expect(IntRange.parse('[11,)').empty, false, reason: '[11,)');
      });
      test('IntRange.empty()', () {
        expect(IntRange.empty().empty, true, reason: 'empty');
      });
      test('IntRange.empty().notEmpty', () {
        expect(IntRange.empty().notEmpty, false, reason: 'empty');
      });
      test('[100,100)', () {
        expect(
          IntRange.parse('[100,100)').empty,
          true,
        );
      });
      test('[100,100]', () {
        expect(
          IntRange.parse('[100,100]').notEmpty,
          true,
        );
      });
    },
    skip: false,
  );
}
