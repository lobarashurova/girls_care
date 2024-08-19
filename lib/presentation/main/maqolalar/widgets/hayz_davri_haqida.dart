import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/presentation/main/maqolalar/widgets/hayz_davri_details.dart';

class HayzDavriHaqida extends StatefulWidget {
  const HayzDavriHaqida({super.key});

  @override
  State<HayzDavriHaqida> createState() => _HayzDavriHaqidaState();
}

class _HayzDavriHaqidaState extends State<HayzDavriHaqida> {
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        hayzContainerDetails[index]['title']!.s(14.sp).w(500),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            if (hayzContainerDetails[index]['buttonText'] ==
                                "Videoni ko'rish")
                              SizedBox(width: 2.w),
                            hayzContainerDetails[index]['buttonText']!
                                .s(12.sp)
                                .w(700)
                                .c(const Color(0xFFEB2D69)),
                          ],
                        ),
                      ],
                    ),
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
