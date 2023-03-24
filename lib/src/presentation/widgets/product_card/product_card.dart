import 'package:ecommerce_app_with_flutter/src/data/model/product_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.isFavorite,
    required this.onpress,
    required this.producInfo,
    required this.addToFavorite,
  }) : super(key: key);
  final Function onpress;
  final Function addToFavorite;
  final ProductModel producInfo;
  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, top: 20),
          height: 195,
          color: Colors.grey.shade300.withOpacity(0.4),
          width: 145,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  onpress();
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: NetworkImage(producInfo.image),
                      fit: BoxFit.contain,
                    ),
                  ),
                  height: 100,
                ),
              ),
              Container(
                height: 95,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shirt',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        producInfo.title,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 12,
                                  color: Colors.orange,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '${producInfo.rating.rate} | ${producInfo.rating.count} ',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '\$${producInfo.price}',
                            style: const TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff76bbaa),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 15,
          right: 2,
          child: IconButton(
            onPressed: () {
              addToFavorite();
            },
            icon: isFavorite
                ? const Icon(
                    Icons.favorite_border,
                    size: 20,
                  )
                : const Icon(
                    Icons.favorite,
                    color: Color.fromARGB(255, 240, 127, 164),
                    size: 20,
                  ),
          ),
        ),
      ],
    );
  }
}
