import 'package:flutter/material.dart';
import 'package:simplestintheworl/widget/card_widget.dart';
import 'package:simplestintheworl/class/item_class.dart';


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
            CardWidget(box: ItemClass(title:"Rocket", description:"Rocket description",imagePath:"images/rocket.png")),
            Row(
              children: [
                Expanded(
                  child: CardWidget(box:ItemClass(title:"Travel", description:"Description 2",imagePath:"images/travel.png")),
                ),
                Expanded(
                  child: CardWidget(box:ItemClass(title:"Space", description:"Description 3",imagePath:"images/space.png")),
                ),
              ],
            ),
            CardWidget(box:ItemClass(title:"Yeah", description:"Description 4",imagePath:"images/yeah.png")),
          ],
        ),
      ),
    );
  }
}
