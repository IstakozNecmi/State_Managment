part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counterValue;
  CounterState({required this.counterValue});

  @override
  List<Object> get props => [counterValue];

}

class CounterInitial extends CounterState {
  CounterInitial() : super(counterValue: 0);
}

class IncrementState extends CounterState {
  IncrementState(int increasedValue) : super(counterValue: increasedValue);
}

class DecrementState extends CounterState {
  DecrementState(int decreasedValue) : super(counterValue: decreasedValue);
}
