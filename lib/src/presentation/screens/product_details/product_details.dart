import 'package:ecommerce_app_with_flutter/src/data/model/product_model.dart';
import 'package:ecommerce_app_with_flutter/src/presentation/widgets/export_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

import '../../../data/model/favorite/favorite_model.dart';

// ignore: must_be_immutable
class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key, required this.productInfo}) : super(key: key);
  final ProductModel productInfo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
        leading: const BackButton(
          color: Colors.black54,
        ),
        title: Consumer<FavoriteModel>(
          builder: (_, favorie, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    favorie.add(productInfo);
                  },
                  icon: favorie.items.contains(productInfo)
                      ? const Icon(Icons.favorite,
                          color: Color.fromARGB(255, 240, 127, 164))
                      : Icon(
                          UniconsLine.heart_alt,
                          color: Colors.grey.shade500,
                        ),
                ),
                const IconButton(
                  onPressed: null,
                  icon: Icon(UniconsLine.share_alt),
                ),
                const AppBarButton(icon: UniconsLine.shopping_bag, itemSize: 0),
              ],
            );
          },
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
                  productInfo.image,
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
            const SizedBox(height: 15),
            Text(
              productInfo.title,
              style: TextStyle(
                fontSize: 18,
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
                      '${productInfo.rating.rate} Rating',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const DecoratorDot(),
                    Text(
                      '${productInfo.rating.count} + Reviws',
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
            const SizedBox(height: 30),
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
            const SizedBox(height: 25),
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
                  'Total Price',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '\$${productInfo.price}',
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
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                      color: Color(0xff76bbaa),
                    ),
                    width: 60,
                    height: MediaQuery.of(context).size.height,
                    child: Row(
                      children: const [
                        Icon(UniconsLine.shopping_bag, color: Colors.white),
                        Text(
                          '1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: 100,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: Colors.black54,
                    ),
                    child: const TextButton(
                      onPressed: null,
                      child: Text(
                        'Buy Now',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
