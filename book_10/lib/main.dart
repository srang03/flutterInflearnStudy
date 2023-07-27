import 'package:book_10/const/Colors.dart';
import 'package:book_10/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const HomeScreen(),
    theme:
    ThemeData(
      scaffoldBackgroundColor: backgroundColor,
      sliderTheme: SliderThemeData(
        thumbColor: primartColor,
        activeTickMarkColor: primartColor,
        inactiveTrackColor: primartColor.withOpacity(0.3),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primartColor,
        unselectedItemColor: secondaryColor,
        backgroundColor: backgroundColor
      ),

    ),
  ));
}
