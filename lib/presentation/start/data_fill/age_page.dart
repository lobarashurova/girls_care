import 'package:flutter/material.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/common/widget/common_button.dart';
import 'package:girls_care/presentation/auth/login/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

class AgePage extends StatefulWidget {
  const AgePage({super.key});

  @override
  State<AgePage> createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  int currentValue = 18;

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
                    "Yoshingizni kiriting:".s(24).w(700).a(TextAlign.center),
                    SizedBox(
                      height: 16,
                    ),
                    "Yuqori aniqlikdagi dizagnozni taqdim etish uchun yoshingizni kiritishingizni so’raymiz"
                        .s(16)
                        .w(400)
                        .c(context.colors.display)
                        .a(TextAlign.center),
                    SizedBox(
                      height: 32,
                    ),
                    NumberPicker(
                      axis: Axis.horizontal,
                      minValue: 12,
                      maxValue: 65,
                      onChanged: (newValue) =>
                          setState(() => currentValue = newValue),
                      value: currentValue,
                      itemHeight: 200,
                      itemWidth: 123,
                      textStyle: GoogleFonts.balooTamma2(
                          fontSize: 96,
                          color: context.colors.display,
                          fontWeight: FontWeight.w700),
                      selectedTextStyle: GoogleFonts.balooTamma2(
                          fontSize: 128,
                          color: context.colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    Spacer(),
                    CommonButton.elevated(
                      text: "Saqlash va davom etish",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
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
                                  builder: (context) => LoginPage()));
                        },
                        child: "Yoshni kiritmasdan davom etish"
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
