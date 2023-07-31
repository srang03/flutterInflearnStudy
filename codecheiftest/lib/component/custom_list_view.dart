import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  List<Widget> list;
  CustomListView({required this.list, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: list);
  }
}
