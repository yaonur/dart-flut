import 'package:flutter_bloc/flutter_bloc.dart';
part  'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent,int>{
  CounterBloc():super(3){

  on<CounterEvent>((event,emit){
    if(event is CounterIncrementEvent){
      emit(state+1);
    }
    else if(event is CounterDecrementEvent){
      emit(state-1);
    }
  });
  }

}