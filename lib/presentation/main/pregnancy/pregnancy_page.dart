import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/presentation/main/articles/widgets/daily_themes.dart';
import 'package:girls_care/presentation/main/home/widgets/custom_appbar.dart';
import 'package:girls_care/presentation/main/home/widgets/helper_section.dart';
import 'package:girls_care/presentation/main/main_app.dart';
import 'package:girls_care/presentation/main/main_app_db_service.dart';
import 'package:girls_care/presentation/main/pregnancy/calendar_pregnancy.dart';
import 'package:girls_care/presentation/main/pregnancy/widgets/child_size_widget.dart';
import 'package:girls_care/presentation/main/pregnancy/widgets/pregnancy_article_details.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

class PregnancyPage extends StatefulWidget {
  const PregnancyPage({super.key});

  @override
  State<PregnancyPage> createState() => _PregnancyPageState();
}

class _PregnancyPageState extends State<PregnancyPage> {
  DateTime currentDate = DateTime.now();

  @override
  void initState() {
    super.initState();

    initializeDateFormatting('uz', null).then((_) {
      setState(() {});
    });
  }

  void updateMonth(int increment) {
    setState(() {
      currentDate = DateTime(currentDate.year, currentDate.month + increment);
    });
  }

  @override
  Widget build(BuildContext context) {
    String monthYear = DateFormat('MMMM yyyy', 'uz').format(currentDate);
    String finalText = monthYear[0].toUpperCase() + monthYear.substring(1);

    return Scaffold(
      backgroundColor: context.colors.backgrounColor,
      appBar: CustomAppbar(
        centerTitle: "Bugun",
        actions: [Assets.icons.notification.svg(width: 24.w, height: 24.h)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              GestureDetector(
                  onTap: () {
                    updateMonth(-1);
                  },
                  child:
                      Assets.icons.leftVector.svg(width: 12.w, height: 12.h)),
              finalText.s(20).w(600).c(context.colors.black),
              GestureDetector(
                  onTap: () {
                    updateMonth(1);
                  },
                  child:
                      Assets.icons.rightVector.svg(width: 18.w, height: 18.h)),
            ]),
            SizedBox(height: 24.h),
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 100,
                    backgroundColor: Color(0xFFE8E3FF),
                  ),
                  const Positioned(
                    top: 15,
                    right: 2,
                    left: 2,
                    child: CircleAvatar(
                      radius: 85,
                      backgroundColor: Color(0xFFDBD3FF),
                    ),
                  ),
                  Positioned(
                    top: 25,
                    right: 2,
                    left: 2,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 7, color: const Color(0Xff8D80C1))),
                      child: Center(
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              "assets/icons/eight_week.jpg",
                              fit: BoxFit.cover,
                              width: 100.0,
                              height: 100.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "16 hafta, 2 kun".s(18.sp).w(700),
                  SizedBox(width: 10.w),
                  InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CalendarPregnancy())),
                      child: SvgPicture.asset("assets/icons/edit_icon.svg")),
                ],
              ),
            ),
            SizedBox(height: 4.h),
            Center(child: "Tug’ruqqacha 176 kun".s(12.sp).w(500)),
            SizedBox(height: 12.h),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                width: double.infinity,
                height: 16.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: const Color(0xFFFFDFFF),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 220.w,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE8E3FF),
                      ),
                    ),
                    Positioned(
                      top: -2,
                      right: 110,
                      child: Container(
                        width: 3.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                            color: const Color(0xFFEB497C),
                            borderRadius: BorderRadius.circular(4.r)),
                      ),
                    ),
                    Container(
                      width: 120.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: const Color(0xFF8D80C1),
                      ),
                    ),
                    Positioned(
                      top: -2,
                      left: 110,
                      child: Container(
                        width: 3.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                            color: const Color(0xFFEB497C),
                            borderRadius: BorderRadius.circular(4.r)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.h),
            const HelperSection(),
            SizedBox(height: 12.h),
            "Haftaga aloqador".s(20.sp).w(700).c(Colors.black),
            SizedBox(height: 12.h),
            Stack(
              clipBehavior: Clip.none,
              children: [
                const DailyThemes(),
                Positioned(
                  top: -20,
                  right: 0,
                  child: CircleAvatar(
                    radius: 27,
                    backgroundColor: const Color(0xFFE2DCFE),
                    child: Center(
                        child: "Barchasi"
                            .s(10.sp)
                            .w(600)
                            .c(const Color(0xFFEB2D69))),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            const ChildSizeWidget(),

            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "Maqolalar".s(20.sp).w(700).c(Colors.black),
                IconButton(
                  onPressed: () {
                    context.read<MainAppDbService>().onTabTapped(1);
                  },
                  icon: Assets.icons.rightVector.svg(width: 18.w, height: 18.h),
                ),

              ],
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: double.infinity,
              height: 500.h,
              child: GridView.builder(
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 20.h,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.w,
                ),
                itemBuilder: (context, index) {
                  String photo = pregnancyArticlePhotos[index];
                  return Container(
                    width: 179.w,
                    height: 179.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: Image.asset(
                            photo,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Opacity(
                            opacity: 0.8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Color(0xFF8D80C1),
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(12)),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  pregnancyArticleDetails[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily:
                                        GoogleFonts.balooTamma2().fontFamily,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // SizedBox(height: 120.h),
          ],
        ),
      ),
    );
  }
}
