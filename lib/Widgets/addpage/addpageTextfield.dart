import 'package:flutter/material.dart';

class AddPageTextField extends StatelessWidget {
  const AddPageTextField({
    super.key,
    required this.icon,
    required this.keyboardType,
    required this.controller,
  });
  final Icon? icon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: icon,
          fillColor: Colors.grey[50],
          filled: true,
          contentPadding: const EdgeInsets.all(15),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black26),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
