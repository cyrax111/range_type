import 'package:range_type/range_type.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Union -', () {
    test('Discrete', () {
      expect(
        IntRange.parse('[41,100)').union(IntRange.parse('[5,50)')),
        IntRange.parse('[5,100)'),
      );
      expect(
        IntRange.parse('[5,50)').union(IntRange.parse('[41,100)')),
        IntRange.parse('[5,100)'),
      );

      expect(
        IntRange.parse('[5,50)').union(IntRange.parse('[16,45)')),
        IntRange.parse('[5,50)'),
      );
      expect(
        IntRange.parse('[16,45)').union(IntRange.parse('[5,50)')),
        IntRange.parse('[5,50)'),
      );

      expect(
        () => IntRange.parse('[5,50)').union(IntRange.parse('[55,100)')),
        throwsA(TypeMatcher<OperationRangeException>()),
      );
      expect(
        () => IntRange.parse('[55,100)').union(IntRange.parse('[5,50)')),
        throwsA(TypeMatcher<OperationRangeException>()),
      );

      expect(
        IntRange.parse('[55,100)').union(IntRange.parse('[55,100)')),
        IntRange.parse('[55,100)'),
      );
    });
  });
}
