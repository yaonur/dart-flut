import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s2/blocs/counter/counter_bloc.dart';

import 'other_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'My Counter Bloc',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CounterBloc, CounterState>(
        listener: (context, state) {
          if(state.counter == 3){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Counter is greater than 3'),
                duration: Duration(seconds: 1),
              ),
            );
          } else if (state.counter < 0){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:(context){
                  return const OtherPage();
                }
              ),
            );
          }
        },
        child: Center(
          child: Text(
            context.watch<CounterBloc>().state.counter.toString(),
            style: const TextStyle(fontSize: 52.0),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context)
                  .add(IncrementCounterEvent());
            },
            heroTag: 'increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10.0),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context)
                  .add(DecrementCounterEvent());
            },
            heroTag: 'decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
