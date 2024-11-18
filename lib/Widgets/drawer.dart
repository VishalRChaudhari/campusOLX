import 'package:books/Screens/homepage.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const DrawerHeader(
          child: Icon(
            Icons.book,
            size: 35,
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('H O M E'),
          onTap: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Homepage(),
              ),
            ),
          },
        ),
        ListTile(
          leading: const Icon(Icons.help),
          title: const Text('H E L P'),
          onTap: () => {},
        ),
        ListTile(
          leading: const Icon(Icons.help),
          title: const Text('S I G N  I N  /  L O G I N'),
          onTap: () => {},
        )
      ],
    );
  }
}


/*ListTile(
          leading: const Icon(Icons.school),
          title: const Text('D E P A R T M E N T S'),
          onTap: () => {
            Navigator.pop(context),
            Navigator.pushNamed(context, '/department'),
          },
        ), */