import 'package:flutter/material.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: const Text('My Adds'),
                  onTap: () {},
                ),
                GestureDetector(
                  child: const Text('Cart'),
                  onTap: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
