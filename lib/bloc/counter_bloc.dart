import 'package:bloc/bloc.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncEvent>((event, emit) => onIncrement(event, emit));
    on<CounterDecEvent>((event, emit) => onDecrement(event, emit));
  }

  onIncrement(CounterIncEvent event, Emitter<int> emit) {
    emit(state + 1);
  }

  onDecrement(CounterDecEvent event, Emitter<int> emit) {
    if (state <= 0) return;
    emit(state - 1);
  }
}

abstract class CounterEvent {}

class CounterIncEvent extends CounterEvent {}

class CounterDecEvent extends CounterEvent {}
