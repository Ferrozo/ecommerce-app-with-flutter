import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 1,
          color: Colors.grey.shade200,
        ),
      ),
      child: const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide.none),
          hintText: 'Search',
          hintStyle: TextStyle(
            fontSize: 14,
          ),
          prefixIcon: Icon(
            Icons.search,
            size: 22,
          ),
        ),
      ),
    );
  }
}
