import 'package:flutter/material.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/common/widget/common_button.dart';
import 'package:girls_care/presentation/app/base_box.dart';
import 'package:girls_care/presentation/auth/register/register_simple_page.dart';
import 'package:girls_care/presentation/auth/register_pregnant/register_pregnant.dart';

class PlanPage extends StatefulWidget {
  const PlanPage({super.key});

  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  int selectedIndex = 0;

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
                          selected: selectedIndex == 0,
                          child: Column(
                            children: [
                              Assets.icons.hayzGirl
                                  .image(width: 100, height: 85),
                              SizedBox(
                                height: 32,
                              ),
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
                              onTap: () => setState(() {
                                    selectedIndex = 1;
                                  }),
                              selected: selectedIndex == 1,
                              child: Column(
                                children: [
                                  Assets.icons.pregrant
                                      .image(width: 100, height: 85),
                                  SizedBox(
                                    height: 32,
                                  ),
                                  "Homiladorlik kalendari"
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => selectedIndex==0 ? RegisterSimplerPage() : RegisterPregnant()));
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
                                  builder: (context) => RegisterSimplerPage()));
                        },
                        child: "Ma'lumotlarni saqlamasdan davom etish"
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
