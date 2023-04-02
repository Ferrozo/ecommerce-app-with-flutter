import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class ProfileItemCard extends StatelessWidget {
  const ProfileItemCard({Key? key}) : super(key: key);

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
                child: const Icon(UniconsLine.user),
              ),
              const SizedBox(width: 20),
              const Text('Personal Data')
            ],
          ),
          IconButton(
            icon: Icon(UniconsLine.angle_right),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
