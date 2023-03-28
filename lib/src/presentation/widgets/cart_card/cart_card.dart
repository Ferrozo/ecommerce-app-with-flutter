import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CartCard extends StatelessWidget {
  CartCard({
    Key? key,
    required this.title,
    required this.img,
    required this.price,
    required this.quantity,
    required this.quantityManagment,
  }) : super(key: key);

  final String title;
  final double price;
  final ValueNotifier quantity;
  final String img;
  ValueListenableBuilder quantityManagment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color.fromARGB(34, 118, 187, 170),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.white70, borderRadius: BorderRadius.circular(10)),
            child: Image.asset(img),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  Text(
                    quantity.value > 1
                        ? '(${quantity.value.toString()}) items'
                        : '',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 180,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(price.toString()),
                    Spacer(),
                    quantityManagment,
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
