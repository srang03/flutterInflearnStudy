import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../component/custom_video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  XFile? video;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: video == null ? renderEmpty() : renderVideo(),
    );
  }

  Widget renderVideo(){
    return Center(
      child: CustomVideoPlayer(video: video!, onNewVideoPressed: onNewVideoPressed),
    );
  }
  Widget renderEmpty() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: getBoxDecoration(),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Logo(onTap: onNewVideoPressed, path: 'asset/img/logo.png',),
          const SizedBox(
            height: 30.0,
          ),
          AppName()
        ],
      ),
    );
  }

  void onNewVideoPressed() async{
    final video = await ImagePicker().pickVideo(source: ImageSource.gallery);

    if(video != null) {
      setState(() {
        this.video = video;
      });
    }
  }

  BoxDecoration getBoxDecoration() {
    return const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2A3A7C), Color(0xFF000128)]),
        color: Colors.black);
  }
}

class Logo extends StatelessWidget {
  final String path;
  final VoidCallback onTap;
  const Logo({required this.onTap, required this.path, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: Image.asset(path));
  }
}

class AppName extends StatelessWidget {
  const AppName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 30.0,
      fontWeight: FontWeight.w300,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'VIDEO',
          style: textStyle,
        ),
        Text(
          'PLAYER',
          style: textStyle.copyWith(
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
