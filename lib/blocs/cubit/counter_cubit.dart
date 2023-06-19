import 'package:bloc_learn/blocs/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitialState());
  int counter = 0;
  void increment() {
    counter++;
    emit(CounterIncrementState()..count = counter);
  }

  void decrement() {
    emit(CounterDecrementState()..count = counter--);
  }
}
