import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeekDayInput extends StatelessWidget {
  const WeekDayInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Container(
        width: 69.w,
        height: 28.h,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: const Color(0xFF8D80C1)),
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '16',
            hintStyle: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
          ),
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(width: 10),
      Text('hafta', style: TextStyle(fontSize: 16.sp)),
      const SizedBox(width: 20),
      Container(
        width: 69.w,
        height: 28.h,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF8D80C1)),
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '2', // Placeholder number
            hintStyle: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
          ),
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(width: 10),
      Text('kun', style: TextStyle(fontSize: 16.sp)),
    ]);
  }
}
