import 'package:books/models/models/items.dart';
import 'package:flutter/material.dart';

class ItemGridview extends StatelessWidget {
  const ItemGridview({super.key, required this.item});

  final Items item;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //image

            //name
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(item.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 14)),
            ),
            const SizedBox(
              height: 10,
            ),

            //price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('₹ ${item.price.toString()}'),
                IconButton.filledTonal(onPressed: () {}, icon: Icon(Icons.add))
              ],
            )
          ],
        ));
  }
}
