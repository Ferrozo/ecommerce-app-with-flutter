import 'package:flutter/material.dart';

class NaviBarBtn extends StatelessWidget {
  const NaviBarBtn({
    Key? key,
    this.itemSize,
    this.isFavorite,
    required this.icon,
    required this.title,
  }) : super(key: key);
  final String title;
  final bool? isFavorite;
  final IconData icon;
  final int? itemSize;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextButton(
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.black87,
              ),
              // const SizedBox(height: 5),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black87,
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
