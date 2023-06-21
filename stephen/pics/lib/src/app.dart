import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import 'models/image_model.dart';
import 'widgets/image_list.dart';


class App extends StatefulWidget {
  const App({super.key});
  @override
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images=[];

  void  fetchImage() async {
    counter ++;
    final url=Uri.https('jsonplaceholder.typicode.com','/photos/$counter');
    final result=await  http.get(url);
    final imageModel=ImageModel.fromJson(json.decode(result.body));
    setState((){
          images.add(imageModel);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
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
