import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/gen/assets.gen.dart';

class YordamchiSection extends StatefulWidget {
  const YordamchiSection({super.key});

  @override
  State<YordamchiSection> createState() => _YordamchiSectionState();
}

class _YordamchiSectionState extends State<YordamchiSection> {
  Map<String, Image> yordamchiSectionCircle = {
    "Alomatlar": Assets.icons.alomatlarIcon.image(width: 78.w, height: 78.h),
    "Kayfiyat": Assets.icons.kayfiyatIcon.image(width: 78.w, height: 78.h),
    "Dorilar": Assets.icons.dorilarIcon.image(width: 78.w, height: 78.h),
    "Kundalik": Assets.icons.kundalikIcon.image(width: 78.w, height: 78.h),
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Yordamchi",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700),
            ),
            IconButton(
              onPressed: () {},
              icon: Assets.icons.rightVector.svg(width: 24.w, height: 24.h),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        SizedBox(
          width: double.infinity,
          height: 104.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: yordamchiSectionCircle.length,
            itemBuilder: (context, index) {
              String key = yordamchiSectionCircle.keys.elementAt(index);
              Image icon = yordamchiSectionCircle.values.elementAt(index);

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: SizedBox(width: 78.w, height: 78.h, child: icon),
                    ),
                    Text(
                      key,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
