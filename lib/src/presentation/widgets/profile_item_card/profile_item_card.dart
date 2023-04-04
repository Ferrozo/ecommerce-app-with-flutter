import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class ProfileItemCard extends StatelessWidget {
  const ProfileItemCard({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(15, 158, 158, 158),
                ),
                child: Icon(icon),
              ),
              const SizedBox(width: 20),
              Text(title)
            ],
          ),
          IconButton(
            icon: const Icon(UniconsLine.angle_right),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
