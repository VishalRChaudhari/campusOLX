import 'package:flutter/material.dart';

class Signuplogo extends StatelessWidget {
  const Signuplogo({super.key, required this.imgpath});

  final String imgpath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.grey.shade300.withOpacity(0.7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(
        imgpath,
        height: 50,
        width: 50,
      ),
    );
  }
}
