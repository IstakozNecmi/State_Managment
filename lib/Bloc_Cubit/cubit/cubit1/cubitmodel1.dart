

import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  int x;
  CounterCubit(this.x) : super(x);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}