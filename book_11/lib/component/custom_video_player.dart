import 'dart:io';

import 'package:book_11/component/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  GestureTapCallback onGallaryPressed;
  XFile video;

  CustomVideoPlayer(
      {required this.video, required this.onGallaryPressed, super.key});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController? controller;
  bool showControl = false;

  @override
  void initState() {
    super.initState();
    print("[CustomVideoPlayer] initState()");
    initalizeController();

  }

  @override
  void didUpdateWidget(covariant CustomVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("[TESTER][CustomVideoPlayer] didUpdateWidget()");
    if (oldWidget.video.path != widget.video.path) {
      initalizeController();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller!.removeListener(videoControllerListener);
    print("[TESTER][CustomVideoPlayer] dispose()");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("[TESTER][CustomVideoPlayer] build()");
    if (controller == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          showControl = !showControl;
          print('show');
        });
      },
      child: AspectRatio(
        aspectRatio: controller!.value.aspectRatio,
        child: Stack(children: [
          VideoPlayer(controller!),
          if (showControl) Container(color: Colors.black.withOpacity(0.5)),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(children: [
                  renderTimeTextFromDuration(
                    controller!.value.position,
                  ),
                  Expanded(
                    child: Slider(
                      onChanged: (double value) {
                        controller!.seekTo(Duration(seconds: value.toInt()));
                      },
                      value: controller!.value.position.inSeconds.toDouble(),
                      min: 0,
                      max: controller!.value.duration.inSeconds.toDouble(),
                    ),
                  ),
                ]),
              )),
          if (showControl)
            Align(
              alignment: Alignment.topRight,
              child: CustomIconButton(
                iconData: Icons.photo_camera_back,
                onPressed: widget.onGallaryPressed,
              ),
            ),
          if (showControl)
            Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomIconButton(
                        iconData: Icons.rotate_left, onPressed: onBackPressed),
                    CustomIconButton(
                      iconData: controller!.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      onPressed: onPlayPressed,
                    ),
                    CustomIconButton(
                        iconData: Icons.rotate_right,
                        onPressed: onForwardPressed)
                  ],
                )),
        ]),
      ),
    );
  }

  void initalizeController() async {
    final controller = VideoPlayerController.file(File(widget.video.path));

    await controller.initialize();

    controller.addListener(videoControllerListener);

    setState(() {
      this.controller = controller;
    });
  }

  void onBackPressed() {
    final currentPosition = controller!.value.position;
    Duration position = currentPosition;

    if (currentPosition.inSeconds - 3 > 0) {
      position = currentPosition - const Duration(seconds: 3);
    }

    controller!.seekTo(position);
  }

  void onPlayPressed() {
    if (controller!.value.isPlaying) {
      controller!.pause();
    } else {
      controller!.play();
    }
  }

  void onForwardPressed() {
    final currentPosition = controller!.value.position;
    final maxPosition = controller!.value.duration;
    Duration position = currentPosition;

    if (currentPosition.inSeconds + 3 < maxPosition.inSeconds) {
      position = currentPosition + const Duration(seconds: 3);
    }
    controller!.seekTo(position);
  }

  void videoControllerListener() {
    setState(() {

    });
  }

  Widget renderTimeTextFromDuration(Duration position) {
    print(controller!.value.position);
    return Text(
    '${position.inMinutes.toString().padLeft(2, '0')}:${(position.inSeconds % 60).toString().padLeft(2, '0')}',
      style: const TextStyle(color :Colors.white),
    );
  }
}
