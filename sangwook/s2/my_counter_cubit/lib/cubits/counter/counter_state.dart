part of 'counter_cubit.dart';

enum CounterStatus {initial,loading,success,error}
@immutable
abstract class CounterState extends Equatable  {
  const CounterState();
  @override 
  List<Object> get props => [];
}

class CounterInitial extends CounterState {}
