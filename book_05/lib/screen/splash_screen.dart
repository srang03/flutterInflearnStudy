import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.red,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('asset/img/index-cont-img-1.png', width: 200.0,),
        Padding( padding: EdgeInsets.all(50), child: CircularProgressIndicator(color: Colors.white,))],
      ),
    );
  }
}
