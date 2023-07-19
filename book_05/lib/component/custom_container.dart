import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Color color;
  const CustomContainer({required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(width: 100, height: 100, color: color);
  }
}
