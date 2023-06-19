abstract class CounterState {
  int count = 0;
}

class CounterInitialState extends CounterState {
  int count = 0;
}

class CounterIncrementState extends CounterState {
  late int count;
}

class CounterDecrementState extends CounterState {
  late int count;
}
