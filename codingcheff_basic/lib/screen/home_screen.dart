import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App"),
        backgroundColor: Colors.redAccent[200],
        elevation: 0.0,
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(10.0),


          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [ Text('Column1'),Text('Column2'),Text('Column3') ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Row1'),Text('Row2'),Text('Row3')],
              )
            ],
          ),
      ),
    );
  }
}
