import 'package:ecommerce_app_with_flutter/src/data/model/product_model.dart';
import 'package:ecommerce_app_with_flutter/src/presentation/screens/favorite/favorie_page.dart';
import 'package:ecommerce_app_with_flutter/src/presentation/screens/product_details/product_details.dart';
import 'package:ecommerce_app_with_flutter/src/presentation/widgets/export_widgets.dart';
import 'package:ecommerce_app_with_flutter/src/services/api_call_service.dart';
import 'package:ecommerce_app_with_flutter/src/services/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

import '../../../data/model/favorite/favorite_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<ProductModel>? _products = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _products = (await APICallService.getProduct());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 252, 252),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              flex: 3,
              child: SearchBox(),
            ),
            SizedBox(
              height: 40,
              child: Consumer<CartProvider>(
                builder: (_, cart, child) {
                  return Row(children: [
                    AppBarButton(
                        icon: UniconsLine.shopping_bag,
                        itemSize: cart.getCounter()),
                    const AppBarButton(icon: UniconsLine.bell, itemSize: 0),
                  ]);
                },
              ),
            ),
          ],
        ),
      ),
      body: _products == null || _products!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                color: Color(0xff76bbaa),
              ),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.bottomCenter,
                        image: AssetImage('assets/promo_02.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 180,
                    alignment: Alignment.bottomCenter,
                    child: const PromoContainer(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Column(
                      children: [
                        const Categories(),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Best Sale Product',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              const TextButton(
                                onPressed: null,
                                child: Text(
                                  'See more',
                                  style: TextStyle(
                                    fontSize: 13.5,
                                    color: Color(0xff76bbaa),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Wrap(
                    children: List.generate(_products!.length, (index) {
                      return Consumer<FavoriteModel>(
                          builder: (_, favorie, child) {
                        return ProductCard(
                          addToFavorite: () {
                            Provider.of<FavoriteModel>(_, listen: false).add(
                              _products![index],
                            );
                          },
                          isFavorite: favorie.items.contains(_products![index])
                              ? false
                              : true,
                          onpress: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => ProductDetails(
                                  productInfo: _products![index],
                                ),
                              ),
                            );
                          },
                          producInfo: ProductModel(
                              id: _products![index].id,
                              title: _products![index].title,
                              price: _products![index].price,
                              description: _products![index].description,
                              category: _products![index].category,
                              image: _products![index].image,
                              rating: Rating(
                                  rate: _products![index].rating.rate,
                                  count: _products![index].rating.count)),
                        );
                      });
                    }),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.grey.withOpacity(0.2),
              width: 1,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        height: 65,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(UniconsLine.estate, color: Color(0xff76bbaa)),
                SizedBox(height: 5),
                Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff76bbaa),
                  ),
                ),
              ],
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const FavoritePage()));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(UniconsLine.heart_alt),
                    SizedBox(height: 5),
                    Text(
                      'Favorite',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    )
                  ],
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(UniconsLine.wallet),
                SizedBox(height: 5),
                Text(
                  'Wallet',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(UniconsLine.user),
                SizedBox(height: 5),
                Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
