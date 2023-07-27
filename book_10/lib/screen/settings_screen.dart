import 'package:flutter/material.dart';

import '../const/Colors.dart';

class SettingsScreen extends StatelessWidget {
  final double threshold;
  final ValueChanged<double> onThreshold;

  const SettingsScreen({required this.threshold, required this.onThreshold, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("민감도", style: ts18,),
        Slider(
        min: 0.1,
        max: 10.0,
        divisions: 101,
        label: threshold.toStringAsFixed(1),
        value: threshold,
            onChanged: onThreshold)
      ],
    );
  }
}
