import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/presentation/main/home/widgets/helper_section_details.dart';

class HelperSection extends StatefulWidget {
  const HelperSection({super.key});

  @override
  State<HelperSection> createState() => _HelperSectionState();
}

class _HelperSectionState extends State<HelperSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "Yordamchi".s(24.sp).w(700).c(Colors.black),
            IconButton(
              onPressed: () {},
              icon: Assets.icons.rightVector.svg(width: 24.w, height: 24.h),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        SizedBox(
          width: double.infinity,
          height: 104.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: helperSectionCircle.length,
            itemBuilder: (context, index) {
              String key = helperSectionCircle.keys.elementAt(index);
              Image icon = helperSectionCircle.values.elementAt(index);

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: SizedBox(width: 78.w, height: 78.h, child: icon),
                    ),
                    key.s(14.sp).w(500).c(Colors.black)
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
