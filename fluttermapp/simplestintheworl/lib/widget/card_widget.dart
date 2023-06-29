import 'package:flutter/material.dart';
import '../core/constants.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String description;
  const CardWidget({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: kDouble10),
            Image.asset('images/rocket.png'),
            Text(
              title,
              style:const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(description),
            const SizedBox(height: kDouble10),
          ],
        ),
      ),
    );
  }
}
