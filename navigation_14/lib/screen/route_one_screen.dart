import 'package:flutter/material.dart';
import 'package:navigation_14/layout/main_layout.dart';
import 'package:navigation_14/screen/route_two_screen.dart';

class RouteOneScreen extends StatelessWidget {
  final int? number;
  const RouteOneScreen({ this.number, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(title: ("Route 1"), children: [
      Text(
        'arguments: ${number.toString()}',
        textAlign: TextAlign.center,
      ),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => RouteTwoScreen(),
                settings: RouteSettings(
                    arguments: 789
                ),
            ));
          },
          child: Text('push')),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(456);
          },
          child: Text('Pop')),

      ElevatedButton(onPressed: (){
        Navigator.of(context).maybePop();
      }, child: Text("Maybe Pop"))
    ]);
  }
}
