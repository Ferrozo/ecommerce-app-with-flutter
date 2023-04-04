import 'package:ecommerce_app_with_flutter/src/data/helper/database/helper_db.dart';
import 'package:ecommerce_app_with_flutter/src/data/model/cart/cart_model.dart';
import 'package:ecommerce_app_with_flutter/src/data/model/product_model.dart';
import 'package:ecommerce_app_with_flutter/src/presentation/widgets/export_widgets.dart';
import 'package:ecommerce_app_with_flutter/src/services/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

import '../../../core/app_bar_colors.dart';
import '../../../data/model/favorite/favorite_model.dart';
import '../export_screens.dart';

// ignore: must_be_immutable
class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key, required this.productInfo}) : super(key: key);
  final ProductModel productInfo;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: AppBarColors.darkIcons,
        leading: const BackButton(
          color: Colors.black54,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Consumer<FavoriteModel>(
              builder: (_, favorie, child) {
                return IconButton(
                  onPressed: () {
                    favorie.add(widget.productInfo);
                  },
                  icon: favorie.items.contains(widget.productInfo)
                      ? const Icon(Icons.favorite,
                          color: Color.fromARGB(255, 240, 127, 164))
                      : Icon(
                          UniconsLine.heart_alt,
                          color: Colors.grey.shade500,
                        ),
                );
              },
            ),
            const IconButton(
              onPressed: null,
              icon: Icon(UniconsLine.share_alt),
            ),
            Consumer<CartProvider>(builder: (_, cart, child) {
              return AppBarButton(
                icon: UniconsLine.shopping_bag,
                itemSize: cart.getCounter(),
                onPress: () {
                  _goToCartPage();
                },
              );
            }),
          ],
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.grey.shade100,
              height: 300,
              child: SizedBox(
                child: Image.network(
                  widget.productInfo.image,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  UniconsLine.store,
                  color: Colors.grey.shade500,
                  size: 20,
                ),
                const SizedBox(width: 5),
                Text(
                  'Storename.id',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade500,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Text(
              maxLines: 1,
              widget.productInfo.title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.orange.shade500,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${widget.productInfo.rating.rate} Rating',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const DecoratorDot(),
                    Text(
                      '${widget.productInfo.rating.count} + Reviws',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const DecoratorDot(),
                    Text(
                      '2.3K + Sold',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 20),
                    const Text(
                      'About Item',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff76bbaa),
                      ),
                    ),
                    const SizedBox(width: 70),
                    Text(
                      'Reviews',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade500,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey.shade200,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 2,
                        width: 160,
                        color: const Color(0xff76bbaa),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Brand',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Brandname',
                            style: TextStyle(
                              color: Colors.grey.shade800,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 30),
                      Row(
                        children: [
                          Text(
                            'Color',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Brandname',
                            style: TextStyle(
                              color: Colors.grey.shade800,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 80,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                        widget.productInfo.description,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.grey.withOpacity(0.2),
              width: 1,
            ),
          ),
        ),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '\$${widget.productInfo.price}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff76bbaa),
                  ),
                ),
              ],
            ),
            SizedBox(
                height: 50,
                width: 160,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: 100,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff76bbaa),
                  ),
                  child: Consumer<CartProvider>(
                    builder: (_, cart, child) {
                      return TextButton(
                        onPressed: () {
                          print('added');
                          dbHelper
                              .insertToDB(Cart(
                            id: widget.productInfo.id,
                            productId: widget.productInfo.id.toString(),
                            productName: widget.productInfo.title,
                            productPrice: widget.productInfo.price,
                            initialPrice: widget.productInfo.price,
                            quantity: ValueNotifier(1),
                            img: widget.productInfo.image,
                          ))
                              .then((value) {
                            cart.addTotalPrice(widget.productInfo.price);
                            cart.addToCounter();
                          }).onError((error, stackTrace) {
                            // ignored
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Add to cart',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Icon(UniconsLine.shopping_bag, color: Colors.white)
                          ],
                        ),
                      );
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void _goToCartPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const CartPage()));
  }
}
