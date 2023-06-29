import 'package:flutter/material.dart';
import 'package:simplestintheworl/widget/card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            CardWidget(title:"Title 1", description:"Description 1"),
            Row(
              children: [
                Expanded(
                  child: CardWidget(title:"Title 2", description:"Description 2"),
                ),
                Expanded(
                  child: CardWidget(title:"Title 3", description:"Description 3"),
                ),
              ],
            ),
            CardWidget(title:"Title 4", description:"Description 4"),
          ],
        ),
      ),
    );
  }
}
