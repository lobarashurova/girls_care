import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/di/injection.dart';
import 'package:girls_care/common/extensions/navigation_extensions.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/common/extensions/widget.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/common/widget/common_button.dart';
import 'package:girls_care/data/storage/storage.dart';
import 'package:girls_care/presentation/app/base_box.dart';
import 'package:girls_care/presentation/auth/plan/girl_mode.dart';
import 'package:girls_care/presentation/auth/register/register_simple_page.dart';
import 'package:girls_care/presentation/auth/register_pregnant/register_pregnant.dart';
import 'package:girls_care/presentation/main/after_pregnancy/main/pregnancy_main_app.dart';
import 'package:girls_care/presentation/main/home/main/period_main_app.dart';
import 'package:girls_care/presentation/main/pregnancy/main/pregnancy_main_app.dart';

class PlanPage extends StatefulWidget {
  const PlanPage({super.key, required this.isLogin});

  final bool isLogin;

  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  int selectedIndex = 0;
  final storage = getIt<Storage>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3 - 15,
              child: Assets.icons.backgound.image(fit: BoxFit.cover),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                height: MediaQuery.of(context).size.height * 2 / 3 + 60,
                decoration: BoxDecoration(
                    color: context.colors.onPrimary,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24))),
                child: Column(
                  children: [
                    SizedBox(
                      width: 80,
                      child: LinearProgressIndicator(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        color: context.colors.primary2.withOpacity(0.1),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    "Rejimni kiriting:".s(24).w(700).a(TextAlign.center),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                            child: BaseBox(
                          onTap: () {
                            setState(() {
                              selectedIndex = 0;
                            });
                          },
                          height: 165.h,
                          selected: selectedIndex == 0,
                          child: Column(
                            children: [
                              Assets.icons.hayzGirl
                                  .image(width: 100.w, height: 85.h),
                              "Hayz davri"
                                  .s(16)
                                  .w(400)
                                  .c(context.colors.display),
                            ],
                          ),
                        )),
                        SizedBox(
                          width: 16,
                        ),
                        Flexible(
                          child: BaseBox(
                              height: 165.h,
                              onTap: () => setState(() {
                                    selectedIndex = 1;
                                  }),
                              selected: selectedIndex == 1,
                              child: Column(
                                children: [
                                  Assets.icons.pregrant
                                      .image(width: 100.w, height: 85.h),
                                  "Homiladorlik kalendari"
                                      .s(16)
                                      .w(400)
                                      .c(context.colors.display)
                                      .a(TextAlign.center),
                                ],
                              )),
                        )
                      ],
                    ),
                    16.kh,
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                            child: BaseBox(
                          onTap: () {
                            setState(() {
                              selectedIndex = 2;
                            });
                          },
                          height: 165.h,
                          selected: selectedIndex == 2,
                          child: Column(
                            children: [
                              Assets.icons.tugruqSong
                                  .image(width: 100.w, height: 85.h),
                              "Tug'ruqdan keyingi tiklanish"
                                  .s(16)
                                  .w(400)
                                  .c(context.colors.display)
                                  .a(TextAlign.center),
                            ],
                          ),
                        )),
                        SizedBox(
                          width: 16,
                        ),
                        Flexible(
                          child: BaseBox(
                              height: 165.h,
                              onTap: () => setState(() {
                                    selectedIndex = 3;
                                  }),
                              selected: selectedIndex == 3,
                              child: Column(
                                children: [
                                  Assets.icons.klimaks
                                      .image(width: 100.w, height: 85.h),
                                  "Klimaks"
                                      .s(16)
                                      .w(400)
                                      .c(context.colors.display),
                                ],
                              )),
                        )
                      ],
                    ),
                    Spacer(),
                    CommonButton.elevated(
                      text: "Saqlash va davom etish",
                      onPressed: () {
                        switch (selectedIndex) {
                          case 0:
                            {
                              storage.mode.set(GirlMode.period);
                              if (widget.isLogin) {
                                context.pushAndRemoveAll(PeriodMainApp());
                              } else {
                                context.push(const RegisterSimplerPage());
                              }
                            }
                          case 1:
                            {
                              storage.mode.set(GirlMode.pregnant);
                              if (widget.isLogin) {
                                context.pushAndRemoveAll(PregnancyMainApp());
                              } else {
                                context.push(RegisterPregnant());
                              }
                            }
                          case 2:
                            {
                              storage.mode.set(GirlMode.afterbirth);
                              if (widget.isLogin) {
                                context
                                    .pushAndRemoveAll(AfterPregnancyMainApp());
                              } else {
                                context.push(RegisterPregnant());
                              }
                            }
                          case 3:
                            {
                              storage.mode.set(GirlMode.klimaks);
                            }
                        }
                      },
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
