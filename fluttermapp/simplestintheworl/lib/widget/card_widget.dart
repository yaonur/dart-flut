import 'package:flutter/material.dart';
import 'package:simplestintheworl/class/item_class.dart';
import '../core/constants.dart';
import '../pages/description_page.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.box});
  final ItemClass box;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  DescriptionPage(box:box)),
        );
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: kDouble10),
              Image.asset(box.imagePath),
              Text(
                box.title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(box.description),
              const SizedBox(height: kDouble10),
            ],
          ),
        ),
      ),
    );
  }
}
