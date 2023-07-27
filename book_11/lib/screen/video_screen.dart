import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../component/custom_video_player.dart';

class VideoScreen extends StatelessWidget {
  XFile video;
  GestureTapCallback onSelectPressed;

  VideoScreen({required this.video, required this.onSelectPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CustomVideoPlayer(
      video: video,
      onGallaryPressed: onSelectPressed,
    ));
  }
}
