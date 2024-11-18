import 'package:flutter/material.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             const SizedBox(height: 25),
            // Profile picture
            const CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage(
                  'assets/profile_picture.jpg'), // Replace with your image path
            ),
            SizedBox(height: 10.0),

            // User information
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'johndoe@example.com',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 15.0),

            // Button (replace with your desired action)
            TextButton(
              onPressed: () {
                // Handle button press
                print('Button pressed!');
              },
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
