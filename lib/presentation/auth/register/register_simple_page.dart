import 'package:flutter/material.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/common/widget/common_button.dart';
import 'package:girls_care/common/widget/common_text_filed.dart';
import 'package:girls_care/presentation/auth/register_total/register_total.dart';
import 'package:girls_care/presentation/auth/register_total/register_total.dart';
import 'package:girls_care/presentation/auth/verify_page/verify_page.dart';

class RegisterSimplerPage extends StatefulWidget {
  const RegisterSimplerPage({super.key});

  @override
  State<RegisterSimplerPage> createState() => _RegisterSimplerPageState();
}

class _RegisterSimplerPageState extends State<RegisterSimplerPage> {
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
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                height: MediaQuery.of(context).size.height * 2 / 3 + 60,
                decoration: BoxDecoration(
                    color: context.colors.onPrimary,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(24))),
                child: Column(
                  children: [
                    SizedBox(
                      width: 80,
                      child: LinearProgressIndicator(
                        borderRadius: const BorderRadius.all(Radius.circular(3)),
                        color: context.colors.primary2.withOpacity(0.1),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    "Ma’lumotlarni kiriting:".s(24).w(700).a(TextAlign.center),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Flexible(
                                child: CommonTextField(
                              hint: "O’rtacha hayz kunlari",
                            )),
                            SizedBox(
                              width: 16,
                            ),
                            Flexible(
                                child: CommonTextField(
                              hint: "O’rtacha sikl kunlari",
                            )),
                          ],
                        ),
                        const SizedBox(height: 8,),
                        "Hayz davomiyligi va hayzlar orasidagi taxminiy davrni kiriting ".s(12).w(400).c(context.colors.display),
                        const SizedBox(
                          height: 32,
                        ),
                        CommonTextField(
                          hint: "Oxirgi hayzning boshlanish sanasini kiriting",
                          suffix: Assets.icons.calendar.svg(width: 20, height: 20),
                        ),
                        const SizedBox(height: 8,),
                        "Ilova navbatdagi hayz davrini hisoblashi uchun".s(12).w(400).c(context.colors.display)
                      ],
                    ),
                    const Spacer(),
                    CommonButton.elevated(
                      text: "Saqlash va davom etish",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterTotalPage()));
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterTotalPage()));
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
