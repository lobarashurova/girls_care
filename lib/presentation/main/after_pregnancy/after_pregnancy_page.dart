import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/extensions/widget.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/common/widget/custom_slider.dart';
import 'package:girls_care/presentation/main/change_calendar_data/change_calendar.dart';
import 'package:girls_care/presentation/main/home/main/main_app_db_service.dart';
import 'package:girls_care/presentation/main/home/widgets/articles_section.dart';
import 'package:girls_care/presentation/main/home/widgets/change_calendar_b.dart';
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
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F0FF),
      body: SingleChildScrollView(
        controller: context
            .read<PeriodAppService>()
            .scrollController,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery
                .of(context)
                .padding
                .top),
            16.kh,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                16.kw,
                CustomSlider(firstTitle: "Ona", secondTitle: "Bola", selectedIndex: (index){
                  setState(() {
                    selectedIndex=index;
                  });
                }),
                Assets.icons.notification.svg()
              ],
            ),
            if (selectedIndex == 0)
              Column(
                children: [
                  const CustomCalendar(),
                  _buildButton(context, "Hayz ma’lumotlaringizni kiriting",
                      const ChangeCalendar()),
                  _buildInfoRow(),
                ],
              ),
            if (selectedIndex == 1)
              Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: CustomContainerImg(
                    title: "Farzandingiz  ",
                    subtitle: "3 oy 15 kunlik",
                    color: const Color(0xFFE2DCFE),
                    image: Assets.icons.hayzIcon.svg()),
              ),
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
        onPressed: () =>
            Navigator.push(
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

  Widget _buildInfoCard(String title, String subtitle, Color color,
      SvgGenImage image) {
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
