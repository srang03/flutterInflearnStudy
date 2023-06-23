import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final XFile video;
  final VoidCallback onNewVideoPressed;

  const CustomVideoPlayer({required this.onNewVideoPressed, required this.video, Key? key}) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController? videoController;
  Duration currentPosition = Duration();
  bool showControls = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeController();
  }
  @override
  void didUpdateWidget(covariant CustomVideoPlayer oldWidget){
    super.didUpdateWidget(oldWidget);
    if(oldWidget.video.path != widget.video.path){
      initializeController();
    }
  }

  initializeController() async {
    currentPosition = Duration();

    videoController = VideoPlayerController.file(File(widget.video.path));
    await videoController!.initialize();

    videoController!.addListener(() async {
      final currentPosition = videoController!.value.position;
      setState(() {
        this.currentPosition = currentPosition;
      });
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (videoController == null) {
      return const CircularProgressIndicator();
    }
    return AspectRatio(
      aspectRatio: videoController!.value.aspectRatio,
      child: GestureDetector(
        onTap: (){
          setState(() {
            showControls = !showControls;
          });
        },
        child: Stack(children: [
          VideoPlayer(
            videoController!,
          ),
          if(showControls)
          Controls(
            onForwardPressed: onForwardPresed,
            onPlayPressed: onPlayPressed,
            onReversePressed: onReversePressed,
            isPlaying: videoController!.value.isPlaying,
          ),
          if(showControls)
          NewVideo(onPressed: widget.onNewVideoPressed),
          if(showControls)
          SliderBottom(
              onSliderChanged: onSliderChanged,
              maxPosition: videoController!.value.duration,
              currentPosition: currentPosition)
        ]),
      ),
    );
  }

  void onSliderChanged(double value) {
    videoController!.seekTo(Duration(seconds: value.toInt()));
  }

  void onForwardPresed() {
    final currentPosition = videoController!.value.position;
    Duration position = videoController!.value.duration;

    if (position.inSeconds - currentPosition.inSeconds > 3) {
      position = currentPosition + const Duration(seconds: 3);
      // 90초 - 60초 == 30초
      // 90초 - 98초 == 2초
    }
    videoController!.seekTo(position);
  }

  void onPlayPressed() {
    // 이미 실행 중이면 중지
    // 정지된 상태이면 실행
    setState(() {
      if (videoController!.value.isPlaying) {
        videoController!.pause();
      } else {
        videoController!.play();
      }
    });
  }

  void onReversePressed() {
    final currentPosition = videoController!.value.position;
    Duration position = const Duration();
    if (currentPosition.inSeconds > 3) {
      position = currentPosition - const Duration(seconds: 3);
    }
    videoController!.seekTo(position);
  }
}

class Controls extends StatelessWidget {
  final VoidCallback onPlayPressed;
  final VoidCallback onReversePressed;
  final VoidCallback onForwardPressed;
  final bool isPlaying;

  const Controls(
      {required this.onForwardPressed,
      required this.onPlayPressed,
      required this.onReversePressed,
      required this.isPlaying,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.black.withOpacity(0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          renderIconButton(
              iconData: Icons.rotate_left, onPressed: onReversePressed),
          renderIconButton(
              iconData: isPlaying ? Icons.pause : Icons.play_arrow,
              onPressed: onPlayPressed),
          renderIconButton(
              iconData: Icons.rotate_right, onPressed: onForwardPressed),
        ],
      ),
    );
  }

  Widget renderIconButton(
      {required VoidCallback onPressed, required IconData iconData}) {
    return IconButton(
        onPressed: onPressed,
        iconSize: 30.0,
        color: Colors.white,
        icon: Icon(iconData));
  }
}

class NewVideo extends StatelessWidget {
  final VoidCallback onPressed;
  const NewVideo({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 0,
        child: IconButton(
            color: Colors.white,
            onPressed: onPressed,
            icon: const Icon(
              Icons.photo_camera_back,
              size: 30.0,
            )));
  }
}

class SliderBottom extends StatelessWidget {
  final Duration currentPosition;
  final Duration maxPosition;
  final ValueChanged<double> onSliderChanged;

  const SliderBottom(
      {required this.onSliderChanged,
      required this.maxPosition,
      required this.currentPosition,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(children: [
          Text(
            '${(currentPosition.inMinutes).toString().padLeft(2, '0')}:${(currentPosition.inSeconds % 60).toString().padLeft(2, '0')}',
            style: const TextStyle(color: Colors.white),
          ),
          Expanded(
            child: Slider(
              max: maxPosition.inSeconds.toDouble(),
              min: 0,
              value: currentPosition.inSeconds.toDouble(),
              onChanged: onSliderChanged,
            ),
          ),
          Text(
            '${(maxPosition.inMinutes).toString().padLeft(2, '0')}:${(maxPosition.inSeconds % 60).toString().padLeft(2, '0')}',
            style: const TextStyle(color: Colors.white),
          ),
        ]),
      ),
    );
  }
}
