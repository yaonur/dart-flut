import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  build(context) {
    return  MaterialApp(
      title: 'Log me In',
      home: Scaffold(
        body:  Container(
          margin:const EdgeInsets.all(20.0),
           child:LoginScreen(),
        ),
      ),
    );
  }
}
