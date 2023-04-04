import 'package:ecommerce_app_with_flutter/src/core/app_bar_colors.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../widgets/export_widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: AppBarColors.darkIcons,
        leading: const BackButton(
          color: Colors.black54,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xff76bbaa),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'J',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Your status description'),
                    ]),
              ],
            ),
            const SizedBox(height: 40),
            const ProfileItemCard(
              title: 'Personal Data',
              icon: UniconsLine.user,
            ),
            const ProfileItemCard(
              title: 'Settings',
              icon: UniconsLine.setting,
            ),
            const ProfileItemCard(
              title: 'E-Statement',
              icon: UniconsLine.wallet,
            ),
            const ProfileItemCard(
              title: 'Refferal Code',
              icon: UniconsLine.heart,
            ),
          ],
        ),
      ),
    );
  }
}
