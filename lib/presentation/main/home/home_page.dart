import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/di/injection.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/data/storage/storage.dart';
import 'package:girls_care/presentation/main/change_calendar_data/change_calendar.dart';
import 'package:girls_care/presentation/main/home/widgets/articles_section.dart';
import 'package:girls_care/presentation/main/home/widgets/change_calendar_b.dart';
import 'package:girls_care/presentation/main/home/widgets/custom_appbar.dart';
import 'package:girls_care/presentation/main/home/widgets/custom_calendar.dart';
import 'package:girls_care/presentation/main/home/widgets/custom_container_img.dart';
import 'package:girls_care/presentation/main/home/widgets/helper_section.dart';
import 'package:provider/provider.dart';

import 'main/main_app_db_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final storage = getIt<Storage>();

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
            const CustomCalendar(),
            _buildButton(
                context,
                storage.avarageSikl.call() == null
                    ? "Hayz ma’lumotlaringizni kiriting"
                    : "Kalendarga o’zgarish kiritish",
                const ChangeCalendar()),
            if(storage.avarageSikl.call()!=null)
              Column(
                children: [
                  
                ],
              ),
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
