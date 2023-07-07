import 'package:flutter/material.dart';
import '../../../ui/navbar2.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/back2.png"),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Positioned(
              bottom: 40, // Set the bottom position to 0
              child: Container(child: const NavBar()),
            ),
      ),
    );
  }
}
