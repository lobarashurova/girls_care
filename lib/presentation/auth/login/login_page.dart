import 'dart:math';

import 'package:flutter/material.dart';
import 'package:girls_care/common/extensions/navigation_extensions.dart';
import 'package:girls_care/common/extensions/notification_extensions.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/common/widget/common_button.dart';
import 'package:girls_care/presentation/auth/login/login_provider.dart';
import 'package:girls_care/presentation/auth/plan/plan_page.dart';
import 'package:girls_care/presentation/auth/verify_page/verify_page.dart';
import 'package:provider/provider.dart';

import '../../../common/widget/common_text_filed.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Telefon raqamingizni kiriting:".s(12).w(400),
                        SizedBox(
                          height: 16,
                        ),
                        CommonTextField(
                          controller: phoneController,
                          prefixIcon:
                              "+998".s(16).w(400).c(context.colors.display),
                          onChanged: (text) {
                            setState(() {});
                          },
                          keyboardType: TextInputType.number,
                          mask: "## ### ## ##",
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        "Maxfiy so'zni kiriting::".s(12).w(400),
                        SizedBox(
                          height: 16,
                        ),
                        CommonTextField(
                          controller: passwordController,
                          obscureText: true,
                          onChanged: (text) {
                            setState(() {});
                          },
                          errorText:
                              "Maxfiy so'z uzunligi 5 dan katta boliishi kerak",
                        ),
                      ],
                    ),
                    Spacer(),
                    CommonButton.elevated(
                      text: "Saqlash va davom etish",
                      enabled: phoneController.text.length == 12 &&
                          passwordController.text.length > 5,
                      loading: loginProvider.loading ?? false,
                      onPressed: () async {
                        print(
                            "phone ::::: +998${phoneController.text.trim().replaceAll(" ", "")}");
                        await loginProvider.login(
                          "+998${phoneController.text.trim().replaceAll(" ", "")}",
                          passwordController.text.trim(),
                        );
                        if (loginProvider.user != null) {
                          Random random = Random();
                          int number = 1001 + random.nextInt(9999 - 1001);
                          context.push(VerifyPage(
                            code: number,
                          ));
                          context.showElegantNotification(
                              title: "Sizning kodingiz:",
                              description: "Tasdiqlash kodingiz : $number",
                              type: NotificationType.success);
                        } else {
                          context.showElegantNotification(
                              title: "Foydalanuvchi topilmadi",
                              description: "${loginProvider.errorMessage}",
                              type: NotificationType.error);
                        }
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlanPage()));
                        },
                        child: "Hisob yaratish"
                            .s(16)
                            .w(700)
                            .c(context.colors.primary)),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
