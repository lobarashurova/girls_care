import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCalendarChange extends StatefulWidget {
  const CustomCalendarChange({super.key});

  @override
  State<CustomCalendarChange> createState() => _CustomCalendarChangeState();
}

class _CustomCalendarChangeState extends State<CustomCalendarChange> {
  DateTime selectedDate = DateTime.now();
  int currentDateSelectedIndex = 0;

  int? rangeStartIndex;
  int? rangeEndIndex;

  final Map<String, int> monthDaysUzbek = {
    "Yanvar": 31,
    "Fevral": 28,
    "Mart": 31,
    "Aprel": 30,
    "May": 31,
    "Iyun": 30,
    "Iyul": 31,
    "Avgust": 31,
    "Sentyabr": 30,
    "Oktyabr": 31,
    "Noyabr": 30,
    "Dekabr": 31
  };

  List<String> listOfMonths = [
    "Yanvar",
    "Fevral",
    "Mart",
    "Aprel",
    "May",
    "Iyun",
    "Iyul",
    "Avgust",
    "Sentyabr",
    "Oktyabr",
    "Noyabr",
    "Dekabr"
  ];

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Oxirgi hayzning 1-kunini kiriting",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            fontFamily: GoogleFonts.balooTamma2().fontFamily,
          ),
        ),
        SizedBox(height: 20.h),
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 300.w,
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                color: Colors.white,
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
                  SizedBox(height: 15.h),
                  _buildDaySelector(),
                ],
              ),
            ),
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
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          fontFamily: GoogleFonts.balooTamma2().fontFamily,
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  : Text(
                      '${index + 1}',
                      style: TextStyle(
                        fontFamily: GoogleFonts.balooTamma2().fontFamily,
                        letterSpacing: 0.5,
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
