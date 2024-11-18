import 'package:books/Screens/productDetailsScreen.dart';
import 'package:books/Widgets/itemcard.dart';
import 'package:books/data/dummydata.dart';
import 'package:books/models/models/categories.dart';
import 'package:books/models/models/items.dart';

import 'package:flutter/material.dart';

class CategorySpecificItemsGridview extends StatelessWidget {
  const CategorySpecificItemsGridview({
    super.key,
    required this.category,
  });

  final Categories category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.title,
        ),
        elevation: 10,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0),
          children: [
            for (Items item in itemlist)
              if (item.id == category.id)
                ItemCard(
                  item: item,
                  height: 10,
                  width: 160,
                  onTap: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(item: item),
                      ),
                    ),
                  },
                )
          ],
        ),
      ),
    );
  }
}
/* () => {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailScreen(item: items),
                        ),
                      ),
                    },
                    
                    
                    
                     GridView(
            padding: const EdgeInsets.all(24),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4 / 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            children: [

              for (Items item in itemlist)
              if (item.id == category.id) 
              ItemCard(item: item, height: 250, onTap: (){}, width: 150),
            ],
            
          )
          */
