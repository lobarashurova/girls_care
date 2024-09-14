import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/presentation/main/home/widgets/custom_appbar.dart';

import '../../../common/gen/assets.gen.dart';

class ReadArticles extends StatefulWidget {
  final String title;
  final String imagePath;
  final String id;
  final String text;

  const ReadArticles(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.id,
      required this.text});

  @override
  State<ReadArticles> createState() => _ReadArticlesState();
}

class _ReadArticlesState extends State<ReadArticles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgrounColor,
      appBar: CustomAppbar(
        centerTitle: widget.title,
        leading: Assets.icons.leftVector.svg(width: 16.w, height: 16.h),
        actions: [Assets.icons.export.svg(width: 16.w, height: 16.h)],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.h),
        child: ListView(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(widget.imagePath, width: double.infinity)),
            SizedBox(height: 30.h),
            widget.text.s(14.sp).w(500),
          ],
        ),
      ),
    );
  }
}
