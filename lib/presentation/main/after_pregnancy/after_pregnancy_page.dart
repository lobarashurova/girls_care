import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/presentation/main/change_calendar_data/change_calendar.dart';
import 'package:girls_care/presentation/main/home/main/main_app_db_service.dart';
import 'package:girls_care/presentation/main/home/widgets/articles_section.dart';
import 'package:girls_care/presentation/main/home/widgets/change_calendar_b.dart';
import 'package:girls_care/presentation/main/home/widgets/custom_appbar.dart';
import 'package:girls_care/presentation/main/home/widgets/custom_calendar.dart';
import 'package:girls_care/presentation/main/home/widgets/custom_container_img.dart';
import 'package:girls_care/presentation/main/home/widgets/helper_section.dart';
import 'package:provider/provider.dart';

class AfterPregnancyPage extends StatefulWidget {
  const AfterPregnancyPage({super.key});

  @override
  State<AfterPregnancyPage> createState() => _AfterPregnancyPageState();
}

class _AfterPregnancyPageState extends State<AfterPregnancyPage> {
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F0FF),
      appBar: CustomAppbar(
        centerTitle: "Bugun",
        actions: [Assets.icons.notification.svg(width: 20.w, height: 20.h)],
      ),
      body: SingleChildScrollView(
        controller: context.read<PeriodAppService>().scrollController,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 293.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(color: Colors.purpleAccent, width: 2.0),
              ),
              child: ToggleButtons(
                borderColor: Colors.transparent,
                selectedBorderColor: Colors.transparent,
                borderRadius: BorderRadius.circular(30.0),
                fillColor: Colors.purple[100],
                selectedColor: Colors.black,
                color: Colors.black,
                isSelected: isSelected,
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < isSelected.length; i++) {
                      isSelected[i] = i == index;
                    }
                  });
                },
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: "Ona".s(16).w(700),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: "Bola".s(16).w(700)),
                ],
              ),
            ),
            const CustomCalendar(),
            _buildButton(context, "Hayz ma’lumotlaringizni kiriting",
                const ChangeCalendar()),
            _buildInfoRow(),
            const HelperSection(),
            SizedBox(height: 20.h),
            const ArticlesSection(),
            SizedBox(height: 140.h),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Widget page) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: ChangeCalendarB(
        text: text,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        ),
      ),
    );
  }

  Widget _buildInfoRow() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildInfoCard("Hayz davri", "Ma'lumot mavjud emas",
              const Color(0xFFE2DCFE), Assets.icons.hayzIcon),
          SizedBox(width: 20.w),
          _buildInfoCard("Ovulyatsiya", "Ma'lumot mavjud emas",
              const Color(0xFFFEE7FE), Assets.icons.ovulyatsiyaIcon),
        ],
      ),
    );
  }

  Widget _buildInfoCard(
      String title, String subtitle, Color color, SvgGenImage image) {
    return Expanded(
      child: CustomContainerImg(
        title: title,
        subtitle: subtitle,
        color: color,
        image: image.svg(width: 95.w, height: 95.h),
      ),
    );
  }
}
