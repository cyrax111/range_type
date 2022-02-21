import 'package:range_type/range_type.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group(
    'is range empty -',
    () {
      test('is range empty', () {
        expect(IntRange.parse('(,)').empty, false, reason: '(,)');
        expect(IntRange.parse('(10,10)').empty, true, reason: '(10,10)');
        expect(IntRange.parse('[11,)').empty, false, reason: '[11,)');
        expect(IntRange.empty().empty, true, reason: 'empty');
        expect(IntRange.empty().notEmpty, false, reason: 'empty');
      });
    },
    skip: false,
  );
}
