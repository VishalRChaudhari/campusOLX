import 'package:books/Screens/favouritespage.dart';
import 'package:books/Screens/profileScreen.dart';
import 'package:books/Screens/categoryScreen.dart';
import 'package:books/Screens/new_AD_page.dart';
import 'package:books/Widgets/drawer.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var selectedIndex = 0;
  void indexToggle(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  String initialTitle = 'CampusOLX';
  Widget activescreen = CategoryScreen();

  @override
  Widget build(BuildContext context) {
    if (selectedIndex == 0) {
      initialTitle = 'CampusOLX';
      activescreen = const CategoryScreen();
    } else if (selectedIndex == 1) {
      initialTitle = 'Add a item';
      activescreen = const CreateAdPage();
    } else if (selectedIndex == 2) {
      initialTitle = 'My Adds';
      activescreen = const FavouritesPage();
    } else if (selectedIndex == 3) {
      initialTitle = 'Profile';
      activescreen = const Profilepage();
    }

    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          initialTitle,
        ),
        backgroundColor: Colors.transparent,
        elevation: 5,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chat_outlined),
          ),
          const SizedBox(
            width: 5,
          )
        ],
      ),
      drawer: const Drawer(
        child: DrawerWidget(),
      ),
      body: activescreen,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[100],
        type: BottomNavigationBarType.fixed,
        onTap: indexToggle,
        currentIndex: selectedIndex,
        elevation: 1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
            ),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_outlined),
            label: 'My Adds',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
