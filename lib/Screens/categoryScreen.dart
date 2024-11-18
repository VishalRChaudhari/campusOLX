import 'package:books/Screens/categorySpecificItemsGridview.dart';
import 'package:books/Widgets/Categories.dart';
import 'package:books/Widgets/CategoriesPageWidgets/CategoryNameSection.dart';
import 'package:books/Widgets/CategoriesPageWidgets/categoryItemsListview.dart';
import 'package:books/Widgets/searchbox.dart';
import 'package:books/data/dummydata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blueGrey[50],
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Search bar
            const SearchBox(),

            //delayed info cards

            //row of categories
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  TextButton(onPressed: () {}, child: const Text('See More'))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (final category in availableCategories)
                  CategoryElement(
                    category: category,
                    height: 90,
                    width: 90,
                    onTapped: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            CategorySpecificItemsGridview(category: category),
                      ));
                    },
                  ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            //BOOKS

            CategoryHeadingSection(categoryName: 'Books', onPressed: () {}),

            const CategoryItemsListview(
              categoryID: 'C1',
            ),

            //ELECTRONIC GADGETS

            CategoryHeadingSection(
                categoryName: 'Electronic Gadgets',
                onPressed: () {}), //onpressed for see more option

            const CategoryItemsListview(
              categoryID: 'C2',
            ),

            //FURNITURE

            CategoryHeadingSection(categoryName: 'Furniture', onPressed: () {}),

            const CategoryItemsListview(
              categoryID: 'C3',
            ),

            //VEHICLE

            CategoryHeadingSection(categoryName: 'Vehicle', onPressed: () {}),

            const CategoryItemsListview(
              categoryID: 'C4',
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}












/* GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          childAspectRatio: 4/4,
          ),
      itemBuilder: (context, index) => ,


      //Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
            child: 



            for (final items in itemlist)
            GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              children: [
                ItemGridview(item: items),
              ],
            )



    );*/