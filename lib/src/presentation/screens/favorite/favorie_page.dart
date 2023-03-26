import 'package:ecommerce_app_with_flutter/src/data/model/favorite/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Consumer<FavoriteModel>(
          builder: (context, favorie, child) {
            return Column(
              children: [Text(favorie.items[0].title)],
            );
          },
        ),
      ),
    );
  }
}
