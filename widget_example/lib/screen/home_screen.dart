import 'package:flutter/material.dart';
import 'package:widget_example/screen/container_widget.dart';
import 'package:widget_example/screen/padding_widget.dart';
import 'package:widget_example/screen/row_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.home)),
      body:RowScreen(),

    );
  }
}
