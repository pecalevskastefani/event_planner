import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final String title;
  final String placeholder;
  final Function(String)? onChanged;

  CustomInputField({
    required this.title,
    required this.placeholder,
    this.onChanged,
  });

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}
class _CustomInputFieldState extends State<CustomInputField> {
  String _typedValue = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5.0),
        TextFormField(
          decoration: InputDecoration(
            hintText: widget.placeholder,
            filled: true,
            fillColor: Colors.grey[200],
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              _typedValue = value;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
        ),
        SizedBox(height: 10.0),
      ],
    );
  }
}