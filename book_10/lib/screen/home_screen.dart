import 'dart:math';

import 'package:book_10/screen/dice_screen.dart';
import 'package:book_10/screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
  TabController? tabController;
  ShakeDetector? shakeDetector;

  double threshold = 2.7;
  int number = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController!.addListener(tabListener);

    shakeDetector = ShakeDetector.autoStart(onPhoneShake: onPhoneShake,
      shakeSlopTimeMS: 100,
      shakeThresholdGravity: threshold,
    );

  }
  tabListener(){
    setState(() {

    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController!.removeListener(tabListener);
    shakeDetector!.stopListening();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        TabBarView(
          children:  renderChildren(),
          controller: tabController,
        ),
      bottomNavigationBar: renderBottomNavigationBar(),
    );
  }

  List<Widget> renderChildren(){
    return [
      DiceScreen(iNumber: number),
      SettingsScreen(threshold: threshold, onThreshold: onThresholdChange)
    ];
  }

  void onThresholdChange(double val){
    setState(() {
      threshold = val;
    });
  }

  void onPhoneShake() {
    final rand = Random();

    setState(() {
      number = rand.nextInt(5) + 1;
    });
  }

  BottomNavigationBar renderBottomNavigationBar(){
    return BottomNavigationBar(
      onTap: (int index){
        setState(() {
          tabController!.animateTo(index);
        });

      },
        items:
        [ BottomNavigationBarItem(icon: Icon(Icons.apps_outlined), label: 'Dice'), 
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')]
    );
  }


}

 


