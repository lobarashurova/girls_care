import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/extensions/navigation_extensions.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/presentation/main/account/account_information.dart';
import 'package:girls_care/presentation/main/account/widgets/custom_listtile.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3F0FF),
        foregroundColor: const Color(0xFFF3F0FF),
        centerTitle: true,
        title: "Hisob".s(18.sp).w(700).c(const Color(0xFF1B1F24)),
      ),
      backgroundColor: const Color(0xFFF3F0FF),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            CustomListTile(
              onTap: () {
                context.push(AccountInformation());
              },
              isMoreLine: true,
              items: [
                CustomListTileItem(
                  text: "Shaxsiy ma'lumotlar",
                  prefix: Assets.icons.rightVector.svg(
                      width: 24.w,
                      height: 24.h,
                      color: const Color(0xFF8D80C1)),
                  suffix: null,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            "Hayz ma'lumotlari".s(16.sp).w(600).c(const Color(0xFF1B1F24)),
            SizedBox(height: 20.h),
            CustomListTile(
              onTap: () {},
              isMoreLine: true,
              items: [
                CustomListTileItem(
                  text: 'Sikl davomiyligi',
                  prefix: "28 kun".s(14.sp).w(500).c(const Color(0xFF8D80C1)),
                  suffix: null,
                ),
                CustomListTileItem(
                  text: 'Hayz davomiyligi',
                  prefix: "5 kun".s(14.sp).w(500).c(const Color(0xFF8D80C1)),
                  suffix: null,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            "Rejimni o’zgartirish".s(16.sp).w(600).c(const Color(0xFF1B1F24)),
            SizedBox(height: 20.h),
            CustomListTile(
              onTap: () {},
              isMoreLine: true,
              items: [
                CustomListTileItem(
                  text: 'Hayzni nazorat qilish',
                  prefix: Switch(
                    activeColor: Colors.white,
                    // ignore: prefer_const_constructors
                    thumbColor: WidgetStateProperty.all(Color(0xFF8D80C1)),
                    trackOutlineColor:
                        WidgetStateProperty.all(const Color(0xFF8D80C1)),
                    value: true,
                    onChanged: (val) {},
                  ),
                  suffix: null,
                ),
                CustomListTileItem(
                  text: 'Homiladorlik',
                  prefix: Switch(
                    value: false,
                    onChanged: (val) {},
                    activeColor: Colors.white,
                    inactiveTrackColor: Colors.white,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    // trackOutlineWidth: WidgetStateProperty.all(1,
                    inactiveThumbColor: const Color(0xFF8D80C1),
                    // ignore: prefer_const_constructors
                    thumbColor: WidgetStateProperty.all(Color(0xFF8D80C1)),
                    trackOutlineColor:
                        WidgetStateProperty.all(const Color(0xFF8D80C1)),
                  ),
                  suffix: null,
                ),
                CustomListTileItem(
                  text: 'Tug’ruqdan keyin',
                  prefix: Switch(
                    value: true,
                    onChanged: (val) {},
                    activeColor: Colors.white,
                    // ignore: prefer_const_constructors
                    thumbColor: WidgetStateProperty.all(Color(0xFF8D80C1)),
                    trackOutlineColor:
                        WidgetStateProperty.all(const Color(0xFF8D80C1)),
                  ),
                  suffix: null,
                ),
                CustomListTileItem(
                  text: 'Klimaks',
                  prefix: Switch(
                    value: false,
                    onChanged: (val) {},
                    activeColor: Colors.white,
                    inactiveTrackColor: Colors.white,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    // trackOutlineWidth: WidgetStateProperty.all(1,
                    inactiveThumbColor: const Color(0xFF8D80C1),
                    // ignore: prefer_const_constructors
                    thumbColor: WidgetStateProperty.all(Color(0xFF8D80C1)),
                    trackOutlineColor:
                        WidgetStateProperty.all(const Color(0xFF8D80C1)),
                  ),
                  suffix: null,
                ),
              ],
            ),
            SizedBox(height: 120.h),
          ],
        ),
      ),
    );
  }
}
