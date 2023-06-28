import 'package:codingcheff_basic/screen/home_screen.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    title: 'My App',
    home: HomeScreen(),
    theme: ThemeData(
      // 앱에서 사용할 색상 견본
      primarySwatch:  Colors.blue
    ),
  ));
}