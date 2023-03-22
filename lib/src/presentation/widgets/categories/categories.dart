import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List categories = [
      'Category',
      'fight',
      'Category',
      'Category',
      'Top Up',
      'Top Up',
    ];
    List<IconData> icons = [
      UniconsLine.list_ul,
      Icons.flight,
      Icons.supervised_user_circle,
      Icons.flare_sharp,
      Icons.wb_cloudy_outlined,
      Icons.flight,
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15, top: 20),
              height: 85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < 6; i++)
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.03),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(
                            icons[i],
                            color: Colors.black38,
                            size: 18,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          categories[i],
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.black54,
                          ),
                        )
                      ],
                    ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 3; i++)
                    Container(
                      margin: EdgeInsets.only(left: i == 0 ? 0 : 5),
                      height: 3.5,
                      width: i == 0 ? 12 : 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: const Color.fromARGB(178, 0, 0, 0),
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
