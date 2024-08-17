import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/presentation/main/change_calendar_data/change_calendar.dart';

class ChangeCalendarB extends StatefulWidget {
  final String text;
  const ChangeCalendarB({super.key, required this.text});

  @override
  State<ChangeCalendarB> createState() => _ChangeCalendarBState();
}

class _ChangeCalendarBState extends State<ChangeCalendarB> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: const Color(0xFFFFDFFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.all(10.w),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ChangeCalendar()));
        },
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            color: const Color(0xFFEB2D69),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
