import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/presentation/main/account/widgets/change_account_information.dart';
import 'package:girls_care/presentation/main/account/widgets/custom_listtile.dart';

class AccountInformation extends StatelessWidget {
  const AccountInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F0FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3F0FF),
        foregroundColor: const Color(0xFFF3F0FF),
        centerTitle: true,
        title: "Shaxsiy ma’lumotlar".s(18.sp).w(700).c(const Color(0xFF1B1F24)),
      ),
      body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              const ChangeAccountInformation(),
              CustomListTile(
                onTap: () {},
                isMoreLine: true,
                items: [
                  CustomListTileItem(
                    text: 'Ismni o’zgartirish',
                    prefix:
                        Assets.icons.rightVector.svg(width: 24.w, height: 24.h),
                    suffix: null,
                  ),
                  CustomListTileItem(
                    text: 'Aloqa ma’lumotlarini tahrirlash',
                    prefix:
                        Assets.icons.rightVector.svg(width: 24.w, height: 24.h),
                    suffix: null,
                  ),
                  CustomListTileItem(
                    text: 'Tug’ilgan sanani o’zgartirish',
                    prefix:
                        Assets.icons.rightVector.svg(width: 24.w, height: 24.h),
                    suffix: null,
                  ),
                  CustomListTileItem(
                    text: 'Vazn & bo’y ma’lumotlarini tahrirlash',
                    prefix:
                        Assets.icons.rightVector.svg(width: 24.w, height: 24.h),
                    suffix: null,
                  ),
                  CustomListTileItem(
                    text: 'Hisobni o’chirish',
                    prefix: null,
                    suffix: null,
                  ),
                  CustomListTileItem(
                    text: 'Chiqish',
                    prefix: null,
                    suffix: null,
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
