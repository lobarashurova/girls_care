import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/presentation/main/main_app.dart';
import 'package:girls_care/presentation/main/main_app_db_service.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticlesSection extends StatefulWidget {

  const ArticlesSection({super.key});

  @override
  State<ArticlesSection> createState() => _ArticlesSectionState();
}

class _ArticlesSectionState extends State<ArticlesSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "Maqolalar".s(24.sp).w(600).c(Colors.black),
            IconButton(
              onPressed: () {
                context.read<MainAppDbService>().onTabTapped(1);
              },
              icon: Assets.icons.rightVector.svg(width: 24.w, height: 24.h),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.w,
            mainAxisSpacing: 16.h,
            mainAxisExtent: 180.h,
          ),
          itemBuilder: (context, index) {
            List<GridItem> items = [
              GridItem(
                imagePath: Assets.icons.kunSavoli.image(fit: BoxFit.fill),
                title: 'Kun savoli',
              ),
              GridItem(
                imagePath: Assets.icons.hayzDavri.image(fit: BoxFit.fill),
                title: 'Hayz davri haqida',
              ),
              GridItem(
                imagePath:
                    Assets.icons.soglomOvqatlanish.image(fit: BoxFit.fill),
                title: 'Sog\'lom ovqatlanish',
              ),
              GridItem(
                imagePath: Assets.icons.ogriqBartaraf.image(fit: BoxFit.fill),
                title: "Hayz davrida og'riqni bartaraf etish",
              ),
            ];
            return items[index];
          },
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
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: imagePath,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            height: 46.h,
            decoration: const BoxDecoration(
              color: Color(0xFF8D80C1),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
            ),
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                " $title",
                style: TextStyle(
                  color: const Color(0xFFE2DCFE),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.balooTamma2().fontFamily,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
