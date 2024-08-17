import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:google_fonts/google_fonts.dart';

class KunMavzusiWidget extends StatefulWidget {
  const KunMavzusiWidget({super.key});

  @override
  State<KunMavzusiWidget> createState() => _KunMavzusiWidgetState();
}

class _KunMavzusiWidgetState extends State<KunMavzusiWidget> {
  final List<Map<String, String>> kunMavzusiArticles = [
    {
      "image": Assets.icons.kunMavzusi1.path,
      "title": "Volutpat pharetra sed",
      "subtitle": "Est elementum augue justo eget. Est augue eget."
    },
    {
      "image": Assets.icons.kunMavzusi2.path,
      "title": "Volutpat pharetra sed",
      "subtitle": "Est elementum augue justo eget. Est augue eget."
    },
    {
      "image": Assets.icons.kunMavzusi3.path,
      "title": "Volutpat pharetra sed",
      "subtitle": "Est elementum augue justo eget. Est augue eget."
    },
    {
      "image": Assets.icons.kunMavzusi4.path,
      "title": "Volutpat pharetra sed",
      "subtitle": "Est elementum augue justo eget. Est augue eget."
    },
    {
      "image": Assets.icons.kunMavzusi5.path,
      "title": "Volutpat pharetra sed",
      "subtitle": "Est elementum augue justo eget. Est augue eget."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          semanticsLabel: "Kun mavzusi",
          "Kun mavzusi",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            fontFamily: GoogleFonts.balooTamma2().fontFamily,
          ),
        ),
        SizedBox(height: 30.h),
        Align(
          alignment: Alignment.center,
          child: Swiper(
            allowImplicitScrolling: true,
            // scrollDirection: Axis.horizontal,
            // axisDirection: AxisDirection.right,
            // autoplayDelay: 10,
            // autoplay: true,
            // autoplayDisableOnInteraction: true,
            layout: SwiperLayout.STACK,
            itemWidth: 400,
            itemHeight: 200,
            containerHeight: double.infinity,
            itemBuilder: (BuildContext context, int index) {
              final article = kunMavzusiArticles[index];
              final image = Image.asset(article["image"]!,
                  width: 305.w, height: 200.h, fit: BoxFit.cover);
              final title = article["title"]!;
              final subtitle = article["subtitle"]!;

              return Stack(
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
                      height: 56.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(16.r)),
                          color: const Color(0xFF8D80C1)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            semanticsLabel: title,
                            title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.balooTamma2().fontFamily,
                            ),
                          ),
                          // SizedBox(height: 5.h),
                          Text(
                            semanticsLabel: subtitle,
                            subtitle,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontFamily: GoogleFonts.balooTamma2().fontFamily,
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
