import 'package:flutter/material.dart';

class NaviBarBtn extends StatelessWidget {
  const NaviBarBtn({
    Key? key,
    this.itemSize,
    this.isFavorite,
    required this.icon,
    required this.isActive,
    required this.title,
    required this.onPressed,
  }) : super(key: key);
  final String title;
  final bool? isFavorite;
  final IconData icon;
  final int? itemSize;
  final Function onPressed;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextButton(
          onPressed: () {
            onPressed();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isActive ? const Color(0xff76bbaa) : Colors.black87,
              ),
              // const SizedBox(height: 5),
              Text(
                title,
                style: TextStyle(
                  fontSize: 10,
                  color: isActive ? const Color(0xff76bbaa) : Colors.black87,
                ),
              )
            ],
          ),
        ),
        isFavorite! && itemSize != 0
            ? Positioned(
                top: 15,
                left: 40,
                child: Container(
                  alignment: Alignment.center,
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 240, 127, 164),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              )
            : Container(
                height: 0,
              ),
      ],
    );
  }
}
