import 'package:flutter/material.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/common/widget/common_text_filed.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextField(
          hint: "Homila aniqlangan sana",
          suffix: Assets.icons.calendar.svg(width: 20, height: 20),
        ),
        SizedBox(
          height: 8,
        ),
        "Ilova homila yoshini hisoblashi uchun"
            .s(12)
            .w(400)
            .c(context.colors.display),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                "16 hafta, 2 kun".s(24).w(700),
                "Tug’ruqqacha 176 kun".s(12).w(400).c(context.colors.display)
              ],
            ),
          ],
        )
      ],
    );
  }
}
