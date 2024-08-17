import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/presentation/main/change_calendar_data/widgets/custom_change_calendar.dart';
import 'package:girls_care/presentation/main/home/widgets/change_calendar_b.dart';
import 'package:girls_care/presentation/main/home/widgets/custom_appbar.dart';
import 'package:girls_care/presentation/main/home/widgets/custom_calendar.dart';

class ChangeCalendar extends StatefulWidget {
  const ChangeCalendar({super.key});

  @override
  State<ChangeCalendar> createState() => _ChangeCalendarState();
}

class _ChangeCalendarState extends State<ChangeCalendar> {
  String displaySelectedDay = selectedDate.day.toString();
  String displaySelectedMonth = listOfMonths[selectedDate.month - 1];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          centerTitle:
              "$displaySelectedDay-${displaySelectedMonth.toUpperCase()}",
          leading: SizedBox(
              width: 24.w,
              height: 24.h,
              child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Assets.icons.leftVector.svg()))),
      backgroundColor: const Color(0xFFF3F0FF),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const CustomCalendarChange(),
            SizedBox(height: 20.h),
             ChangeCalendarB(text: "Hayz sanasini kiritish", onPressed: (){},),
          ],
        ),
      ),
    );
  }
}
