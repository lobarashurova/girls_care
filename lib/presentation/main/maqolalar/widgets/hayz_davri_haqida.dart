import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';

final List<Map<String, dynamic>> hayzContainerDetails = [
  {
    'image': Assets.icons.hayz1,
    'title': "Hayz davrida gigienik vositalarni to’g’ri tanlash",
    'buttonText': "To’liq o’qish",
  },
  {
    'image': Assets.icons.hayz2,
    'title': "Hayz davrida gigienik vositalarni to’g’ri tanlash",
    'buttonText': "Videoni ko'rish",
  },
  {
    'image': Assets.icons.hayz3,
    'title': "Hayz davrida tana qanday holatda bo’ladi?",
    'buttonText': "To’liq o’qish",
  },
  {
    'image': Assets.icons.hayz4,
    'title': "Hayz davridagi psixologik o’zgarishlar",
    'buttonText': "Videoni ko'rish",
  },
  {
    'image': Assets.icons.hayz5,
    'title': "Hayz davrida organizmga zarur oziq-ovqatlar ro’yxati",
    'buttonText': "To’liq o’qish",
  },
  {
    'image': Assets.icons.hayz6,
    'title': "Ichak faoliyatini yaxshilovchi ozuqalar",
    'buttonText': "Videoni ko'rish",
  },
];

class HayzDavriHaqida extends StatefulWidget {
  const HayzDavriHaqida({super.key});

  @override
  State<HayzDavriHaqida> createState() => _HayzDavriHaqidaState();
}

class _HayzDavriHaqidaState extends State<HayzDavriHaqida> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 20.h,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 1.6),
      ),
      itemCount: hayzContainerDetails.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Container(
            height: 230.h,
            decoration: BoxDecoration(
              color: const Color(0xFFE2DCFE),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16.r),
                  ),
                  child: Image.asset(
                    hayzContainerDetails[index]['image'].path,
                    height: 150.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hayzContainerDetails[index]['title']!,
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF1B1F24)),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        hayzContainerDetails[index]['buttonText']!,
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFEB2D69)),
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
