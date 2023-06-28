import 'package:calendarschedule/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  final DateTime? selectedDay;
  final DateTime focusedDay;

  final OnDaySelected onDaySelected;
  const Calendar({required this.selectedDay, required this.focusedDay, required this.onDaySelected,  Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultBoxDecoration = BoxDecoration(
        borderRadius: BorderRadius.circular(6.0), color: Colors.grey[200]);

    final defaultTextStyle =  TextStyle(
        color: Colors.grey[600],
        fontWeight: FontWeight.w700,
    );
    // 현재 날짜
    // 가장 첫 번쨰 날짜 (최소 날짜)
    // 가장 마지막 날짜 (최대 날짜)
    return TableCalendar(
      locale: 'ko_KR',
      focusedDay: focusedDay,
      firstDay: DateTime(1900),
      lastDay: DateTime(2200),
      headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle:
              TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0)),
      calendarStyle: CalendarStyle(
        outsideDecoration: defaultBoxDecoration.copyWith(color:Colors.grey[100]),
          todayDecoration: defaultBoxDecoration.copyWith(color:Colors.blue[200]),
          defaultDecoration: defaultBoxDecoration,
          weekendDecoration: defaultBoxDecoration,
          defaultTextStyle: defaultTextStyle,
          weekendTextStyle: defaultTextStyle,
          selectedTextStyle: defaultTextStyle.copyWith(color: PRIMARY_COLOR),
          selectedDecoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(6.0), border: Border.all(color: PRIMARY_COLOR, width: 1.0))),
      onDaySelected: onDaySelected,
      selectedDayPredicate: (DateTime dateTime) {
        if (selectedDay == null) return false;
        return dateTime.year == selectedDay!.year &&
            dateTime.month == selectedDay!.month &&
            dateTime.day == selectedDay!.day;
      },
    );
  }
}
