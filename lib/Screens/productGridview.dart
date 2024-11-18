import 'package:books/Widgets/Itemgridviewelement.dart';
import 'package:books/data/dummydata.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Detailed Screen'),
      ),
      backgroundColor: Colors.blueGrey[50],
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5),
        children: [
          for (final items in itemlist) ItemGridview(item: items),
        ],
      ),
    );
  }
}
