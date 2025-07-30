import 'package:flutter/material.dart';

class DateBirth extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;

  const DateBirth({
    required this.controller,
    required this.labelText,
    required this.hintText,
    super.key,
  });

  Future<void> selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      controller.text = "${picked.year}-${picked.month}-${picked.day}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: Icon(Icons.calendar_today),
      ),
      onTap: () => selectDate(context),
    );
  }
}
