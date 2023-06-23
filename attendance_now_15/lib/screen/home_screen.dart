import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isChoolCheckDone = false;
  GoogleMapController? mapController;
  // latitude - 위도
  // longtitude - 경도

  static final LatLng companyLatLng = LatLng(
    37.4139121,
    127.0995472,
  );

  static final double okDistance = 100;
  static final Circle withinDistanceCircle = Circle(
      circleId: CircleId('withinDistanceCircle'),
      center: companyLatLng,
      fillColor: Colors.blueAccent.withOpacity(0.5),
      radius: okDistance,
      strokeColor: Colors.blue,
      strokeWidth: 1);

  static final Circle notWithinDistanceCircle = Circle(
      circleId: CircleId('notWithinDistanceCircle'),
      center: companyLatLng,
      fillColor: Colors.redAccent.withOpacity(0.5),
      radius: okDistance,
      strokeColor: Colors.red,
      strokeWidth: 1);

  static final Circle checkDoneCircle = Circle(
      circleId: CircleId('checkDoneCircle'),
      center: companyLatLng,
      fillColor: Colors.greenAccent.withOpacity(0.5),
      radius: okDistance,
      strokeColor: Colors.green,
      strokeWidth: 1);

  static final Marker marker = Marker(
    markerId: MarkerId('marker'),
    position: companyLatLng,
  );
  static final CameraPosition initialPosition = CameraPosition(
    target: companyLatLng,
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppbar(),
      body: FutureBuilder<String>(
        future: checkPermission(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.data == '[Alert] 위치 권한이 허가되었습니다.') {
            return StreamBuilder<Position>(
                stream: Geolocator.getPositionStream(),
                builder: (context, snapshot) {
                  bool isWithinRange = false;

                  if (snapshot.hasData) {
                    final start = snapshot.data!;
                    final end = companyLatLng;
                    final distance = Geolocator.distanceBetween(start.latitude,
                        start.longitude, end.latitude, end.longitude);

                    if (distance < okDistance) {
                      isWithinRange = true;
                    }
                  }
                  return Column(children: [
                    CustomGoogleMap(
                        onMapCreated: onMapCreated,
                        initialPosition: initialPosition,
                        marker: marker,
                        circle: isChoolCheckDone
                            ? checkDoneCircle
                            : isWithinRange
                                ? withinDistanceCircle
                                : notWithinDistanceCircle),
                    ChoolCheckButton(
                      onPressed: onChoolCheckPressed,
                      isChoolCheckDone: isChoolCheckDone,
                      isWithinRange: isWithinRange,
                    ),
                  ]);
                });
          }
          return Center(
            child: Text(snapshot.data),
          );
        },
      ),
    );
  }
  void onMapCreated(GoogleMapController controller){
    mapController = controller;
  }

  void onChoolCheckPressed() async {
    final result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("출근하기"),
            content: Text("출근을 하시겠습니까?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text('취소')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text('네'))
            ],
          );
        });

    if (result) {
      setState(() {
        isChoolCheckDone = result;
      });
    }
  }

  Future<String> checkPermission() async {
    // 휴대폰 기기에 대한 위치 서비스 활성화 여부 체크
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationEnabled) {
      return '[Alert] 위치 서비스를 활성화 해주세요.';
    }

    // 앱이 가지고 있는 위치서비스 권한 여부 체크크
    LocationPermission checkedPermission = await Geolocator.checkPermission();
    if (checkedPermission == LocationPermission.denied) {
      checkedPermission = await Geolocator.requestPermission();
    }

    if (checkedPermission == LocationPermission.denied) {
      return '[Alert] 앱의 위치 권한을 설정에서 허가해주세요';
    }

    if (checkedPermission == LocationPermission.deniedForever) {
      return '[Alert] 앱의 위치 권한을 설정에서 허가해주세요';
    }

    return '[Alert] 위치 권한이 허가되었습니다.';
  }
  AppBar renderAppbar() {

    return AppBar(
      title: const Text(
        'Today Attendance',
        style: TextStyle(
          color: Colors.blue,
        ),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () async {
            if(mapController == null) return;
            final location = await Geolocator.getCurrentPosition();
            mapController!.animateCamera(CameraUpdate.newLatLng(LatLng(location.latitude, location.longitude)));
          },
          icon: Icon(Icons.my_location),
          color: Colors.blue,
        )
      ],
    );
  }
}


class CustomGoogleMap extends StatelessWidget {
  final CameraPosition initialPosition;
  final Circle circle;
  final Marker marker;
  final MapCreatedCallback onMapCreated;

  const CustomGoogleMap(
      {required this.circle,
      required this.marker,
      required this.initialPosition,
      required this.onMapCreated,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: GoogleMap(
        onMapCreated: onMapCreated,
        circles: {circle},
        markers: {marker},
        initialCameraPosition: initialPosition,
        mapType: MapType.terrain,
        myLocationButtonEnabled: false,
        myLocationEnabled: true,
      ),
    );
  }
}

class ChoolCheckButton extends StatelessWidget {
  final bool isWithinRange;
  final VoidCallback onPressed;
  final bool isChoolCheckDone;
  const ChoolCheckButton(
      {required this.isChoolCheckDone,
      required this.onPressed,
      required this.isWithinRange,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.timelapse_outlined,
            size: 50.0,
            color: isChoolCheckDone
                ? Colors.greenAccent
                : isWithinRange
                    ? Colors.blue
                    : Colors.red,
          ),
          const SizedBox(height: 10.0),
          if (isWithinRange && !isChoolCheckDone)
            TextButton(onPressed: onPressed, child: Text('출근하기'))
          else
            Text('', style: TextStyle(color: Colors.grey))
        ],
      ),
    );
  }
}
