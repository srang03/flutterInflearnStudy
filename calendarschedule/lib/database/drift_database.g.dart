// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $ShedulesTable extends Schedules with TableInfo<$ShedulesTable, Shedule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShedulesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<int> startTime = GeneratedColumn<int>(
      'start_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _colorIdMeta =
      const VerificationMeta('colorId');
  @override
  late final GeneratedColumn<int> colorId = GeneratedColumn<int>(
      'color_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdDateTimeMeta =
      const VerificationMeta('createdDateTime');
  @override
  late final GeneratedColumn<DateTime> createdDateTime =
      GeneratedColumn<DateTime>('created_date_time', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          clientDefault: () => DateTime.now());
  static const VerificationMeta _modifiedDateTimeMeta =
      const VerificationMeta('modifiedDateTime');
  @override
  late final GeneratedColumn<DateTime> modifiedDateTime =
      GeneratedColumn<DateTime>('modified_date_time', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          clientDefault: () => DateTime.now());
  @override
  List<GeneratedColumn> get $columns => [
        id,
        content,
        date,
        startTime,
        colorId,
        createdDateTime,
        modifiedDateTime
      ];
  @override
  String get aliasedName => _alias ?? 'shedules';
  @override
  String get actualTableName => 'shedules';
  @override
  VerificationContext validateIntegrity(Insertable<Shedule> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('color_id')) {
      context.handle(_colorIdMeta,
          colorId.isAcceptableOrUnknown(data['color_id']!, _colorIdMeta));
    } else if (isInserting) {
      context.missing(_colorIdMeta);
    }
    if (data.containsKey('created_date_time')) {
      context.handle(
          _createdDateTimeMeta,
          createdDateTime.isAcceptableOrUnknown(
              data['created_date_time']!, _createdDateTimeMeta));
    }
    if (data.containsKey('modified_date_time')) {
      context.handle(
          _modifiedDateTimeMeta,
          modifiedDateTime.isAcceptableOrUnknown(
              data['modified_date_time']!, _modifiedDateTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Shedule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Shedule(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}start_time'])!,
      colorId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color_id'])!,
      createdDateTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}created_date_time'])!,
      modifiedDateTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}modified_date_time'])!,
    );
  }

  @override
  $ShedulesTable createAlias(String alias) {
    return $ShedulesTable(attachedDatabase, alias);
  }
}

class Shedule extends DataClass implements Insertable<Shedule> {
  final int id;
  final String content;
  final DateTime date;
  final int startTime;
  final int colorId;
  final DateTime createdDateTime;
  final DateTime modifiedDateTime;
  const Shedule(
      {required this.id,
      required this.content,
      required this.date,
      required this.startTime,
      required this.colorId,
      required this.createdDateTime,
      required this.modifiedDateTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['content'] = Variable<String>(content);
    map['date'] = Variable<DateTime>(date);
    map['start_time'] = Variable<int>(startTime);
    map['color_id'] = Variable<int>(colorId);
    map['created_date_time'] = Variable<DateTime>(createdDateTime);
    map['modified_date_time'] = Variable<DateTime>(modifiedDateTime);
    return map;
  }

  SchedulesCompanion toCompanion(bool nullToAbsent) {
    return SchedulesCompanion(
      id: Value(id),
      content: Value(content),
      date: Value(date),
      startTime: Value(startTime),
      colorId: Value(colorId),
      createdDateTime: Value(createdDateTime),
      modifiedDateTime: Value(modifiedDateTime),
    );
  }

  factory Shedule.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Shedule(
      id: serializer.fromJson<int>(json['id']),
      content: serializer.fromJson<String>(json['content']),
      date: serializer.fromJson<DateTime>(json['date']),
      startTime: serializer.fromJson<int>(json['startTime']),
      colorId: serializer.fromJson<int>(json['colorId']),
      createdDateTime: serializer.fromJson<DateTime>(json['createdDateTime']),
      modifiedDateTime: serializer.fromJson<DateTime>(json['modifiedDateTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'content': serializer.toJson<String>(content),
      'date': serializer.toJson<DateTime>(date),
      'startTime': serializer.toJson<int>(startTime),
      'colorId': serializer.toJson<int>(colorId),
      'createdDateTime': serializer.toJson<DateTime>(createdDateTime),
      'modifiedDateTime': serializer.toJson<DateTime>(modifiedDateTime),
    };
  }

  Shedule copyWith(
          {int? id,
          String? content,
          DateTime? date,
          int? startTime,
          int? colorId,
          DateTime? createdDateTime,
          DateTime? modifiedDateTime}) =>
      Shedule(
        id: id ?? this.id,
        content: content ?? this.content,
        date: date ?? this.date,
        startTime: startTime ?? this.startTime,
        colorId: colorId ?? this.colorId,
        createdDateTime: createdDateTime ?? this.createdDateTime,
        modifiedDateTime: modifiedDateTime ?? this.modifiedDateTime,
      );
  @override
  String toString() {
    return (StringBuffer('Shedule(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('date: $date, ')
          ..write('startTime: $startTime, ')
          ..write('colorId: $colorId, ')
          ..write('createdDateTime: $createdDateTime, ')
          ..write('modifiedDateTime: $modifiedDateTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, content, date, startTime, colorId, createdDateTime, modifiedDateTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Shedule &&
          other.id == this.id &&
          other.content == this.content &&
          other.date == this.date &&
          other.startTime == this.startTime &&
          other.colorId == this.colorId &&
          other.createdDateTime == this.createdDateTime &&
          other.modifiedDateTime == this.modifiedDateTime);
}

class SchedulesCompanion extends UpdateCompanion<Shedule> {
  final Value<int> id;
  final Value<String> content;
  final Value<DateTime> date;
  final Value<int> startTime;
  final Value<int> colorId;
  final Value<DateTime> createdDateTime;
  final Value<DateTime> modifiedDateTime;
  const SchedulesCompanion({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
    this.date = const Value.absent(),
    this.startTime = const Value.absent(),
    this.colorId = const Value.absent(),
    this.createdDateTime = const Value.absent(),
    this.modifiedDateTime = const Value.absent(),
  });
  SchedulesCompanion.insert({
    this.id = const Value.absent(),
    required String content,
    required DateTime date,
    required int startTime,
    required int colorId,
    this.createdDateTime = const Value.absent(),
    this.modifiedDateTime = const Value.absent(),
  })  : content = Value(content),
        date = Value(date),
        startTime = Value(startTime),
        colorId = Value(colorId);
  static Insertable<Shedule> custom({
    Expression<int>? id,
    Expression<String>? content,
    Expression<DateTime>? date,
    Expression<int>? startTime,
    Expression<int>? colorId,
    Expression<DateTime>? createdDateTime,
    Expression<DateTime>? modifiedDateTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (content != null) 'content': content,
      if (date != null) 'date': date,
      if (startTime != null) 'start_time': startTime,
      if (colorId != null) 'color_id': colorId,
      if (createdDateTime != null) 'created_date_time': createdDateTime,
      if (modifiedDateTime != null) 'modified_date_time': modifiedDateTime,
    });
  }

  SchedulesCompanion copyWith(
      {Value<int>? id,
      Value<String>? content,
      Value<DateTime>? date,
      Value<int>? startTime,
      Value<int>? colorId,
      Value<DateTime>? createdDateTime,
      Value<DateTime>? modifiedDateTime}) {
    return SchedulesCompanion(
      id: id ?? this.id,
      content: content ?? this.content,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      colorId: colorId ?? this.colorId,
      createdDateTime: createdDateTime ?? this.createdDateTime,
      modifiedDateTime: modifiedDateTime ?? this.modifiedDateTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<int>(startTime.value);
    }
    if (colorId.present) {
      map['color_id'] = Variable<int>(colorId.value);
    }
    if (createdDateTime.present) {
      map['created_date_time'] = Variable<DateTime>(createdDateTime.value);
    }
    if (modifiedDateTime.present) {
      map['modified_date_time'] = Variable<DateTime>(modifiedDateTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShedulesCompanion(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('date: $date, ')
          ..write('startTime: $startTime, ')
          ..write('colorId: $colorId, ')
          ..write('createdDateTime: $createdDateTime, ')
          ..write('modifiedDateTime: $modifiedDateTime')
          ..write(')'))
        .toString();
  }
}

class $CategoryColorTable extends CategoryColor
    with TableInfo<$CategoryColorTable, CategoryColorData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryColorTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _hexColorMeta =
      const VerificationMeta('hexColor');
  @override
  late final GeneratedColumn<String> hexColor = GeneratedColumn<String>(
      'hex_color', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, hexColor];
  @override
  String get aliasedName => _alias ?? 'category_color';
  @override
  String get actualTableName => 'category_color';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryColorData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('hex_color')) {
      context.handle(_hexColorMeta,
          hexColor.isAcceptableOrUnknown(data['hex_color']!, _hexColorMeta));
    } else if (isInserting) {
      context.missing(_hexColorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryColorData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryColorData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      hexColor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hex_color'])!,
    );
  }

  @override
  $CategoryColorTable createAlias(String alias) {
    return $CategoryColorTable(attachedDatabase, alias);
  }
}

class CategoryColorData extends DataClass
    implements Insertable<CategoryColorData> {
  final int id;
  final String hexColor;
  const CategoryColorData({required this.id, required this.hexColor});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['hex_color'] = Variable<String>(hexColor);
    return map;
  }

  CategoryColorCompanion toCompanion(bool nullToAbsent) {
    return CategoryColorCompanion(
      id: Value(id),
      hexColor: Value(hexColor),
    );
  }

  factory CategoryColorData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryColorData(
      id: serializer.fromJson<int>(json['id']),
      hexColor: serializer.fromJson<String>(json['hexColor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'hexColor': serializer.toJson<String>(hexColor),
    };
  }

  CategoryColorData copyWith({int? id, String? hexColor}) => CategoryColorData(
        id: id ?? this.id,
        hexColor: hexColor ?? this.hexColor,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryColorData(')
          ..write('id: $id, ')
          ..write('hexColor: $hexColor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, hexColor);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryColorData &&
          other.id == this.id &&
          other.hexColor == this.hexColor);
}

class CategoryColorCompanion extends UpdateCompanion<CategoryColorData> {
  final Value<int> id;
  final Value<String> hexColor;
  const CategoryColorCompanion({
    this.id = const Value.absent(),
    this.hexColor = const Value.absent(),
  });
  CategoryColorCompanion.insert({
    this.id = const Value.absent(),
    required String hexColor,
  }) : hexColor = Value(hexColor);
  static Insertable<CategoryColorData> custom({
    Expression<int>? id,
    Expression<String>? hexColor,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (hexColor != null) 'hex_color': hexColor,
    });
  }

  CategoryColorCompanion copyWith({Value<int>? id, Value<String>? hexColor}) {
    return CategoryColorCompanion(
      id: id ?? this.id,
      hexColor: hexColor ?? this.hexColor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (hexColor.present) {
      map['hex_color'] = Variable<String>(hexColor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryColorCompanion(')
          ..write('id: $id, ')
          ..write('hexColor: $hexColor')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  late final $ShedulesTable schedules = $ShedulesTable(this);
  late final $CategoryColorTable categoryColors = $CategoryColorTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [schedules, categoryColors];
}
