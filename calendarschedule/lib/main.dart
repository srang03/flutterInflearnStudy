import 'package:calendarschedule/screen/home_screen.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'database/drift_database.dart';

const DEFAULT_COLORS = [
  'F44336',
  'FF9800',
  'FFEB3B',
  'FCAF50',
  '2196F3',
  '3F51B5',
  '9C27B0'
];

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // Flutter 프레임워크가 준비되었는지 확인 (RunApp을 실행하면 원래 자동으로 실행되는 함수임)

  await initializeDateFormatting(); // 초기화

  // Database 클래스 인스턴스화
  final database = LocalDatabase();

  final colors = await database.getCategoryColors();
  if(colors.isEmpty){
    for(String hexCode in DEFAULT_COLORS){
      await database.createCategoryColor(CategoryColorCompanion(hexColor: Value(hexCode)));
    }
  }

  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'NotoSans'
    ),
    home: const HomeScreen()
  ));
}
