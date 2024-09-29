import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/common/widget/common_button.dart';
import 'package:girls_care/presentation/main/change_calendar_data/widgets/input_info_text.dart';

class InputInfoBottom extends StatefulWidget {
  final TextEditingController periodDaysController;
  final TextEditingController cycleDaysController;
  final TextEditingController lastDaysController;
  const InputInfoBottom({
    super.key,
    required this.periodDaysController,
    required this.cycleDaysController,
    required this.lastDaysController,
  });

  @override
  State<InputInfoBottom> createState() => _InputInfoBottomState();
}

class _InputInfoBottomState extends State<InputInfoBottom> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          border:
              const Border(top: BorderSide(width: 1, color: Color(0xFF8D80C1))),
          color: const Color(0xFFF3F0FF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.w),
            topRight: Radius.circular(24.w),
          ),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: "Ma’lumotlarni kiriting:"
                      .s(22.sp)
                      .w(700)
                      .c(context.colors.black)),
              SizedBox(height: 24.h),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                InputInfoTextfield(
                  controller: widget.periodDaysController,
                  hintText: "O'rtacha hayz kunlari",
                  width: 154.w,
                ),
                SizedBox(width: 10.w),
                InputInfoTextfield(
                    controller: widget.cycleDaysController,
                    hintText: "O'rtacha tsikl kunlari",
                    width: 154.w)
              ]),
              SizedBox(height: 4.h),
              "Hayz davomiyligi va hayzlar orasidagi taxminiy davrni kiriting"
                  .s(12.sp)
                  .w(500)
                  .c(Colors.black),
              SizedBox(height: 24.h),
              InputInfoTextfield(
                controller: widget.lastDaysController,
                hasSuffix: true,
                hintText: "Oxirgi hayzning boshlanish sanasini kiriting",
                width: double.infinity,
              ),
              SizedBox(height: 4.h),
              "Ilova navbatdagi hayz davrini hisoblashi uchun"
                  .s(12.sp)
                  .w(500)
                  .c(Colors.black),
              SizedBox(height: 24.h),
              CommonButton.elevated(
                  radius: 12.r,
                  text: "Saqlash",
                  backgroundColor: const Color(0xFFEB2D69),
                  onPressed: () {}),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
