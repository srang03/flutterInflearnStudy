import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final Color color;

  const ContainerWidget({required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          width: 2.0,
          color: color,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      height: 400.0,
      width: 400.0,
    );
  }
}
