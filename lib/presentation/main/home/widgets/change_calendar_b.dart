import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';

class ChangeCalendarB extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  const ChangeCalendarB(
      {super.key, required this.text, required this.onPressed});

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
        onPressed: widget.onPressed,
        child: widget.text.s(14.sp).w(700).c(const Color(0xFFEB2D69)),
      ),
    );
  }
}
