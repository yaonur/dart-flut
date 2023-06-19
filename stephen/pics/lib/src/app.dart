import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;

class App extends StatefulWidget {
  const App({super.key});
  @override
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;

  void  fetchImage() async {
    counter ++;
    var url=Uri.https('jsonplaceholder.typicode.com','/photos/$counter');
    var result=await http.get(url);
    print(result.body);
  }
  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Text('$counter'),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('Lets see Some Images!'),
        ),
      ),
    );
  }
}
