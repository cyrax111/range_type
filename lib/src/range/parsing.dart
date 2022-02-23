import 'package:range_type/range_type.dart';

typedef Parser<T> = T Function(String strT);

class RangeParser<T> {
  factory RangeParser(String range, Parser<T> parser) {
    try {
      return _parse<T>(range, parser);
    } on ParseRangeException catch (_) {
      rethrow;
    } catch (e) {
      throw ParseRangeException(e);
    }
  }
  const RangeParser._({required this.lowerBound, required this.upperBound});

  static RangeParser<T> _parse<T>(String range, Parser<T> parser) {
    final trimmed = range.trim();
    if (_isEmpty(trimmed)) {
      return RangeParser._(
        lowerBound: EmptyBound<T>(),
        upperBound: EmptyBound<T>(),
      );
    }
    final lowerBoundTypeStr = trimmed.substring(0, 1);
    final upperBoundTypeStr = trimmed.substring(trimmed.length - 1);

    final boundValues = trimmed.substring(1, trimmed.length - 1).split(',');
    final lowerBoundValueStr = boundValues[0].trim();
    final upperBoundValueStr = boundValues[1].trim();

    final lowerBoundType = _getBoundType(lowerBoundTypeStr, lowerBoundValueStr);
    final upperBoundType = _getBoundType(upperBoundTypeStr, upperBoundValueStr);

    final lowerBoundValue =
        _getBoundValue(lowerBoundType, lowerBoundValueStr, parser);
    final upperBoundValue =
        _getBoundValue(upperBoundType, upperBoundValueStr, parser);

    return RangeParser._(
      lowerBound: LowerBound<T>(value: lowerBoundValue, type: lowerBoundType),
      upperBound: UpperBound<T>(value: upperBoundValue, type: upperBoundType),
    );
  }

  static bool _isEmpty(String range) => range == Range.emptyName;

  static BoundType _getBoundType(String boundType, String boundValue) {
    if (boundValue.isEmpty) {
      return BoundType.unbounded;
    } else if (boundType == '(' || boundType == ')') {
      return BoundType.exclusive;
    }
    if (boundType == '[' || boundType == ']') {
      return BoundType.inclusive;
    } else {
      throw ParseRangeException('Unknown bound type "$boundType"');
    }
  }

  static T? _getBoundValue<T>(
      BoundType boundType, String boundValue, Parser<T> parser) {
    if (boundType == BoundType.unbounded) {
      return null;
    } else {
      return parser(boundValue);
    }
  }

  final Bound<T> lowerBound;
  final Bound<T> upperBound;
}
