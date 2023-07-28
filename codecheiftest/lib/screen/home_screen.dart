import 'package:codecheiftest/component/custom_icon.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          width: 300,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Row(
                  children: [
                    Text('안성우', style: TextStyle(fontWeight: FontWeight.w800)),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      '주임연구원',
                      style: TextStyle(
                          fontWeight: FontWeight.w100, fontSize: 12.0),
                    )
                  ],
                ),
                accountEmail: Text('ian@urock.kr'),
                currentAccountPicture: CircleAvatar(),
                onDetailsPressed: () {},
                decoration: BoxDecoration(
                  color: Colors.blue[500],
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(40.0))),
              )
            ],
          )),
      appBar: AppBar(
        title: Text('GateManager Pro'),
        backgroundColor: Colors.blue[700],
        elevation: 0.0,
        actions: [
          CustomIconButton(
            onPress: () {},
            iconData: Icons.settings,
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
