import 'package:ecommerce_app_with_flutter/src/core/app_bar_colors.dart';
import 'package:ecommerce_app_with_flutter/src/data/model/favorite/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/export_widgets.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: AppBarColors.darkIcons,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black54),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Spacer(),
            Text(
              'Favorites',
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
      body: Consumer<FavoriteModel>(
        builder: (context, favorite, child) {
          if (favorite.items.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: favorite.items.length,
                itemBuilder: (BuildContext context, index) {
                  return FavoriteCard(
                    title: favorite.items[index].title,
                    img: favorite.items[index].image,
                    onPressed: () {
                      Provider.of<FavoriteModel>(context, listen: false)
                          .removeItem(
                        favorite.items[0],
                      );
                    },
                    price: favorite.items[index].price,
                  );
                },
              ),
            );
          } else {
            return const Center(
                child: Text(
              'Your favorite page is Empty',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ));
          }
        },
      ),
    );
  }
}
