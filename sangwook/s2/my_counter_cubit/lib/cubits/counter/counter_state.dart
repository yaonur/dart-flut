// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter_cubit.dart';

enum CounterStatus {initial,loading,success,error}

class CounterState extends Equatable {
  final int counterValue;
  const CounterState({
    required this.counterValue,
  });
  factory CounterState.initial(){
    return const CounterState(counterValue: 0);
  }

  @override
  List<Object> get props => [counterValue];

  @override
  String toString() => 'CounterState(counterValue: $counterValue)';

  CounterState copyWith({
    int? counterValue,
  }) {
    return CounterState(
      counterValue: counterValue ?? this.counterValue,
    );
  }

}
