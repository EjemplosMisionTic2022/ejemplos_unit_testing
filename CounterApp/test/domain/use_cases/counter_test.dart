import 'package:counter_app/domain/use_cases/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("counter-test", () {
    late Counter counter;

    setUp(() {
      counter = Counter();
    });

    test("initialization", () {
      expect(counter.value, 0);
    });

    test("increment", () {
      counter.increment();
      expect(counter.value, 1);
    });

    test("decrement", () {
      counter.decrement();
      expect(counter.value, -1);
    });

    test("reset", () {
      counter.increment();
      expect(counter.value, 1);
      counter.reset();
      expect(counter.value, 0);
    });
  });
}
