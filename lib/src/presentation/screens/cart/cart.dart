import 'package:ecommerce_app_with_flutter/src/data/helper/database/helper_db.dart';
import 'package:ecommerce_app_with_flutter/src/data/model/cart/cart_model.dart';
import 'package:ecommerce_app_with_flutter/src/services/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
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
                  '${cart.cart.length} items',
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Consumer<CartProvider>(
                builder: (BuildContext context, provider, widget) {
                  print('form cart ${provider.cart.length}');
                  if (provider.cart.isEmpty) {
                    return const Center(
                        child: Text(
                      'Your Cart is Empty',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ));
                  } else {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: provider.cart.length,
                        itemBuilder: (context, index) {
                          return CartCard(
                            title: provider.cart[index].productName.toString(),
                            img: provider.cart[index].img.toString(),
                            price:
                                provider.cart[index].productPrice!.toDouble(),
                            quantity: ValueNotifier(
                                provider.cart[index].quantity!.value),
                            quantityManagment: ValueListenableBuilder<int>(
                                valueListenable: provider.cart[index].quantity!,
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
                                                      .cart[index].productPrice
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
                                                    productId: index.toString(),
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
                                                cart.addTotalPrice(double.parse(
                                                    provider.cart[index]
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
                        });
                  }
                },
              ),
            ),
            Consumer<CartProvider>(
              builder: (BuildContext context, value, Widget? child) {
                final ValueNotifier<int?> totalPrice = ValueNotifier(null);
                for (var element in value.cart) {}
                return Column(
                  children: [
                    ValueListenableBuilder<int?>(
                        valueListenable: totalPrice,
                        builder: (context, val, child) {
                          return Container();
                        }),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
