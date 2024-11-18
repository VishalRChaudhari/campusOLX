import 'package:books/models/models/categories.dart';
import 'package:flutter/material.dart';

class CategoryElement extends StatelessWidget {
  const CategoryElement(
      {super.key,
      required this.onTapped,
      required this.category,
      required this.height,
      required this.width});

  final Categories category;
  final double height;
  final double width;
  final Function()? onTapped;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black12, style: BorderStyle.solid),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //image
            //Image(image: ),

            //name
            Text(
              category.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
