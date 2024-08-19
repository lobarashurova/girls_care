import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';

class CustomContainerImg extends StatefulWidget {
  final String title;
  final String subtitle;
  final Color color;
  final SvgPicture image;

  const CustomContainerImg({
    super.key,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.image,
  });

  @override
  State<CustomContainerImg> createState() => _CustomContainerImgState();
}

class _CustomContainerImgState extends State<CustomContainerImg> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: widget.color,
      ),
      child: Stack(
        children: [
          Positioned(
            right: -8,
            bottom: 0,
            top: 0,
            child: widget.image,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.title.s(16.sp).w(600).c(Colors.black),
                SizedBox(height: 8.h),
                widget.subtitle.s(11.sp).w(400).c(Colors.black),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
