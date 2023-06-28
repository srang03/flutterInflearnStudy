import 'package:calendarschedule/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // Flutter 프레임워크가 준비되었는지 확인 (RunApp을 실행하면 원래 자동으로 실행되는 함수임)

  await initializeDateFormatting(); // 초기화

  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'NotoSans'
    ),
    home: const HomeScreen()
  ));
}
