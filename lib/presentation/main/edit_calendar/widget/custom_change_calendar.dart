import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/di/injection.dart';
import 'package:girls_care/common/extensions/navigation_extensions.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/common/widget/common_button.dart';
import 'package:girls_care/common/widget/common_text_filed.dart';
import 'package:girls_care/data/storage/storage.dart';
import 'package:girls_care/presentation/main/change_calendar_data/widgets/input_info_text.dart';
import 'package:girls_care/presentation/main/home/widgets/calendar_details.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pinput/pinput.dart';

class CustomCalendarEdit extends StatefulWidget {
  const CustomCalendarEdit({super.key});

  @override
  State<CustomCalendarEdit> createState() => _CustomCalendarEditState();
}

class _CustomCalendarEditState extends State<CustomCalendarEdit> {
  DateTime selectedDate = DateTime.now();
  int? averagePeriodDays;
  int? averageCycleDays;
  DateTime? periodStartDate;

  final storage = getIt<Storage>();
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
    setState(() {
      print("${startDateController.text}");
      averagePeriodDays = int.tryParse(periodDaysController.text);
      averageCycleDays = int.tryParse(cycleDaysController.text);
      print("${averagePeriodDays}${averageCycleDays}${periodStartDate}");

      if (averagePeriodDays == null ||
          averageCycleDays == null ||
          periodStartDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Iltimos, barcha ma'lumotlarni to'liq kiriting."),
          ),
        );
      } else {
        storage.avarageHayz.set(averagePeriodDays);
        storage.avarageSikl.set(averageCycleDays);
        storage.lastDay.set(periodStartDate.toString());
        context.pop();
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
                                              ? Text('$actualDay',
                                                  style: TextStyle(
                                                    fontFamily: GoogleFonts
                                                            .balooTamma2()
                                                        .fontFamily,
                                                    color:
                                                        context.colors.primary,
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ))
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
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              border: const Border(
                  top: BorderSide(width: 1, color: Color(0xFF8D80C1))),
              color: const Color(0xFFF3F0FF),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.w),
                topRight: Radius.circular(24.w),
              ),
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: "Ma’lumotlarni kiriting:"
                          .s(22.sp)
                          .w(700)
                          .c(context.colors.black)),
                  SizedBox(height: 24.h),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InputInfoTextfield(
                          controller: periodDaysController,
                          hintText: "O'rtacha hayz kunlari",
                          width: 154.w,
                        ),
                        SizedBox(width: 10.w),
                        InputInfoTextfield(
                            controller: cycleDaysController,
                            hintText: "O'rtacha tsikl kunlari",
                            width: 154.w)
                      ]),
                  SizedBox(height: 4.h),
                  "Hayz davomiyligi va hayzlar orasidagi taxminiy davrni kiriting"
                      .s(12.sp)
                      .w(500)
                      .c(Colors.black),
                  SizedBox(height: 24.h),
                  CommonTextField(
                    controller: startDateController,
                    hint: "Oxirgi hayzning boshlanish sanasini kiriting",
                    suffix: Assets.icons.calendar.svg(width: 20, height: 20),
                    suffixPressed: () async {
                      periodStartDate = await showDatePicker(
                        context: context,
                        initialDate: periodStartDate ?? DateTime.now(),
                        // Default to current date if none selected
                        firstDate: DateTime(2000),
                        // Start of range
                        lastDate: DateTime(2101),
                      );
                      setState(() {});
                      startDateController.setText(DateFormat('dd-MM-yyyy')
                          .format(periodStartDate ?? DateTime.now()));
                    },
                  ),
                  SizedBox(height: 4.h),
                  "Ilova navbatdagi hayz davrini hisoblashi uchun"
                      .s(12.sp)
                      .w(500)
                      .c(Colors.black),
                  SizedBox(height: 24.h),
                  CommonButton.elevated(
                    radius: 12.r,
                    text: "Saqlash",
                    backgroundColor: const Color(0xFFEB2D69),
                    onPressed: _updateCalendar,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
