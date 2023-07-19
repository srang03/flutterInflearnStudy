import 'package:flutter/material.dart';
import 'package:widget_example/screen/container_widget.dart';

class RowScreen extends StatelessWidget {
  const RowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[ContainerWidget(color: Colors.black12), SizedBox(width: 10.0,), ContainerWidget(color: Colors.blue), SizedBox(width: 10.0,), ContainerWidget(color: Colors.greenAccent) ]
      ),
    );
  }
}
