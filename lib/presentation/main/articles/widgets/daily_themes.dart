import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:girls_care/presentation/main/articles/read_articles.dart';
import 'package:google_fonts/google_fonts.dart';

import 'daily_themes_detail.dart';

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
              final id = article["id"]!;
              final text = article["text"]!;

              return Stack(
                clipBehavior: Clip.none,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReadArticles(
                                  imagePath: article["image"]!,
                                  title: title,
                                  id: id,
                                  text: text,
                                ))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: SizedBox(
                        width: double.infinity,
                        height: 200.h,
                        child: image,
                      ),
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
                          Text(
                            title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: GoogleFonts.balooTamma2().fontFamily,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            subtitle,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: GoogleFonts.balooTamma2().fontFamily,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
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
