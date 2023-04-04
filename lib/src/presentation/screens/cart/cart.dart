import 'package:ecommerce_app_with_flutter/src/core/app_bar_colors.dart';
import 'package:ecommerce_app_with_flutter/src/data/helper/database/helper_db.dart';
import 'package:ecommerce_app_with_flutter/src/data/model/cart/cart_model.dart';
import 'package:ecommerce_app_with_flutter/src/services/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

import '../../widgets/export_widgets.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  DBHelper? dbHelper = DBHelper();

  @override
  void initState() {
    super.initState();
    context.read<CartProvider>().getCartData();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final ValueNotifier<int?> totalPrice = ValueNotifier(null);

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: AppBarColors.darkIcons,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black54),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            const Text(
              'My Cart',
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
            const Spacer(),
            Consumer<CartProvider>(
              builder: (_, cart, child) {
                return Text(
                  '${cart.getCounter().toString()} items',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Consumer<CartProvider>(
        builder: (BuildContext context, provider, widget) {
          if (provider.cart.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: provider.cart.length,
                          itemBuilder: (context, index) {
                            return CartCard(
                              title:
                                  provider.cart[index].productName.toString(),
                              img: provider.cart[index].img.toString(),
                              price:
                                  provider.cart[index].productPrice!.toDouble(),
                              quantity: ValueNotifier(
                                  provider.cart[index].quantity!.value),
                              quantityManagment: ValueListenableBuilder<int>(
                                  valueListenable:
                                      provider.cart[index].quantity!,
                                  builder: (context, val, child) {
                                    return Row(
                                      children: [
                                        IconButton(
                                          padding: const EdgeInsets.all(0),
                                          onPressed: () {
                                            dbHelper!.deleteCartItem(
                                                provider.cart[index].id!);
                                            provider.removeItem(
                                                provider.cart[index].id!);
                                            provider.removeItem(
                                                provider.cart[index].id!);
                                            provider.removeFromCounter();
                                          },
                                          icon: Icon(
                                            UniconsLine.trash,
                                            color: Colors.red.withOpacity(0.5),
                                            size: 20,
                                          ),
                                        ),
                                        Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            color: Colors.grey.shade100,
                                          ),
                                          child: IconButton(
                                              padding: const EdgeInsets.all(0),
                                              onPressed: () {
                                                cart.deleteQuantity(
                                                    provider.cart[index].id!);
                                                cart.removeTotalPrice(
                                                    double.parse(provider
                                                        .cart[index]
                                                        .productPrice
                                                        .toString()));
                                              },
                                              icon: const Icon(
                                                UniconsLine.minus,
                                                color: Colors.black54,
                                                size: 12,
                                              )),
                                        ),
                                        const SizedBox(width: 10),
                                        Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            color: Colors.pink,
                                          ),
                                          child: IconButton(
                                            padding: const EdgeInsets.all(0),
                                            onPressed: () {
                                              cart.addQuantity(
                                                  provider.cart[index].id!);
                                              dbHelper!
                                                  .updateQuantity(Cart(
                                                      id: index,
                                                      productId:
                                                          index.toString(),
                                                      productName: provider
                                                          .cart[index]
                                                          .productName,
                                                      initialPrice: provider
                                                          .cart[index]
                                                          .initialPrice,
                                                      productPrice: provider
                                                          .cart[index]
                                                          .productPrice,
                                                      quantity: ValueNotifier(
                                                          provider.cart[index]
                                                              .quantity!.value),
                                                      img: provider
                                                          .cart[index].img))
                                                  .then((value) {
                                                setState(() {
                                                  cart.addTotalPrice(
                                                      double.parse(provider
                                                          .cart[index]
                                                          .productPrice
                                                          .toString()));
                                                });
                                              });
                                            },
                                            icon: const Icon(
                                              UniconsLine.plus,
                                              color: Colors.white,
                                              size: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                            );
                          })),
                  Column(
                    children: [
                      ValueListenableBuilder<int?>(
                          valueListenable: totalPrice,
                          builder: (context, val, child) {
                            return Container();
                          }),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Center(
                child: Text(
              'Your Cart is Empty',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ));
          }
        },
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
                Consumer<CartProvider>(builder: (_, cart, child) {
                  return Text(
                    '\$  ${cart.cart.isNotEmpty ? cart.totalPrice.toStringAsFixed(2) : 0}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff76bbaa),
                    ),
                  );
                })
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
                child: TextButton(
                  onPressed: () {
                    // ignored
                  },
                  child: const Text(
                    'Order now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
