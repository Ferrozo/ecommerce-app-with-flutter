import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    Key? key,
    required this.icon,
    required this.itemSize,
    required this.onPress,
  }) : super(key: key);
  final IconData icon;
  final int itemSize;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {
            onPress();
          },
          icon: Icon(
            icon,
            color: Colors.black54,
          ),
        ),
        itemSize != 0
            ? Positioned(
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
                    itemSize.toString(),
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
