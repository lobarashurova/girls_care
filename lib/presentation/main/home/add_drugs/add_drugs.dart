import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/extensions/navigation_extensions.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/presentation/main/account/widgets/custom_listtile.dart';
import 'package:girls_care/presentation/main/home/widgets/custom_appbar.dart';

class AddDrugsPage extends StatefulWidget {
  const AddDrugsPage({super.key});

  @override
  State<AddDrugsPage> createState() => _AddDrugsPageState();
}

class _AddDrugsPageState extends State<AddDrugsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        centerTitle: "Dori qo'shish",
        leading: Assets.icons.close.svg(),
        actions: [
          TextButton(
              onPressed: () {
                context.pop();
              },
              child: "SAQLASH".s(14).w(400).c(context.colors.primary2)),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              CustomListTile(
                onTap: () {},
                isMoreLine: true,
                items: [
                  CustomListTileItem(
                      text: 'Bildirishnomalar',
                      prefix: Assets.icons.rightVector
                          .svg(width: 24.w, height: 24.h),
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
