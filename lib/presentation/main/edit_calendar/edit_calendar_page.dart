import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/di/injection.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/data/storage/storage.dart';
import 'package:girls_care/presentation/main/change_calendar_data/widgets/custom_change_calendar.dart';
import 'package:girls_care/presentation/main/home/widgets/calendar_details.dart';
import 'package:girls_care/presentation/main/home/widgets/custom_appbar.dart';

class ChangeCalendar extends StatefulWidget {
  const ChangeCalendar({super.key});

  @override
  State<ChangeCalendar> createState() => _ChangeCalendarState();
}

class _ChangeCalendarState extends State<ChangeCalendar> {
  DateTime selectedDate = DateTime.now();
  late String displaySelectedDay;
  final storage = getIt<Storage>();
  late String displaySelectedMonth;

  @override
  void initState() {
    super.initState();
    displaySelectedDay =
        DateTime.parse(storage.lastDay.toString()).day.toString();
    displaySelectedMonth = listOfMonths[selectedDate.month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        centerTitle: displaySelectedMonth,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Assets.icons.cancel.svg(),
        ),
      ),
      backgroundColor: const Color(0xFFF3F0FF),
      body: Column(
        children: [
          const Expanded(child: CustomCalendarChange()),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
