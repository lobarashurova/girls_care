import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:girls_care/presentation/main/maqolalar/widgets/daily_themes_detail.dart';
import 'package:girls_care/common/extensions/text_extensions.dart'; // Import your extensions

class DailyThemes extends StatefulWidget {
  const DailyThemes({super.key});

  @override
  State<DailyThemes> createState() => _DailyThemesState();
}

class _DailyThemesState extends State<DailyThemes> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Swiper(
            axisDirection: AxisDirection.right,
            allowImplicitScrolling: true,
            layout: SwiperLayout.STACK,
            itemWidth: 320.w,
            itemHeight: 200.h,
            containerHeight: double.infinity,
            itemBuilder: (BuildContext context, int index) {
              final article = kunMavzusiArticles[index];
              final image = Image.asset(
                article["image"]!,
                width: 305.w,
                height: 200.h,
                fit: BoxFit.cover,
              );
              final title = article["title"]!;
              final subtitle = article["subtitle"]!;

              return Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: SizedBox(
                      width: double.infinity,
                      height: 200.h,
                      child: image,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.infinity,
                      height: 60.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(16.r),
                        ),
                        color: const Color(0xFF8D80C1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          title.s(16.sp).w(700).c(Colors.white),
                          subtitle.s(12.sp).c(Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            itemCount: kunMavzusiArticles.length,
          ),
        ),
      ],
    );
  }
}
