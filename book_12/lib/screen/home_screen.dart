import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class HomeScreen extends StatelessWidget {
  final cameras;
  HomeScreen({required this.cameras, super.key});



  @override
 Widget build(BuildContext context) {


    return Scaffold(
      body: CameraApp(
        cameras: cameras,
      ),
    );
  }
}

class CameraApp extends StatefulWidget {
  List<CameraDescription> cameras;

  CameraApp({required this.cameras, super.key});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeCamera();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (!controller.value.isInitialized) ? Container() : CameraPreview(controller),
    );

  }


  void initializeCamera() async {
    try {
      controller = CameraController(widget.cameras[0], ResolutionPreset.max);

      await controller.initialize();
      setState(() {});
    } catch (e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print("User denied camera access");
            break;
          default:
            print('Handle other errors');
            break;
        }
      }
    }
  }
}
