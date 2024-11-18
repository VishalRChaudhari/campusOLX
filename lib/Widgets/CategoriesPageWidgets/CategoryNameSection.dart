import 'package:flutter/material.dart';

class CategoryHeadingSection extends StatelessWidget {
  const CategoryHeadingSection(
      {super.key, required this.categoryName, required this.onPressed});
  final String categoryName;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            categoryName,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          TextButton(onPressed: onPressed, child: const Text('See More'))
        ],
      ),
    );
  }
}
