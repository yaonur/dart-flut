import 'package:flutter/material.dart';

void main() {
  var app = MaterialApp(
    home: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // print('Hi there!');
        },
        child: const Icon( Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Lets see some images!'),
      ),
    ),
  );
  runApp(app);
}
