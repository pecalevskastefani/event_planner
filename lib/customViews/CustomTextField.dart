import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.pinkAccent,
          ),
          textAlign: TextAlign.start,
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: '',
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}