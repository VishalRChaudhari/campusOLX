import 'package:flutter/material.dart';

class Textfieldform extends StatelessWidget {
  final String hintname;
  final IconData? icons;
  final IconData? suffixicon;
  final bool obscure;

  const Textfieldform({
    super.key,
    required this.hintname,
    required this.icons,
    required this.suffixicon,
    required this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30,right: 30,bottom: 10,top: 10),
      child: TextField(
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black26),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(
            icons,
            color: Colors.grey.shade700,
          ),
          contentPadding: const EdgeInsets.all(
            15,
          ),
          hintText: hintname,        
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: Icon(suffixicon),
        ),
        obscureText: obscure,
        
      ),
    );
  }
}
