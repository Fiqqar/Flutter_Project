import 'package:flutter/material.dart';

class TxtEmail extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;

  const TxtEmail({
    required this.controller,
    required this.labelText,
    required this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
          hintText: hintText,
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}