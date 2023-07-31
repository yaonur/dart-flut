import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  void increment(){
    print("increment");
    emit (state.copyWith(counterValue: state.counterValue + 1));
  }
  void decrement(){
    emit (state.copyWith(counterValue: state.counterValue - 1));
  }
}
