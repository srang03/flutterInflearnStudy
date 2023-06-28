import 'package:calendarschedule/component/new_schedule_bottom_sheet.dart';
import 'package:calendarschedule/component/schedule_card.dart';
import 'package:calendarschedule/component/today_banner.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../component/calendar.dart';
import '../const/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: rednerFloatingActionButton(),
        body: SafeArea(
          child: Column(
            children: [
              Calendar(
                onDaySelected: onDaySelected,
                selectedDay: selectedDay,
                focusedDay: focusedDay,
              ),
              const SizedBox(
                height: 8.0,
              ),
              TodayBanner(selectedDay: selectedDay, scheduleCount: 3),
              const SizedBox(
                height: 8.0,
              ),
              _ScheduleList(),
            ],
          ),
        ));
  }

  FloatingActionButton rednerFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
            context: context,
            builder: (builder) {
              return ScheduleBottomSheet();
            });
      },
      child: const Icon(Icons.add),
      backgroundColor: PRIMARY_COLOR,
    );
  }

  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = focusedDay;
    });
  }
}

class _ScheduleList extends StatelessWidget {
  const _ScheduleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.separated(
              itemCount: 100,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 8.0,
                );
              },
              itemBuilder: (context, index) {
                return ScheduleCard(
                    color: Colors.red,
                    content: 'Study $index',
                    startTime: 12,
                    endTime: 14);
              })),
    );
  }
}
