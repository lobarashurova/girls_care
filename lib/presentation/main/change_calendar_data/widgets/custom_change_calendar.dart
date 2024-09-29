import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/common/widget/base_app_bar.dart';
import 'package:girls_care/common/widget/common_button.dart';
import 'package:girls_care/main.dart';
import 'package:girls_care/presentation/main/change_calendar_data/widgets/input_info_bottom.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/models/day_values_model.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';
import 'package:intl/intl.dart';

class CustomCalendarChange extends StatefulWidget {
  const CustomCalendarChange({super.key});

  @override
  State<CustomCalendarChange> createState() => _CustomCalendarChangeState();
}

class _CustomCalendarChangeState extends State<CustomCalendarChange> {
  late CleanCalendarController calendarController;
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;
  int? averagePeriodDays;
  int? averageCycleDays;
  DateTime? periodStartDate;
  String? currentMonthName;

  final TextEditingController periodDaysController = TextEditingController();
  final TextEditingController cycleDaysController = TextEditingController();
  final TextEditingController lastDaysController = TextEditingController();

  @override
  void initState() {
    super.initState();
    DateTime today = DateTime.now();
    currentMonthName = DateFormat('MMMM', "uz_UZ").format(today);
    calendarController = CleanCalendarController(
      minDate: DateTime(2024, 09, 1),
      maxDate: DateTime(2034, 12, 31),
      onRangeSelected: (firstDate, lastDate) {
        setState(() {
          selectedStartDate = firstDate;
          selectedEndDate = lastDate;
        });
      },
    );
  }

  void _updateCalendar() {
    setState(() {
      averagePeriodDays = int.tryParse(periodDaysController.text);
      averageCycleDays = int.tryParse(cycleDaysController.text);
      periodStartDate = DateTime.tryParse(lastDaysController.text);

      if (averagePeriodDays == null ||
          averageCycleDays == null ||
          periodStartDate == null) {
        String message = "Iltimos, barcha ma'lumotlarni to'liq kiriting.";
        if (averagePeriodDays == null) {
          message = "O'rtacha hayz kunlarini to'g'ri kiriting.";
        } else if (averageCycleDays == null) {
          message = "O'rtacha tsikl kunlarini to'g'ri kiriting.";
        } else if (periodStartDate == null) {
          message = "Hayz boshlanish sanasini to'g'ri kiriting.";
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            duration: const Duration(seconds: 2),
          ),
        );
        return;
      }
    });
  }

  @override
  void dispose() {
    periodDaysController.dispose();
    cycleDaysController.dispose();
    lastDaysController.dispose();
    super.dispose();
  }

  bool _isWithinSelectedRange(DateTime date) {
    if (selectedStartDate == null || selectedEndDate == null) {
      return false;
    }
    return date.isAfter(selectedStartDate!) &&
            date.isBefore(selectedEndDate!) ||
        date.isAtSameMomentAs(selectedStartDate!) ||
        date.isAtSameMomentAs(selectedEndDate!);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: ScrollableCleanCalendar(
            locale: "UZ_uz",
            calendarController: calendarController,
            layout: Layout.BEAUTY,
            calendarCrossAxisSpacing: 0,
            showWeekdays: false,
            // weekdayTextStyle: TextStyle(
            //   fontSize: 12.sp,
            //   fontFamily: GoogleFonts.balooTamma2().fontFamily,
            //   color: context.colors.black,
            // ),
            dayBuilder: (context, DayValues day) {
              final isSelectedRange = _isWithinSelectedRange(day.day);
              return Container(
                decoration: BoxDecoration(
                  color: isSelectedRange ? Colors.red.withOpacity(0.5) : null,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  DateFormat('d').format(day.day),
                  style: TextStyle(
                    fontFamily: GoogleFonts.balooTamma2().fontFamily,
                    color:
                        isSelectedRange ? Colors.white : context.colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            },
monthBuilder: (context, month) {
              String currentMonth =
                  DateFormat('MMMM', "uz_UZ").format(DateTime.now());
              return month == currentMonth
                  ? const SizedBox.shrink()
                  : Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      child: month.s(18.sp).w(600),
                    );
            },


          ),
        ),
        InputInfoBottom(
          periodDaysController: periodDaysController,
          cycleDaysController: cycleDaysController,
          lastDaysController: lastDaysController,
        ),
        Positioned(
          bottom: 24.h,
          left: 24.w,
          right: 24.w,
          child: CommonButton.elevated(
            radius: 12.r,
            text: "Saqlash",
            backgroundColor: const Color(0xFFEB2D69),
            onPressed: () {
              _updateCalendar();
              print(currentMonthName);
            },
          ),
        ),
      ],
    );
  }
}
