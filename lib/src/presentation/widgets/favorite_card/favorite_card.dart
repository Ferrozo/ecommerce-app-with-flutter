import 'package:flutter/material.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    Key? key,
    required this.title,
    required this.img,
    required this.price,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final String img;
  final double price;
  final Function onPressed;

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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.white70, borderRadius: BorderRadius.circular(10)),
            child: Image.network(img),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 180,
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 180,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$ ${price.toString()}'),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          ),
          IconButton(
              onPressed: () {
                onPressed();
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.red.shade400,
              ))
        ],
      ),
    );
  }
}
