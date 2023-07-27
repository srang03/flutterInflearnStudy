import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final IconData iconData;
  const CustomIconButton({required this.iconData, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return
        IconButton(onPressed: onPressed, icon: Icon(iconData),
        iconSize: 32.0,
        color: Colors.white);
  }
}
