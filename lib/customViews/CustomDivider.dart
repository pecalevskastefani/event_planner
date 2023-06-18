import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final Color color;
  final double thickness;

  CustomDivider({
    this.color = Colors.grey,
    this.thickness = 1
  });

  @override
  Widget build(BuildContext context) {
      return Divider(
        color: color,
        thickness: thickness,
      );
  }
}