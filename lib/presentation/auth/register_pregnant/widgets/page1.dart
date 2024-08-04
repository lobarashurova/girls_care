import 'package:flutter/material.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/common/widget/common_text_filed.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Ilova navbatdagi hayz davrini hisoblashi uchun"
            .s(12)
            .w(400)
            .c(context.colors.display),
        SizedBox(
          height: 8,
        ),
        CommonTextField(
          hint: "Oxirgi hayzning boshlanish sanasini kiriting",
          suffix: Assets.icons.calendar.svg(width: 20, height: 20),
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
