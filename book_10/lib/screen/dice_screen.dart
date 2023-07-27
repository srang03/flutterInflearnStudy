import 'package:book_10/const/Colors.dart';
import 'package:flutter/material.dart';

class DiceScreen extends StatelessWidget {
  final int iNumber;
  const DiceScreen({required this.iNumber, super.key});

  @override
  Widget build(BuildContext context) {

    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child:
          Text("Dice", style: TextStyle(
            color: Colors.white, fontSize: 32.0
          ),)),
        SizedBox(height: 16,),
        Center(child:
        Image.asset("asset/img/$iNumber.png"),),
        SizedBox(height: 16,),
        Text("The Number is $iNumber", style:
          TextStyle(color: secondaryColor, fontSize: 20.0, fontWeight: FontWeight.w600),),
      ],
    );
  }
}
