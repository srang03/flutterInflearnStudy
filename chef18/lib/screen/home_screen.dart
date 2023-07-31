import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder( builder: (BuildContext context){
        return Center(
          child: TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar( showCloseIcon: true,
                content: Text('Message'),
              ));
            },
            child: Text('Button'),
          ),
        );
      } ),

    );
  }
}
