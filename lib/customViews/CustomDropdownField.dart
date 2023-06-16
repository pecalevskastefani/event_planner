import 'package:flutter/material.dart';

class CustomDropdownField extends StatelessWidget {
  final String labelText;
  final List<String> options;
  final String? selectedValue;
  final void Function(String?) onChanged;

  CustomDropdownField({
    required this.labelText,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5.0),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          ),
          hint: Text('Select'),
          value: selectedValue,
          onChanged: onChanged,
          items: options.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }
}
