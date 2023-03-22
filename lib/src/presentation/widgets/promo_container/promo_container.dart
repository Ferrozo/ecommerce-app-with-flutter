import 'package:flutter/material.dart';

class PromoContainer extends StatelessWidget {
  const PromoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.25,
                child: const Text(
                  '#FASHION DAY',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              for (int i = 0; i < 3; i++)
                Container(
                  height: 3.5,
                  width: i == 0 ? 12 : 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: const Color.fromARGB(178, 0, 0, 0),
                  ),
                )
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            '80% OFF',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Discover fashion that suits to \n your style',
            style: TextStyle(
              fontSize: 13,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 15),
          Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
                color: Colors.black87, borderRadius: BorderRadius.circular(5)),
            child: const TextButton(
              onPressed: null,
              child: Text(
                'Check this out',
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 225, 225, 225),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
