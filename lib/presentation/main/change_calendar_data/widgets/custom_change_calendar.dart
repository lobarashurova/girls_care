import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/widget/common_button.dart';
import 'package:girls_care/presentation/main/change_calendar_data/widgets/input_info_bottom.dart';
import 'package:girls_care/presentation/main/home/widgets/calendar_details.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCalendarChange extends StatefulWidget {
  const CustomCalendarChange({super.key});

  @override
  State<CustomCalendarChange> createState() => _CustomCalendarChangeState();
}

class _CustomCalendarChangeState extends State<CustomCalendarChange> {
  DateTime selectedDate = DateTime.now();
  int averagePeriodDays = 5;
  int averageCycleDays = 28;
  DateTime periodStartDate = DateTime.now();

  final TextEditingController periodDaysController = TextEditingController();
  final TextEditingController cycleDaysController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();

  int _daysInMonth(String month, int year) {
    if (month == "Fevral" &&
        ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0))) {
      return 29;
    }
    return monthDaysUzbek[month] ?? 30;
  }

  int _firstDayOfWeek(int month, int year) {
    return DateTime(year, month, 1).weekday - 0;
  }

  bool _isPeriodDay(DateTime date) {
    final daysDifference = date.difference(periodStartDate).inDays;
    if (daysDifference < 0) return false;
    final cyclePosition = daysDifference % averageCycleDays;
    return cyclePosition < averagePeriodDays;
  }

  void _updateCalendar() {
    setState(() {
      averagePeriodDays = int.tryParse(periodDaysController.text) ?? 5;
      averageCycleDays = int.tryParse(cycleDaysController.text) ?? 28;
      periodStartDate =
          DateTime.tryParse(startDateController.text) ?? DateTime.now();
    });
  }

  @override
  void dispose() {
    periodDaysController.dispose();
    cycleDaysController.dispose();
    startDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int currentMonthIndex = selectedDate.month - 1;

    return Stack(
      children: [
        SizedBox(
          child: ListView.builder(
            itemCount: listOfMonths.length,
            itemBuilder: (context, index) {
              int adjustedMonthIndex = (currentMonthIndex + index) % 12;
              String month = listOfMonths[adjustedMonthIndex];
              int daysInMonth = _daysInMonth(month, selectedDate.year);
              int firstDayOfWeek =
                  _firstDayOfWeek(adjustedMonthIndex + 1, selectedDate.year);

              int totalGridSpots = daysInMonth + firstDayOfWeek;
              int rowsNeeded = (totalGridSpots / 7).ceil();
              totalGridSpots = rowsNeeded * 7;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (adjustedMonthIndex != currentMonthIndex)
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Text(
                            month,
                            style: TextStyle(
                              fontFamily: GoogleFonts.balooTamma2().fontFamily,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7, // 7 days in a week
                        crossAxisSpacing: 10.w,
                      ),
                      itemCount: totalGridSpots,
                      itemBuilder: (context, dayIndex) {
                        if (dayIndex < firstDayOfWeek ||
                            (dayIndex - firstDayOfWeek + 1) > daysInMonth) {
                          return const SizedBox.shrink(); // Empty spot
                        }

                        int actualDay = dayIndex - firstDayOfWeek + 1;
                        DateTime date = DateTime(selectedDate.year,
                            adjustedMonthIndex + 1, actualDay);
                        bool isPeriodDay = _isPeriodDay(date);

                        // bool isFirstPeriodDay = isPeriodDay &&
                        //     actualDay ==
                        //         3; // Customize this to track first period day
                        // bool isLastPeriodDay = isPeriodDay &&
                        //     actualDay ==
                        //         7; // Customize this to track last period day

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDate = date;
                            });
                          },
                          child: Stack(
                            children: [
                              Center(
                                child: isPeriodDay
                                    ? Container(
                                        width: 40.w,
                                        height: 40.h,
                                        decoration: BoxDecoration(
                                          shape: isPeriodDay
                                              ? BoxShape.circle
                                              : BoxShape.rectangle,
                                          border: isPeriodDay
                                              ? Border.all(
                                                  width: 1,
                                                  color:
                                                      const Color(0xFFEB2D69),
                                                )
                                              : null,
                                        ),
                                        child: Center(
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                color: Color(0xFFFFDFFF),
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(50))),
                                            child: Text(
                                              '$actualDay',
                                              style: TextStyle(
                                                fontFamily:
                                                    GoogleFonts.balooTamma2()
                                                        .fontFamily,
                                                color: Colors.black,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Text(
                                        '$actualDay',
                                        style: TextStyle(
                                          fontFamily: GoogleFonts.balooTamma2()
                                              .fontFamily,
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        InputInfoBottom(
          periodDaysController: periodDaysController,
          cycleDaysController: cycleDaysController,
          startDateController: startDateController,
        ),
        Positioned(
          bottom: 24.h,
          left: 24.w,
          right: 24.w,
          child: CommonButton.elevated(
            radius: 12.r,
            text: "Saqlash",
            backgroundColor: const Color(0xFFEB2D69),
            onPressed: _updateCalendar,
          ),
        ),
      ],
    );
  }
}
