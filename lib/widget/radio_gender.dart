import 'package:flutter/material.dart';

class RadioGender extends StatelessWidget {
  final String groupValue;
  final ValueChanged<String?> onChanged;

  const RadioGender({
    required this.groupValue,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            children: [
              Radio<String>(
                value: 'Laki-laki',
                groupValue: groupValue,
                onChanged: onChanged,
              ),
              Text('Laki-laki'),
            ],
          ),
        ),
        Row(
          children: [
            Radio<String>(
              value: 'Perempuan',
              groupValue: groupValue,
              onChanged: onChanged,
            ),
            Text('Perempuan'),
          ],
        ),
      ],
    );
  }
}