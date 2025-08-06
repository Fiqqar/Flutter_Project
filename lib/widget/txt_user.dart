import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TxtUser extends StatelessWidget {
  final bool isNumber;
  final TextEditingController controller;
  final String labelText;
  final String hintText;

  const TxtUser({
    required this.controller,
    required this.labelText,
    required this.hintText,
    super.key, required this.isNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        inputFormatters: isNumber ? [FilteringTextInputFormatter.digitsOnly] : [],
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
          hintText: hintText,
        ),
      ),
    );
  }
}
