import 'package:flutter/material.dart';

class PaddingWidget extends StatelessWidget {
  final Widget widget;
  const PaddingWidget({super.key, required this.widget});


  @override
  Widget build(BuildContext context) {
    return Padding(padding:
    const EdgeInsets.all(0.0),
    child: widget );
  }
}
