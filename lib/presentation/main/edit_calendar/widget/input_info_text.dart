import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:google_fonts/google_fonts.dart';

class InputInfoTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final double width;
  final bool hasSuffix;

  const InputInfoTextfield({
    super.key,
    required this.hintText,
    required this.width,
    this.hasSuffix = false,
    this.controller,

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        onChanged: (text){

        },
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          // ignore: prefer_const_constructors
          contentPadding: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 10.0,
          ),
          suffixIconConstraints:
              const BoxConstraints(maxWidth: 30, minHeight: 20),
          suffixIcon: hasSuffix
              ? Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: Assets.icons.calendar.svg(width: 20.w, height: 20.h),
                )
              : null,
          hintText: hintText,
          hintStyle: TextStyle(
              color: const Color(0x99000000),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.balooTamma2().fontFamily),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(color: Color(0xFF8D80C1)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(color: Color(0xFF8D80C1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(color: Color(0xFF8D80C1)),
          ),
        ),
      ),
    );
  }
}
