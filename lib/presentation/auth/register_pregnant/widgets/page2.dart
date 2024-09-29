import 'package:flutter/material.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/common/widget/common_text_filed.dart';
import 'package:intl/intl.dart';
import 'package:pinput/pinput.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key, required this.selectedDay});

  final ValueChanged<DateTime?> selectedDay;

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  TextEditingController controller = TextEditingController();
  DateTime? selectedDay;
  String? yearHomila;
  String? yearTugruq;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextField(
          controller: controller,
          hint: "Homila aniqlangan sana",
          suffix: Assets.icons.calendar.svg(width: 20, height: 20),
          suffixPressed: () async {
            selectedDay = await showDatePicker(
              context: context,
              initialDate: selectedDay ?? DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );
            widget.selectedDay(selectedDay);
            Duration duration =
                DateTime.now().difference(selectedDay ?? DateTime.now());
            yearHomila =
                "${duration.inDays ~/ 7} hafta, ${duration.inDays % 7} kun";
            Duration duration2 =
                ((selectedDay ?? DateTime.now()).add(Duration(days: 270)))
                    .difference(DateTime.now());
            yearTugruq = "Tug'ruqqacha ${duration2.inDays}";
            controller.setText(
                DateFormat('dd-MM-yyyy').format(selectedDay ?? DateTime.now()));
          },
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
                (yearHomila ?? "Kunni tanlang").s(24).w(700),
                "Tug’ruqqacha ${yearTugruq ?? 0} kun"
                    .s(12)
                    .w(400)
                    .c(context.colors.display)
              ],
            ),
          ],
        )
      ],
    );
  }
}
