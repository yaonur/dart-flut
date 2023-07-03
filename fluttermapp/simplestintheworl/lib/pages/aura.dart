import 'package:flutter/material.dart';
class Iphone141 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 390,
          height: 844,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 121,
                top: 202,
                child: Container(
                  width: 165,
                  height: 32,
                  decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                ),
              ),
              const Positioned(
                left: 167,
                top: 216,
                child: Text(
                  'AURA',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                left: 131,
                top: 375,
                child: Container(
                  width: 155,
                  height: 47,
                  decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                ),
              ),
              Positioned(
                left: 176,
                top: 404,
                child: ElevatedButton(
                  onPressed: (){},
                  child: const Text(
                    'VOTE',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}