import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/gen/assets.gen.dart';

class MaqolalarSection extends StatefulWidget {
  const MaqolalarSection({super.key});

  @override
  State<MaqolalarSection> createState() => _MaqolalarSectionState();
}

class _MaqolalarSectionState extends State<MaqolalarSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Maqolalar",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600),
            ),
            IconButton(
              onPressed: () {},
              icon: Assets.icons.rightVector.svg(width: 24.w, height: 24.h),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 16.h,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            GridItem(
              imagePath: Assets.icons.kunSavoli.image(fit: BoxFit.fill),
              title: 'Kun savoli',
            ),
            GridItem(
              imagePath: Assets.icons.hayzDavri.image(fit: BoxFit.fill),
              title: 'Hayz davri haqida',
            ),
            GridItem(
              imagePath: Assets.icons.soglomOvqatlanish.image(fit: BoxFit.fill),
              title: 'Sog\'lom ovqatlanish',
            ),
            GridItem(
              imagePath: Assets.icons.ogriqBartaraf.image(fit: BoxFit.fill),
              title: 'Hayz davrida og\'riqni bartaraf etish',
            ),
          ],
        ),
      ],
    );
  }
}

class GridItem extends StatelessWidget {
  final Image imagePath;
  final String title;

  const GridItem({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      child: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(90, 141, 128, 193),
                  )),
              child: imagePath),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 47.h,
              decoration: const BoxDecoration(
                color: Color.fromARGB(95, 141, 128, 193),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
              ),
              child: Center(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " $title",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
