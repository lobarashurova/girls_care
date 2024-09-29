import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/widget/base_app_bar.dart';

class ChildSizeWidget extends StatefulWidget {
  const ChildSizeWidget({super.key});

  @override
  State<ChildSizeWidget> createState() => _ChildSizeWidgetState();
}

class _ChildSizeWidgetState extends State<ChildSizeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      width: double.infinity,
      height: 101,
      decoration: BoxDecoration(
          color: const Color(0xFFE2DCFE),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(width: 8, color: Color(0xFFE8E3FF))),
              child: Image.asset("assets/icons/apple_img.png"),
            ),
            SizedBox(width: 12.w),
            Column(
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Farzandingiz o’lchami ',
                    style: TextStyle(fontSize: 14.sp),
                    children: [
                      TextSpan(
                        text: 'olma',
                        style: TextStyle(
                          color: Color(0xFFEB2D69),
                          fontSize: 14.sp,
                        ),
                      ),
                      TextSpan(
                        text: '\nbarobar 🤩',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6.h),
                "Taxminan: 18.6 sm & 146 gr".s(14.sp),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
