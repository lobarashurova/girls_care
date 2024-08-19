import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:girls_care/presentation/main/home/widgets/custom_appbar.dart';
import 'package:girls_care/presentation/main/maqolalar/widgets/hayz_davri_haqida.dart';
import 'package:girls_care/presentation/main/maqolalar/widgets/daily_themes.dart';
import 'package:girls_care/presentation/main/maqolalar/widgets/search_textfield.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(centerTitle: "Maqolalar"),
      backgroundColor: const Color(0xffF3F0FF),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchField(),
            SizedBox(height: 22.h),
            "Kun mavzusi".s(18.sp).w(700),
            SizedBox(height: 30.h),
            const DailyThemes(),
            SizedBox(height: 22.h),
            const Expanded(child: HayzDavriHaqida()),
            Positioned(
              top: 130,
              left: 320,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: const Color(0xFFE2DCFE),
                child: Center(
                    child: "Barchasi"
                        .s(10.sp)
                        .w(600)
                        .c(Color(0xFF0FFEB2D69))), // Using your extension
              ),
            ),
          ],
        ),
      ),
    );
  }
}
