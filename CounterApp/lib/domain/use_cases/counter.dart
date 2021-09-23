class Counter {
  int _counter;

  Counter() : _counter = 0;

  int get value {
    return _counter;
  }

  void increment() {
    _counter++;
  }

  void decrement() {
    _counter--;
  }

  void reset() {
    _counter = 0;
  }
}
