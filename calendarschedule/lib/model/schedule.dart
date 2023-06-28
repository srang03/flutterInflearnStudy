import 'package:drift/drift.dart';

class Shedules extends Table {
  // PRIMARY KEY

  IntColumn get id => integer().autoIncrement()();

  // 내용
  TextColumn get content => text()();

  // 일정 날짜
  DateTimeColumn get date => dateTime()();

  // 시작 시간
  IntColumn get startTime => integer()();

  // Category Color Table ID
  IntColumn get colorId => integer()();

  // 생성 날짜
  DateTimeColumn get createdDateTime => dateTime().clientDefault(() => DateTime.now())();

  // 수정 날짜
  DateTimeColumn get modifiedDateTime => dateTime().clientDefault(() => DateTime.now())();
}
