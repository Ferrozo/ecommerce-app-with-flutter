import 'package:ecommerce_app_with_flutter/src/services/api_call_service.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<dynamic> _categories = [];

  void _getCategory() async {
    _categories = (await APICallService.getCategories());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  void initState() {
    super.initState();
    _getCategory();
  }

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      UniconsLine.circuit,
      UniconsLine.diamond,
      Icons.man_rounded,
      Icons.woman_rounded,
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
                  for (int i = 0; i < _categories.length; i++)
                    Column(
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
                          _categories[i],
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
                  for (int i = 0; i < _categories.length; i++)
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
