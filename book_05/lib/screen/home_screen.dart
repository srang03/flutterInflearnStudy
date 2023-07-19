import 'package:book_05/component/custom_container.dart';
import 'package:book_05/screen/splash_screen.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:
      SplashScreen(),
    );
  }
}
