import "package:flutter_bloc/flutter_bloc.dart";

// * Events
sealed class CounterEvent {}

final class CounterIncrementPressed extends CounterEvent {}

final class CounterDecrementPressed extends CounterEvent {}

// * States
sealed class CounterState {
  final int counter;
  const CounterState({required this.counter});
}

class InitialState extends CounterState {
  const InitialState() : super(counter: 0);
}

class IncrementState extends CounterState {
  const IncrementState(int increment) : super(counter: increment);
}

class DecrementState extends CounterState {
  const DecrementState(int increment) : super(counter: increment);
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const InitialState()) {
    on<CounterIncrementPressed>(
        (event, emit) => emit(IncrementState(state.counter + 1)));
    on<CounterDecrementPressed>(
        (event, emit) => emit(DecrementState(state.counter - 1)));
  }
}
