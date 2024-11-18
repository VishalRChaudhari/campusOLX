import 'package:books/models/models/items.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CategoryCardTest extends StatelessWidget {
  const CategoryCardTest({super.key, required this.item});

  final Items item;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: const Border(bottom: BorderSide(color: Colors.black))),
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(item.url),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
