import 'package:flutter/material.dart';
import 'package:girls_care/common/di/injection.dart';
import 'package:girls_care/common/extensions/navigation_extensions.dart';
import 'package:girls_care/common/extensions/notification_extensions.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/common/widget/common_button.dart';
import 'package:girls_care/data/storage/storage.dart';
import 'package:girls_care/presentation/auth/plan/girl_mode.dart';
import 'package:girls_care/presentation/auth/plan/plan_page.dart';
import 'package:girls_care/presentation/auth/verify_page/widget/common_pin_put.dart';
import 'package:girls_care/presentation/main/home/main/period_main_app.dart';
import 'package:girls_care/presentation/main/pregnancy/main/pregnancy_main_app.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key, required this.code});

  final int code;

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final controller = TextEditingController();
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
                    "Ma’lumotlarni kiriting:".s(24).w(700).a(TextAlign.center),
                    SizedBox(
                      height: 40,
                    ),
                    "SMS kodni kiriting:".s(12).w(400),
                    SizedBox(
                      height: 8,
                    ),
                    CommonPinPut(
                      pinController: controller,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    "Kiritilgan kod noto’g’ri! Iltimos qayta urinib ko’ring."
                        .s(12)
                        .w(500),
                    Spacer(),
                    CommonButton.elevated(
                      text: "Kirish",
                      onPressed: () {
                        if (widget.code.toString() == controller.text) {
                          if ((storage.mode.call() == GirlMode.period)) {
                            context.pushAndRemoveAll(PeriodMainApp());
                          } else if (storage.mode.call() == GirlMode.pregnant) {
                            context.pushAndRemoveAll(PregnancyMainApp());
                          }
                          context.showElegantNotification(
                              title: "Muvaffaqiyatli kirish!",
                              description: "Ilovaga muvaffaqiyatli kirdingiz!",
                              type: NotificationType.success);
                        } else {
                          context.showElegantNotification(
                              title: "Kod noto'g'ri",
                              description: "Iltimos qayta urinib ko’ring.",
                              type: NotificationType.error);
                        }
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlanPage()));
                        },
                        child: "Hisob yaratish"
                            .s(16)
                            .w(700)
                            .c(context.colors.primary))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
