import 'dart:math';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 16.0,
    );
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<int>(
            stream: stremNumbers(),
            builder: (context, AsyncSnapshot<int> snapshot) {
              if (snapshot.hasData) {
                // 데이터가 있을 때 위젯 렌더링
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'StreamBuilder',
                      style: textStyle.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 20.0),
                    ),
                    Text('ConState: ${snapshot.connectionState}'),
                    Text('Data: ${snapshot.data}'),
                    Text('Error: ${snapshot.error}'),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: Text('Set State'))
                  ],
                );
              }
              if (snapshot.hasError) {
                // 에러가 났을 때 위젯 렌더링
              }
              // 로딩중일 때 위젯 렌더링
              return Center(child: CircularProgressIndicator(),);
            },
          ),
        ));
  }

  Stream<int> stremNumbers() async* {
    for(int i = 0; i< 10; i++){
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }
      
}