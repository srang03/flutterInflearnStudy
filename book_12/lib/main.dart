import 'package:book_12/screen/home_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  late List<CameraDescription> _cameras;
  _cameras = await availableCameras();

  runApp(MaterialApp(
    home: HomeScreen(cameras: _cameras),
  ));
}

