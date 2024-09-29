import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/presentation/main/home/widgets/calendar_details.dart';
import 'package:google_fonts/google_fonts.dart';

DateTime selectedDate = DateTime.now();
int currentDateSelectedIndex = 0;

int? rangeStartIndex;
int? rangeEndIndex;

class CustomCalendar extends StatefulWidget {
  final bool isPregnancy;
  const CustomCalendar({super.key, this.isPregnancy = false});

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  void _goToPreviousMonth() {
    setState(() {
      if (selectedDate.month > 1) {
        selectedDate = DateTime(selectedDate.year, selectedDate.month - 1);
      } else {
        selectedDate = DateTime(selectedDate.year - 1, 12);
      }
      _resetSelection();
    });
  }

  void _goToNextMonth() {
    setState(() {
      if (selectedDate.month < 12) {
        selectedDate = DateTime(selectedDate.year, selectedDate.month + 1);
      } else {
        selectedDate = DateTime(selectedDate.year + 1, 1);
      }
      _resetSelection();
    });
  }

  void _resetSelection() {
    currentDateSelectedIndex = 0;
    rangeStartIndex = null;
    rangeEndIndex = null;
  }

  int _daysInMonth(String month, int year) {
    if (month == "Fevral" &&
        ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0))) {
      return 29;
    }
    return monthDaysUzbek[month] ?? 30; //
  }

  @override
  Widget build(BuildContext context) {
    String displaySelectedYearMonth =
        "${listOfMonths[selectedDate.month - 1]} ${selectedDate.year}";

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Assets.icons.leftVector.svg(width: 14.w, height: 14.h),
              onPressed: _goToPreviousMonth,
            ),
            displaySelectedYearMonth.s(20.sp).w(600).c(Colors.black),
            IconButton(
              icon: Assets.icons.rightVector.svg(width: 24.w, height: 24.h),
              onPressed: _goToNextMonth,
            ),
          ],
        ),
        if (!widget.isPregnancy) SizedBox(height: 20.h),
        Stack(
          children: [
            Container(
              margin: EdgeInsets.all(12),
              width: double.infinity,
              // height: 300.w,
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                color: widget.isPregnancy == true
                    ? Colors.transparent
                    : Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (!widget.isPregnancy) SizedBox(height: 60.h),
                  _buildDaySelector(),
                ],
              ),
            ),
            if (!widget.isPregnancy)
              Positioned(
              top: -16,
              left: 0,
              right: 0,
              child: Assets.icons.calendarDays
                  .image(width: double.infinity, height: 69.h),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildDaySelector() {
    int daysInMonth =
        _daysInMonth(listOfMonths[selectedDate.month - 1], selectedDate.year);

    var today = DateTime.now();
    int todayDay = today.day;
    bool isCurrentMonth =
        selectedDate.month == today.month && selectedDate.year == today.year;

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 6.w,
        crossAxisSpacing: 10.w,
      ),
      itemCount: daysInMonth,
      itemBuilder: (context, index) {
        bool isToday = isCurrentMonth && (index + 1) == todayDay;

        return GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: isToday
                  ? CircleAvatar(
                      radius: 20.w,
                      backgroundColor: const Color(0xFF8D80C1),
                      child: "${index + 1}".s(16.sp).w(600).c(Colors.white),
                    )
                  : "${index + 1}".s(16.sp).w(600).c(Colors.black),
            ),
          ),
        );
      },
    );
  }
}
