import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:google_fonts/google_fonts.dart';

class HayzDavriHaqida extends StatefulWidget {
  const HayzDavriHaqida({super.key});

  @override
  State<HayzDavriHaqida> createState() => _HayzDavriHaqidaState();
}

class _HayzDavriHaqidaState extends State<HayzDavriHaqida> {
  final List<Map<String, dynamic>> hayzContainerDetails = [
    {
      'image': Assets.icons.hayz1,
      'title': "Hayz davrida gigienik vositalarni to’g’ri tanlash",
      'buttonText': "To’liq o’qish",
      'color': Colors.pink,
    },
    {
      'image': Assets.icons.hayz2,
      'title': "Hayz davrida gigienik vositalarni to’g’ri tanlash",
      'buttonText': "Videoni ko'rish",
      'color': Colors.red,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.862,
      ),
      itemCount: hayzContainerDetails.length,
      itemBuilder: (context, index) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 220.h,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16.r),
                  ),
                  child: hayzContainerDetails[index]['image']!.image(
                    height: 120.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 69.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(16.r),
                    ),
                    color: const Color(0xFFE2DCFE),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hayzContainerDetails[index]['title']!,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: GoogleFonts.balooTamma2().fontFamily,
                        ),
                      ),
                      Row(
                        children: [
                          if (hayzContainerDetails[index]['buttonText'] ==
                              "Videoni ko'rish")
                            SizedBox(width: 2.w),
                          Text(
                            hayzContainerDetails[index]['buttonText']!,
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xFFEB2D69),
                                fontWeight: FontWeight.w700,
                                fontFamily:
                                    GoogleFonts.balooTamma2().fontFamily),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
