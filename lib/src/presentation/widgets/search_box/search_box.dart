import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchBox extends StatelessWidget {
  SearchBox({
    Key? key,
    this.onTap,
    this.onChange,
    this.controller,
    required this.autoFocus,
  }) : super(key: key);
  final Function? onTap;
  final Function? onChange;
  final bool autoFocus;
  TextEditingController? controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 1,
          color: Colors.grey.shade200,
        ),
      ),
      child: TextField(
        onChanged: (value) {
          onChange!(value);
        },
        controller: controller,
        autofocus: autoFocus,
        onTap: () {
          onTap!();
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          hintText: 'Search',
          hintStyle: const TextStyle(
            fontSize: 14,
          ),
          prefixIcon: autoFocus
              ? null
              : const Icon(
                  Icons.search,
                  size: 22,
                ),
          suffixIcon: autoFocus
              ? const Icon(
                  Icons.search,
                  size: 22,
                )
              : null,
        ),
      ),
    );
  }
}
