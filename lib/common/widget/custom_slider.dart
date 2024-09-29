import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider(
      {super.key,
      required this.firstTitle,
      required this.secondTitle,
      required this.selectedIndex});

  final String firstTitle;
  final String secondTitle;
  final ValueChanged<int> selectedIndex;

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      height: 38.h,
      width: 220.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: context.colors.onPrimary),
      child: Row(
        children: [
          Flexible(
              child: InkWell(
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
            onTap: () {
              setState(() {
                selectedIndex = 0;
              });
              widget.selectedIndex(selectedIndex);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: selectedIndex == 0
                      ? Color(0xFFDAD1FF)
                      : context.colors.onPrimary,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Center(
                child: widget.firstTitle.s(15).w(700).c(selectedIndex == 0
                    ? context.colors.black
                    : context.colors.black),
              ),
            ),
          )),
          Flexible(
              child: InkWell(
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
            onTap: () {
              setState(() {
                selectedIndex = 1;
              });
              widget.selectedIndex(selectedIndex);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: selectedIndex == 1
                      ? Color(0xFFDAD1FF)
                      : context.colors.onPrimary,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Center(
                child: widget.secondTitle.s(15).w(700).c(selectedIndex == 1
                    ? context.colors.black
                    : context.colors.black),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
