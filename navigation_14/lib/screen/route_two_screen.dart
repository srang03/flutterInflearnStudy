import 'package:flutter/material.dart';
import 'package:navigation_14/layout/main_layout.dart';
import 'package:navigation_14/screen/route_three_screen.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    return MainLayout(title: "Route 2", children: [
      Text(
        'arguments: $arguments',
        textAlign: TextAlign.center,
      ),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/three', arguments: 999);
          },
          child: Text('Push Named')),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Pop")),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => RouteThreeScreen()));
          },
          child: Text("Replace Button")),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/three');
          },
          child: Text("PushNamed Replacement")),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => RouteThreeScreen()),
                (route) => route.settings.name == '/');
          },
          child: Text("Push And RemoveUntil")),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/three', (route) => route.settings.name == '/');
          },
          child: Text('PushNamed And RemoveUntil'))
    ]);
  }
}
