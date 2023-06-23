import 'package:flutter/material.dart';

class MyRedListStateFulWidget extends StatefulWidget {
  const MyRedListStateFulWidget({Key? key}) : super(key: key);

  @override
  State<MyRedListStateFulWidget> createState() => _MyRedListStateFulWidgetState(Colors.red);
}

class _MyRedListStateFulWidgetState extends State<MyRedListStateFulWidget> {
  Color color;
  _MyRedListStateFulWidgetState(this.color);

  @override
  Widget build(BuildContext context) {
    return Expanded(child:
    Container(
      color: color,
      width: 150,
      height: 150,
    ));
  }
}

class MyBlueListStateFulWidget extends StatefulWidget {
  const MyBlueListStateFulWidget({Key? key}) : super(key: key);

  @override
  State<MyBlueListStateFulWidget> createState() => _MyBlueListStateFulWidgetState(Colors.blue);
}

class _MyBlueListStateFulWidgetState extends State<MyBlueListStateFulWidget> {
  Color color;
  _MyBlueListStateFulWidgetState(this.color);

  @override
  Widget build(BuildContext context) {
    return Expanded(child:
    Container(
      color: color,
      width: 150,
      height: 150,
    ));
  }
}

