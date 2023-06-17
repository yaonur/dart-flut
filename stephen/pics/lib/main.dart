import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pics/bricks/icon.dart';

void main() {
  var app = MaterialApp(
    home: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // print('Hi there!');
        },
        child: const Icon(Icons.add),
      ),
      // body:Center(
      //   child:ToggleAnimatedIconButton(toggleItems: ["ss"],onPressed: (p0) => PrintHandler,)
      // ),
      appBar: AppBar(
        title: const Text('Lets see some images!'),
      ),
    ),
  );
  runApp(app);
}
