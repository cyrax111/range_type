import 'package:range_type/range_type.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Intersection -', () {
    group('Discrete:', () {});

    group('(,) *', () {
      test('(,)', () {
        expect(
          IntRange.parse('(,)').intersection(IntRange.parse('(,)')),
          IntRange.parse('(,)'),
        );
      });

      test('(,100)', () {
        expect(
          IntRange.parse('(,)').intersection(IntRange.parse('(,100)')),
          IntRange.parse('(,100)'),
        );
      });

      test('[5,)', () {
        expect(
          IntRange.parse('(,)').intersection(IntRange.parse('[5,)')),
          IntRange.parse('[5,)'),
        );
      });

      test('[5,100)', () {
        expect(
          IntRange.parse('(,)').intersection(IntRange.parse('[5,100)')),
          IntRange.parse('[5,100)'),
        );
      });

      test('empty', () {
        expect(
          IntRange.parse('(,)').intersection(IntRange.parse('empty')),
          IntRange.parse('empty'),
        );
      });
    });

    group('(,100) *', () {
      test('(,)', () {
        expect(
          IntRange.parse('(,100)').intersection(IntRange.parse('(,)')),
          IntRange.parse('(,100)'),
        );
      });

      test('(,100)', () {
        expect(
          IntRange.parse('(,100)').intersection(IntRange.parse('(,100)')),
          IntRange.parse('(,100)'),
        );
      });

      test('[5,)', () {
        expect(
          IntRange.parse('(,100)').intersection(IntRange.parse('[5,)')),
          IntRange.parse('[5,100)'),
        );
      });

      test('[5,100)', () {
        expect(
          IntRange.parse('(,100)').intersection(IntRange.parse('[5,100)')),
          IntRange.parse('[5,100)'),
        );
      });

      test('empty', () {
        expect(
          IntRange.parse('(,100)').intersection(IntRange.parse('empty')),
          IntRange.parse('empty'),
        );
      });
    });

    group('[5,) *', () {
      test('(,)', () {
        expect(
          IntRange.parse('[5,)').intersection(IntRange.parse('(,)')),
          IntRange.parse('[5,)'),
        );
      });

      test('(,100)', () {
        expect(
          IntRange.parse('[5,)').intersection(IntRange.parse('(,100)')),
          IntRange.parse('[5,100)'),
        );
      });

      test('[5,)', () {
        expect(
          IntRange.parse('[5,)').intersection(IntRange.parse('[5,)')),
          IntRange.parse('[5,]'),
        );
      });

      test('[5,100)', () {
        expect(
          IntRange.parse('[5,)').intersection(IntRange.parse('[5,100)')),
          IntRange.parse('[5,100)'),
        );
      });

      test('empty', () {
        expect(
          IntRange.parse('[5,)').intersection(IntRange.parse('empty')),
          IntRange.parse('empty'),
        );
      });
    });

    group('[5,100) *', () {
      test('(,)', () {
        expect(
          IntRange.parse('[5,100)').intersection(IntRange.parse('(,)')),
          IntRange.parse('[5,100)'),
        );
      });

      test('(,100)', () {
        expect(
          IntRange.parse('[5,100)').intersection(IntRange.parse('(,100)')),
          IntRange.parse('[5,100)'),
        );
      });

      test('[5,)', () {
        expect(
          IntRange.parse('[5,100)').intersection(IntRange.parse('[5,)')),
          IntRange.parse('[5,100)'),
        );
      });

      test('[5,100)', () {
        expect(
          IntRange.parse('[5,100)').intersection(IntRange.parse('[5,100)')),
          IntRange.parse('[5,100)'),
        );
      });

      test('empty', () {
        expect(
          IntRange.parse('[5,100)').intersection(IntRange.parse('empty')),
          IntRange.parse('empty'),
        );
      });
    });

    group('empty *', () {
      test('(,)', () {
        expect(
          IntRange.parse('empty').intersection(IntRange.parse('(,)')),
          IntRange.parse('empty'),
        );
      });

      test('(,100)', () {
        expect(
          IntRange.parse('empty').intersection(IntRange.parse('(,100)')),
          IntRange.parse('empty'),
        );
      });

      test('[5,)', () {
        expect(
          IntRange.parse('empty').intersection(IntRange.parse('[5,)')),
          IntRange.parse('empty'),
        );
      });

      test('[5,100)', () {
        expect(
          IntRange.parse('empty').intersection(IntRange.parse('[5,100)')),
          IntRange.parse('empty'),
        );
      });

      test('empty', () {
        expect(
          IntRange.parse('empty').intersection(IntRange.parse('empty')),
          IntRange.parse('empty'),
        );
      });
    });

    test('empty range', () {
      expect(
        IntRange.parse('empty').intersection(IntRange.parse('empty')),
        IntRange.parse('empty'),
      );
    });
  });

  group('[1,20) *', () {
    test('(,)', () {
      expect(
        IntRange.parse('[1,20)').intersection(IntRange.parse('(,)')),
        IntRange.parse('[1,20)'),
      );
    });
    test('(,100)', () {
      expect(
        IntRange.parse('[1,20)').intersection(IntRange.parse('(,100)')),
        IntRange.parse('[1,20)'),
      );
    });
    test('[5,)', () {
      expect(
        IntRange.parse('[1,20)').intersection(IntRange.parse('[5,)')),
        IntRange.parse('[5,20)'),
      );
    });
    test('[5,100)', () {
      expect(
        IntRange.parse('[1,20)').intersection(IntRange.parse('[5,100)')),
        IntRange.parse('[5,20)'),
      );
    });
    test('empty', () {
      expect(
        IntRange.parse('[1,20)').intersection(IntRange.parse('empty')),
        IntRange.parse('empty'),
      );
    });
  });

  group('[80,120) *', () {
    test('(,)', () {
      expect(
        IntRange.parse('[80,120)').intersection(IntRange.parse('(,)')),
        IntRange.parse('[80,120)'),
      );
    });
    test('(,100)', () {
      expect(
        IntRange.parse('[80,120)').intersection(IntRange.parse('(,100)')),
        IntRange.parse('[80,100)'),
      );
    });
    test('[5,)', () {
      expect(
        IntRange.parse('[80,120)').intersection(IntRange.parse('[5,)')),
        IntRange.parse('[80,120)'),
      );
    });
    test('[5,100)', () {
      expect(
        IntRange.parse('[80,120)').intersection(IntRange.parse('[5,100)')),
        IntRange.parse('[80,100)'),
      );
    });
    test('empty', () {
      expect(
        IntRange.parse('[80,120)').intersection(IntRange.parse('empty')),
        IntRange.parse('empty'),
      );
    });
  });
}
