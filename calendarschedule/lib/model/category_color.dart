import 'package:drift/drift.dart';

class CategoryColor extends Table{
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // 색상 HEX 값
  TextColumn get hexColor => text()();
}