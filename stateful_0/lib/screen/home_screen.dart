import 'package:flutter/material.dart';
import 'package:stateful_0/widgets/my_list_stateful_widget.dart';

import '../widgets/my_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> widgetList = [
    MyBlueListStateFulWidget(),
    MyRedListStateFulWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Row(
          children: widgetList,
        ),
        ElevatedButton(onPressed: onChange, child: Text('Change')),
      ],
    ));
  }

  void onChange() {
    setState(() {
      widgetList.insert(1, widgetList.removeAt(0));
    });
  }
}
