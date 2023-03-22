import 'package:flutter/material.dart';

class DecoratorDot extends StatelessWidget {
  const DecoratorDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 5,
      height: 5,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
