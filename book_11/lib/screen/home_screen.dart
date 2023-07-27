import 'package:book_11/component/custom_video_player.dart';
import 'package:book_11/screen/empty_screen.dart';
import 'package:book_11/screen/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  XFile? video;

  @override
  Widget build(BuildContext context) {
    print("[TESTER][home_scrren] build()");
    return Scaffold(
        backgroundColor: Colors.black,
        body: video == null ? EmptyScreen(onSelectPressed: onSelectPressed, title: 'Player',) : VideoScreen(video: video!, onSelectPressed: onSelectPressed));
  }
  /* render Empty Start */


  void onSelectPressed() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.gallery);

    if(video != null){
      setState(() {
        this.video = video;
        print("[TESTER][home_scrren] setState()");
      });
    }
  }

  /* render Empty End */

  /* render video Start */

/* render video End */
}

