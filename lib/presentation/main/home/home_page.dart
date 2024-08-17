import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/presentation/main/home/widgets/change_calendar_b.dart';
import 'package:girls_care/presentation/main/home/widgets/custom_appbar.dart';
import 'package:girls_care/presentation/main/home/widgets/custom_calendar.dart';
import 'package:girls_care/presentation/main/home/widgets/custom_container_img.dart';
import 'package:girls_care/presentation/main/home/widgets/maqolalar_section.dart';
import 'package:girls_care/presentation/main/home/widgets/yordamchi_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F0FF),
      appBar: CustomAppbar(
        centerTitle: "Bugun",
        actions: [
          Assets.icons.notification.svg(width: 20, height: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomCalendar(),
              SizedBox(height: 20.h),
              const ChangeCalendarB(text: "Kalendarga o'zgartirish kiritish"),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: CustomContainerImg(
                    title: "Hayz davri",
                    subtitle: "Ma'lumot mavjud emas",
                    color: const Color(0xFFE2DCFE),
                    image: Assets.icons.hayzIcon.svg(width: 95.w, height: 95.h),
                  )),
                  const SizedBox(width: 20),
                  Expanded(
                      child: CustomContainerImg(
                    title: "Ovulyatsiya",
                    subtitle: "Ma'lumot mavjud emas",
                    color: const Color(0xFFFEE7FE),
                    image: Assets.icons.ovulyatsiyaIcon
                        .svg(width: 95.w, height: 95.h),
                  )),
                ],
              ),
              SizedBox(height: 20.h),
              const YordamchiSection(),
              SizedBox(height: 20.h),
              const MaqolalarSection(),
              SizedBox(height: 200.h),
            ],
          ),
        ),
      ),
    );
  }
}
