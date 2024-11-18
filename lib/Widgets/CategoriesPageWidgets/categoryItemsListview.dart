import 'package:books/Screens/productDetailsScreen.dart';
import 'package:books/Widgets/itemcard.dart';
import 'package:books/data/dummydata.dart';
import 'package:flutter/material.dart';

class CategoryItemsListview extends StatelessWidget {
  const CategoryItemsListview({super.key, required this.categoryID});

  final String categoryID;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
            ),
            child: IntrinsicWidth(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (final item in itemlist)
                    if (item.id == categoryID)
                      ItemCard(
                        item: item,
                        height: 250,
                        width: 160,
                        onTap: () => {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailScreen(item: item),
                            ),
                          ),
                        },
                      )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
