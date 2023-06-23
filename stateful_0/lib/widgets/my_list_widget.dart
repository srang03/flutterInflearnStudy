import 'package:flutter/material.dart';

class MyListWidget extends StatelessWidget {
  final Color color;
  const MyListWidget({required this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: color,
        width: 150,
        height: 150,
      )
    );
  }
}
