import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:lilve_camera/const/agora.dart';
import 'package:permission_handler/permission_handler.dart';

class CamScreen extends StatefulWidget {
  const CamScreen({Key? key}) : super(key: key);

  @override
  State<CamScreen> createState() => _CamScreenState();
}

class _CamScreenState extends State<CamScreen> {
  RtcEngine? engine;

  // 채널 접속시 나의 ID
  int? uid = 0;

  // 채널 접속시 상대방 ID
  int? otherUid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LIVE'),
        ),
        body: FutureBuilder(
            future: init(),
            builder: (context, snapshot) {
              if (snapshot.hasError)
                return Center(child: Text(snapshot.error.toString()));

              if (!snapshot.hasData) {
                return Center(
                  child: const CircularProgressIndicator(),
                );
              }
              return Column(children: [
                Expanded(
                    child: Stack(
                  children: [
                    renderMainView(),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          color: Colors.grey,
                          height: 160,
                          width: 120,
                          child: renderSubView()),
                    )
                  ],
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ElevatedButton(
                      onPressed: () async {
                        if (engine != null) {
                          await engine!.leaveChannel();
                          engine = null;
                        }
                        Navigator.of(context).pop();
                      },
                      child: const Text('Exit')),
                )
              ]);
            }));
  }

  renderMainView() {
    if (uid == null) {
      return const Center(
        child: Text('채널에 참여해주세요'),
      );
    } else {
      return AgoraVideoView(
          controller: VideoViewController(
              rtcEngine: engine!,
              canvas: const VideoCanvas(
                uid: 0,
              )));
    }
  }

  renderSubView() {
    if (otherUid == null) {
      return const Center(
        child: Text('채널에 유저가 없습니다.'),
      );
    } else {
      return AgoraVideoView(
          controller: VideoViewController.remote(
              rtcEngine: engine!,
              canvas: VideoCanvas(uid: otherUid),
              connection: const RtcConnection(channelId: CHANNEL_NAME)));
    }
  }

  Future<bool> init() async {
    final resp = await [Permission.camera, Permission.microphone].request();

    final cameraPermission = resp[Permission.camera];
    final microphonePermission = resp[Permission.microphone];

    if (cameraPermission != PermissionStatus.granted ||
        cameraPermission != PermissionStatus.granted) {
      throw '카메라 또는 마이크 권한이 없습니다.';
    }

    if (engine == null) {
      engine = createAgoraRtcEngine();
      await engine!.initialize(const RtcEngineContext(
        appId: APP_ID,
      ));
      engine!.registerEventHandler(RtcEngineEventHandler(
          // 내가 채널에 입장했을 때
          // connection: 연결 정보
          // elapsed: 연결된 시간
          onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
        print('채널에 입장했습니다. uid: ${connection.localUid}');
        uid = connection.localUid;
      },
          // 내가 채널에서 나갔을 때
          onLeaveChannel: (RtcConnection connection, RtcStats stats) {
        print('채널에서 퇴장했습니다.');
        setState(() {
          uid = null;
        });
      },
          // 상대 유저가 채널에 들어왔을 때
          onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
        print('상대가 채널에 입장했습니다. uid: ${remoteUid}');
        setState(() {
          otherUid = remoteUid;
        });
      },

          // 상대 유저가 채널에서 나갔을 때
          onUserOffline: (RtcConnection connection, int remoteUid,
              UserOfflineReasonType reason) {
        print('상대가 채널에서 나갔습니다. otheruid: ${remoteUid}');
        setState(() {
          otherUid = null;
        });
      }));

      // 카메라 활성화
      await engine!.enableVideo();

      // 카메라를 화면에 송출출
      await engine!.startPreview();

      ChannelMediaOptions options = ChannelMediaOptions();
      await engine!.joinChannel(
          token: TEMP_TOKEN, channelId: CHANNEL_NAME, uid: 0, options: options);
    }

    return true;
  }
  @override
  void dispose() async{
    if(engine != null){
      await engine!.leaveChannel(
        options:  LeaveChannelOptions(),
      );
      engine!.release();
    }
    super.dispose();
  }
}
