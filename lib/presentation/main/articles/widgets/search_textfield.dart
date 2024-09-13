import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/main.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Qidiruv',
        hintStyle: TextStyle(
          color: const Color(0xFF1B1F24),
          fontFamily: GoogleFonts.balooTamma2().fontFamily,
        ),
        prefixIcon: Transform.scale(
          scale: 0.8,
          child: SizedBox(
            width: 20.w,
            height: 20.h,
            child: Assets.icons.searchIcon.svg(width: 20.w, height: 20.h),
          ),
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: 50.w,
          minHeight: 24.h,
        ),
        fillColor: Colors.transparent,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Color(0xFF8D80C1),
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Color(0xFFB39DDB),
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Color(0xFFB39DDB),
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
