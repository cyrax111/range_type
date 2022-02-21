dart test --coverage=build/coverage/src
format_coverage --lcov --in=build/coverage/src --out=build/coverage/lcov.info --packages=.packages --report-on=lib
genhtml build/coverage/lcov.info -o build/coverage/html