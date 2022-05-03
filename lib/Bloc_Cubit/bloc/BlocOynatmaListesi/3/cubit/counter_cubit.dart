import 'package:bloc/bloc.dart';


part 'counter_state.dart';

class CounterCubit3 extends Cubit<CounterState> {
  CounterCubit3() : super(CounterState(counterValue: 0));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));
}
