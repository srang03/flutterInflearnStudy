import 'package:codecheiftest/component/custom_icon.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _children = [];
  bool _isOpen = false;

  void temp() {
    var widgets = [
      ListTile(
        leading: Icon(
          Icons.home,
          color: Colors.grey[800],
        ),
        title: Text('Home'),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(
          Icons.search,
          color: Colors.grey[800],
        ),
        title: Text('Search'),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(
          Icons.settings,
          color: Colors.grey[800],
        ),
        title: Text('Settings'),
        onTap: () {},
      )
    ];


    _children.add(ListTile(
      leading: Icon(
        Icons.home,
        color: Colors.grey[800],
      ),
      title: const Text('Home'),
      onTap: () {},
    ));

    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _children.add(createUserAccountsDrawerHeader(temp));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(width: 300, child: ListView(children: _children)),
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

  Widget createUserAccountsDrawerHeader(GestureTapCallback onDetailsPressed) {
    return UserAccountsDrawerHeader(
      accountName: const Row(
        children: [
          Text('안성우', style: TextStyle(fontWeight: FontWeight.w800)),
          SizedBox(
            width: 8.0,
          ),
          Text(
            '주임연구원',
            style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12.0),
          )
        ],
      ),
      accountEmail: Text('ian@urock.kr'),
      currentAccountPicture: CircleAvatar(),
      otherAccountsPictures: [CircleAvatar(backgroundColor: Colors.grey)],
      onDetailsPressed: onDetailsPressed,
      decoration: BoxDecoration(
          color: Colors.blue[500],
          borderRadius:
              const BorderRadius.only(bottomRight: Radius.circular(40.0))),
    );
  }
}
