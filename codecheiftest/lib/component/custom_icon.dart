import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData iconData;
  final GestureTapCallback onPress;
  const CustomIconButton({required this.iconData, required this.onPress, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPress, icon: Icon(iconData));
  }
}
