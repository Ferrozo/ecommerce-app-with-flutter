import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({Key? key, required this.icon, required this.number})
      : super(key: key);
  final IconData icon;
  final String number;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: null,
          icon: Icon(icon),
        ),
        Positioned(
          top: 5,
          left: 25,
          child: Container(
            alignment: Alignment.center,
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 240, 127, 164),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
