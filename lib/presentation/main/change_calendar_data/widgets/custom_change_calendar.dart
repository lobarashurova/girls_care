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
  int? averagePeriodDays;
  int? averageCycleDays;
  DateTime? periodStartDate;

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
    if (periodStartDate == null ||
        averageCycleDays == null ||
        averagePeriodDays == null) {
      return false;
    }
    final daysDifference = date.difference(periodStartDate!).inDays;
    if (daysDifference < 0) return false;
    final cyclePosition = daysDifference % averageCycleDays!;
    return cyclePosition < averagePeriodDays!;
  }

  bool _isOvulationDay(DateTime date) {
    if (periodStartDate == null || averageCycleDays == null) {
      return false; 
    }
    final daysDifference = date.difference(periodStartDate!).inDays;
    if (daysDifference < 0) return false;
    final cyclePosition = daysDifference % averageCycleDays!;
    return cyclePosition == (averageCycleDays! ~/ 2);
  }

  void _updateCalendar() {
    print("${averagePeriodDays}${averageCycleDays}${periodStartDate}");
    setState(() {
      averagePeriodDays = int.tryParse(periodDaysController.text);
      averageCycleDays = int.tryParse(cycleDaysController.text);
      periodStartDate = DateTime.tryParse(startDateController.text);

      if (averagePeriodDays == null ||
          averageCycleDays == null ||
          periodStartDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Iltimos, barcha ma'lumotlarni to'liq kiriting."),
          ),
        );
      }
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
                        crossAxisCount: 7,
                        crossAxisSpacing: 10.w,
                      ),
                      itemCount: totalGridSpots,
                      itemBuilder: (context, dayIndex) {
                        if (dayIndex < firstDayOfWeek ||
                            (dayIndex - firstDayOfWeek + 1) > daysInMonth) {
                          return const SizedBox.shrink(); 
                        }

                        int actualDay = dayIndex - firstDayOfWeek + 1;
                        DateTime date = DateTime(selectedDate.year,
                            adjustedMonthIndex + 1, actualDay);
                        bool isPeriodDay = _isPeriodDay(date);
                        bool isOvulationDay = _isOvulationDay(date);

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDate = date;
                            });
                          },
                          child: Stack(
                            children: [
                              Center(
                                child: isPeriodDay || isOvulationDay
                                    ? Container(
                                        width: 40.w,
                                        height: 40.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: isPeriodDay
                                              ? const Color(0xFFFFDFFF)
                                              : Colors.white,
                                          border: isOvulationDay
                                              ? Border.all(
                                                  width: 2,
                                                  color:
                                                      const Color(0xFFEB2D69),
                                                )
                                              : null,
                                        ),
                                        child: Center(
                                          child: isOvulationDay
                                              ? const Icon(
                                                  Icons.favorite,
                                                  color: Colors.red,
                                                  size: 20,
                                                )
                                              : Text(
                                                  '$actualDay',
                                                  style: TextStyle(
                                                    fontFamily: GoogleFonts
                                                            .balooTamma2()
                                                        .fontFamily,
                                                    color: Colors.black,
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w600,
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
