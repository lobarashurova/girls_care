import 'package:flutter/material.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/main.dart';
import 'package:girls_care/presentation/main/home/widgets/custom_calendar.dart';

class CustomPregnancyCalendar extends StatefulWidget {
  const CustomPregnancyCalendar({super.key});

  @override
  State<CustomPregnancyCalendar> createState() =>
      _CustomPregnancyCalendarState();
}

class _CustomPregnancyCalendarState extends State<CustomPregnancyCalendar> {
  @override
  Widget build(BuildContext context) {
    return CustomCalendar();
  }
}
