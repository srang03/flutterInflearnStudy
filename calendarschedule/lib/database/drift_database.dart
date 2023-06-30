// import를 통해 private 값들을 불러올 수 없다.
import 'dart:async';
import 'dart:async';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

import '../model/category_color.dart';
import '../model/schedule.dart';
import 'package:path/path.dart' as p;

// import보다 더 넓은 데이터를 가져올 수 있다. (private 값들을 불러올 수 있다.)
part 'drift_database.g.dart'; // 현재는 파일이 존재하지 않고, generated 자동으로 파일 생성

@DriftDatabase(
  tables: [ Schedules, CategoryColor ],
)

// _$LocalDatabase 클래스는 원래 존재하지 않는다.
// Drift가 drift_database.g.dart 안에 _$LocalDatabase를 자동으로 만들어 준다.
class LocalDatabase extends _$LocalDatabase{
  LocalDatabase(): super(_openConnection());

  // Insert Query
  Future<int> createSchedule(SchedulesCompanion data){
     return into(schedules).insert(data);
  }

  Future<int> createCategoryColor(CategoryColorCompanion data){
    return into(categoryColors).insert(data);
  }

  Future<List<CategoryColorData>> getCategoryColors(){
    return select(categoryColors).get();
  }
  @override
  // TODO: implement schemaVersion
  // 데이터베이스에 테이블의 상태
  // 데이터 베이스의 테이블의 구조가 변경될 때 스키마 버전이 올라가야한다.
  int get schemaVersion => 1;
}

// SQLite에 Drift를 연결하고자 할 때
// 연결하고자 하는 데이터베이스를 생성할 때
// 현재 파일과 g가 포함된 이름을 part으로 불러온다.
// 우리가 사용할 데이터 베이스의 이름을 짓어 클래스를 생성하고, _$클래스명을 상속받는다.

// 데이터베이스 파일을 어떤 위치에 생성하고 관리할지 지정한다.
LazyDatabase _openConnection(){
  return LazyDatabase(() async {
    // 앱전용으로 사용할 수 있는 배정된 폴더 위치
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    // Database 생성
    return NativeDatabase(file);
  } );
}
