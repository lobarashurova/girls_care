import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/common/widget/common_button.dart';

class ChangeAccountInformation extends StatelessWidget {
  ChangeAccountInformation({super.key, required this.name});

  String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Assets.icons.avatarAccount.image(width: 100.w, height: 100.h),
        SizedBox(height: 12.h),
        "${name}".s(16).w(600).c(Colors.black),
        SizedBox(height: 12.h),
        SizedBox(
            width: 203.w,
            height: 48,
            child:
                const CommonButton.elevated(text: "Ma’lumotlarni sinxronlash")),
        SizedBox(height: 12.h),
        "Oxirgi sinxronlash: Bugun 17:01"
            .s(16)
            .w(600)
            .c(const Color(0xFFEB2D69)),
        SizedBox(height: 12.h),
        Container(
            width: double.infinity,
            height: 0.3,
            color: const Color(0xFF8D80C1)),
        SizedBox(height: 24.h),
      ],
    );
  }
}
