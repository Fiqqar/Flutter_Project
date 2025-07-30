import 'package:flutter/material.dart';

class TxtPassword extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;

  const TxtPassword({
    required this.controller,
    required this.labelText,
    required this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: TextField(
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
          hintText: hintText,
        ),
      ),
    );
  }
}