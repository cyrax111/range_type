import 'package:range_type/predefined_ranges.dart';
import 'package:range_type/range_generator.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('RangeIntGenerator', () {
    final generator = IntRangeGenerator(
      lowerBoundValue: 5,
      upperBoundValue: 100,
    );
    final generated = generator.generate();
    final expected = [
      IntRange.parse('empty'),
      IntRange.parse('(,)'),
      // half limited
      IntRange.parse('(,100)'),
      IntRange.parse('(,100]'),
      IntRange.parse('(5,)'),
      IntRange.parse('[5,)'),
      // limited
      IntRange.parse('[5,100)'),
      IntRange.parse('(5,100]'),
      IntRange.parse('[5,100]'),
      IntRange.parse('(5,100)'),
    ];
    expect(
      generated.map((e) => e.toString()).toList(),
      expected.map((e) => e.toString()).toList(),
      reason: 'string comparison',
      skip: false,
    );
    expect(
      generated,
      expected,
      reason: 'objects comparison',
      skip: false,
    );
  });
}
