import 'package:ecommerce_app_with_flutter/src/core/app_bar_colors.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          systemOverlayStyle: AppBarColors.darkIcons,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const BackButton(color: Colors.black54),
          title: Row(children: const [
            Spacer(),
            Text('My Wallet',
                style: TextStyle(
                  color: Colors.black54,
                )),
            Spacer(flex: 2),
          ])),
      body: const Center(child: Text('Empyt Wallet')),
    );
  }
}
