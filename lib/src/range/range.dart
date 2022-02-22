import 'package:range_type/range_type.dart';

abstract class Range<T> {
  Range({
    Bound<T>? lowerBound,
    Bound<T>? upperBound,
  })  : lowerBound = LowerBound.from(lowerBound),
        upperBound = UpperBound.from(upperBound) {
    assert(() {
      final _lowerBound = LowerBound.from(lowerBound);
      final _upperBound = UpperBound.from(upperBound);
      if (_lowerBound.isFinite && _upperBound.isFinite) {
        return comparator(_upperBound.value!, _lowerBound.value!) >= 0;
      } else {
        return true;
      }
    }(), 'the upper bound must be more or equal then the lower bound');
    empty = _isEmpty();
  }

  Range.empty()
      : lowerBound = const EmptyBound(),
        upperBound = const EmptyBound(),
        empty = true;

  final LowerBound<T> lowerBound;
  final UpperBound<T> upperBound;
  bool get isDiscrete => this is DiscreteRange<T>;

  @override
  String toString() {
    if (empty) {
      return emptyName;
    }
    final space = upperBound.isFinite && lowerBound.isFinite ? ' ' : '';
    return '$lowerBound,$space$upperBound';
  }

  /// Returns a negative number if [value1] is less than [value2], zero if they are
  /// equal, and a positive number if [value1] is greater than [value2].
  /// Almost the same: value1 - value2
  int comparator(T value1, T value2);

  // TODO: rid from late
  late final bool empty;
  bool get notEmpty => !empty;
  bool _isEmpty() {
    assert(lowerBound is EmptyBound && upperBound is EmptyBound ||
        lowerBound is! EmptyBound && upperBound is! EmptyBound);
    if (lowerBound is EmptyBound || upperBound is EmptyBound) {
      return true;
    }
    if (lowerBound.isExclusive &&
        upperBound.isExclusive &&
        (comparator(upperBound.value!, lowerBound.value!) == 0)) {
      return true;
    } else if (lowerBound.isFinite &&
        upperBound.isFinite &&
        (comparator(upperBound.value!, lowerBound.value!) < 0)) {
      return true;
    }

    return false;
  }

  static const String emptyName = 'empty';

  bool equal(Range<T> range) {
    if (empty && range.empty) {
      return true;
    }
    final isLowerBoundEqual = _isBoundsEqual(lowerBound, range.lowerBound);
    final isUpperBoundEqual = _isBoundsEqual(upperBound, range.upperBound);
    return isLowerBoundEqual && isUpperBoundEqual;
  }

  bool _isBoundsEqual(Bound<T> bound1, Bound<T> bound2) =>
      _compareBounds(bound1, bound2) == 0;

  int _compareBounds(Bound<T> bound1, Bound<T> bound2) {
    assert(bound1 is! EmptyBound && bound2 is! EmptyBound);
    //TODO: remove comments here

    // assert(bound1 is LowerBound && bound2 is LowerBound ||
    //     bound1 is UpperBound && bound2 is UpperBound);

    // if(bound1.runtimeType == bound2.runtimeType)

    final areLowerBound = bound1 is LowerBound;
    final lowerUpperSignChanger = 1; //areLowerBound ? 1 : -1;

    if (bound1.isInfinite && bound2.isInfinite) {
      if (bound1.runtimeType == bound2.runtimeType) {
        return 0;
      } else if (bound1 is LowerBound && bound2 is UpperBound) {
        return -1;
      } else if (bound1 is UpperBound && bound2 is LowerBound) {
        return 1;
      } else {
        return throw UnimplementedRangeException();
      }
    } else if (bound1.isInfinite && bound2.isFinite) {
      if (bound1 is LowerBound) {
        return -1;
      } else if (bound1 is UpperBound) {
        return 1;
      } else {
        return throw UnimplementedRangeException();
      }
    } else if (bound1.isFinite && bound2.isInfinite) {
      if (bound2 is LowerBound) {
        return 1;
      } else if (bound2 is UpperBound) {
        return -1;
      } else {
        return throw UnimplementedRangeException();
      }
    } else {
      // both are finite
      if (bound1.type == bound2.type) {
        return comparator(bound1.value!, bound2.value!) * lowerUpperSignChanger;
      } else {
        if (comparator(bound1.value!, bound2.value!) == 0) {
          if (bound1.isInclusive && bound2.isExclusive) {
            return -1 * lowerUpperSignChanger;
          } else {
            return 1 * lowerUpperSignChanger;
          }
        } else {
          return comparator(bound1.value!, bound2.value!) *
              lowerUpperSignChanger;
        }
      }
    }
  }

  bool contains(Range<T> range) {
    if (empty && range.empty) {
      return true;
    } else if (empty && range.notEmpty) {
      return false;
    } else if (notEmpty && range.empty) {
      return true;
    }
    return _compareBounds(lowerBound, range.lowerBound) <= 0 &&
        _compareBounds(upperBound, range.upperBound) >= 0;
  }

  bool notEqual(Range<T> range) => !equal(range);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Range<T> && equal(other);
  }

  @override
  int get hashCode =>
      lowerBound.hashCode ^ upperBound.hashCode ^ empty.hashCode;

  bool containsElement(T element) {
    if (empty) {
      return false;
    }
    final isLowerBoundSatisfied = _isBoundSatisfied(lowerBound, element);
    final isUpperBoundSatisfied = _isBoundSatisfied(upperBound, element);
    return isLowerBoundSatisfied && isUpperBoundSatisfied;
  }

  bool _isBoundSatisfied(Bound<T> bound, T element) {
    if (bound.isFinite) {
      int compareResult;
      if (bound is LowerBound) {
        compareResult = comparator(element, bound.value!);
      } else {
        compareResult = comparator(bound.value!, element);
      }
      if (bound.isInclusive && compareResult >= 0) {
        return true;
      } else if (bound.isExclusive && compareResult > 0) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  bool overlap(Range<T> range) => intersection(range).notEmpty;

  // bool isAdjacentTo(Range<T> range);

  /// result of range union would not be contiguous
  /// +
  Range<T> union(Range<T> range) {
    if (range.empty) {
      return this;
    }
    if (empty) {
      return range;
    }

    final hasNoOverlap = !overlap(range);
    if (hasNoOverlap) {
      throw OperationRangeException(
          'result of range union would not be contiguous');
    }

    final _lowerBound = _minBound(lowerBound, range.lowerBound);
    final _upperBound = _maxBound(upperBound, range.upperBound);

    return createRange(lowerBound: _lowerBound, upperBound: _upperBound);
  }

  /// empty
  /// *
  Range<T> intersection(Range<T> range) {
    if (empty || range.empty) {
      return _createEmptyRange();
    }

    final _lowerBound = _maxBound(lowerBound, range.lowerBound);
    final _upperBound = _minBound(upperBound, range.upperBound);

    final isIntersection = _compareBounds(_upperBound, _lowerBound) > 0;
    if (isIntersection) {
      return createRange(lowerBound: _lowerBound, upperBound: _upperBound);
    } else {
      return _createEmptyRange();
    }
  }

  Range<T> createRange({
    Bound<T>? lowerBound,
    Bound<T>? upperBound,
    bool empty = false,
  });

  Range<T> _createEmptyRange() => createRange(empty: true);

  Bound<T> _maxBound(Bound<T> bound1, Bound<T> bound2) {
    if (_compareBounds(bound1, bound2) > 0) {
      return bound1;
    } else {
      return bound2;
    }
  }

  Bound<T> _minBound(Bound<T> bound1, Bound<T> bound2) {
    if (_compareBounds(bound1, bound2) < 0) {
      return bound1;
    } else {
      return bound2;
    }
  }

  /// -
  /// result of range difference would not be contiguous
  Range<T> difference(Range<T> range) {
    if (empty) {
      return _createEmptyRange();
    }
    if (range.empty) {
      return this;
    }

    if (strictlyRightOf(range) || strictlyLeftOf(range)) {
      return this;
    }

    if (contains(range) || notEqual(range)) {
      throw OperationRangeException(
          'result of range difference would not be contiguous');
    }
    if (range.contains(this)) {
      return _createEmptyRange();
    }

    if (overlap(range)) {
      final _lowerBound = _maxBound(lowerBound, range.lowerBound);
      final _upperBound = _minBound(upperBound, range.upperBound);
      return createRange(lowerBound: _lowerBound, upperBound: _upperBound);
    }

    // assert(false, 'non-existent range case');
    throw OperationRangeException('non-existent range case');
  }

  bool lessThan(Range<T> range) {
    if (range.empty) {
      return false;
    } else if (empty) {
      return true;
    }
    return _compareBounds(lowerBound, range.lowerBound) < 0;
  }

  bool lessThanOrEqual(Range<T> range) {
    if (range.empty) {
      return false;
    } else if (empty) {
      return true;
    }
    return _compareBounds(lowerBound, range.lowerBound) <= 0;
  }

  bool greaterThan(Range<T> range) {
    if (empty) {
      return false;
    } else if (range.empty) {
      return true;
    }
    return _compareBounds(lowerBound, range.lowerBound) > 0;
  }

  bool greaterThanOrEqual(Range<T> range) {
    if (empty) {
      return false;
    } else if (range.empty) {
      return true;
    }
    return _compareBounds(lowerBound, range.lowerBound) >= 0;
  }

  bool strictlyLeftOf(Range<T> range) {
    if (empty || range.empty) {
      return false;
    }
    return _compareBounds(upperBound, range.lowerBound) < 0;
  }

  bool strictlyRightOf(Range<T> range) {
    if (empty || range.empty) {
      return false;
    }
    return _compareBounds(lowerBound, range.upperBound) > 0;
  }

  bool notExtendToTheRightOf(Range<T> range) {
    if (empty || range.empty) {
      return false;
    }
    return _compareBounds(upperBound, range.upperBound) <= 0;
  }

  bool notExtendToTheLeftOf(Range<T> range) {
    if (empty || range.empty) {
      return false;
    }
    return _compareBounds(lowerBound, range.lowerBound) >= 0;
  }

  // TODO: bool isAdjacentTo(Range<T> range) {
  //   if (isDiscrete) {
  //     return _isBoundsEqual(lowerBound, range.upperBound) ||
  //         _isBoundsEqual(upperBound, range.lowerBound);
  //   } else {}
  // }
}
