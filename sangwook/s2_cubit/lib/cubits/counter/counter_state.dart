// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter_cubit.dart';

class CounterState {
  final int counter;
  CounterState({required this.counter});

  factory CounterState.initial() => CounterState(counter: 0);

  @override
  List<Object?> get props => [counter];

  @override
  String toString() => 'CounterState(counter: $counter)';
  CounterState copyWith({int? counter}) {
    return CounterState(counter: counter ?? this.counter);
  }
}
// class CounterState  {
//   final int counter;
//
//   CounterState(this.counter);
//
//   @override
//   List<Object> get props => [counter];
//
//   @override
//   String toString() {
//     return 'CounterState{}';
//   }
// }
