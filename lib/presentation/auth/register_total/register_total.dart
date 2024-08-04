import 'package:flutter/material.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/common/widget/common_button.dart';
import 'package:girls_care/common/widget/common_text_filed.dart';
import 'package:girls_care/presentation/main/home/home_page.dart';

class RegisterTotalPage extends StatefulWidget {
  const RegisterTotalPage({super.key});

  @override
  State<RegisterTotalPage> createState() => _RegisterTotalPageState();
}

class _RegisterTotalPageState extends State<RegisterTotalPage> {
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Telefon raqamingizni kiriting:".s(12).w(400),
                        SizedBox(
                          height: 16,
                        ),
                        CommonTextField(
                          prefixIcon:
                              "+998".s(16).w(400).c(context.colors.display),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        "Maxfiy kodni kiriting::".s(12).w(400),
                        SizedBox(
                          height: 8,
                        ),
                        CommonTextField(
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        "Kodni takrorlang::".s(12).w(400),
                        SizedBox(
                          height: 8,
                        ),
                        CommonTextField(
                          obscureText: true,
                        ),
                      ],
                    ),
                    Spacer(),
                    CommonButton.elevated(
                      text: "Hisob yaratish",
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
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
                                  builder: (context) => HomePage()));
                        },
                        child: "Ma’lumotlarni kiritmasdan davom etish"
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
