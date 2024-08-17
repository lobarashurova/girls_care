import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/common/widget/common_button.dart';
import 'package:girls_care/presentation/start/onboard/data/onboard.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../data_fill/name_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 50.h,
            left: 16.w,
            right: 16.w,
            bottom: 24.h,
          ),
          child: Column(
            children: [
              Flexible(
                child: PageView.builder(
                  controller: controller,
                  itemBuilder: (context, index) {
                    return Onboard.values[index].icon;
                  },
                  onPageChanged: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  itemCount: 3,
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    SizedBox(height: 68.h),
                    AnimatedSmoothIndicator(
                      activeIndex: selectedIndex,
                      count: 3,
                      effect: CustomizableEffect(
                        dotDecoration: DotDecoration(
                          color: context.colors.title01,
                          width: 8.w,
                          height: 8.h,
                          borderRadius: BorderRadius.circular(5.r),
                          dotBorder: DotBorder(
                            width: 1.w,
                            color: context.colors.primary01,
                          ),
                        ),
                        activeDotDecoration: DotDecoration(
                          color: context.colors.onPrimary,
                          width: 24.w,
                          height: 8.h,
                          borderRadius: BorderRadius.circular(5.r),
                          dotBorder: DotBorder(
                            width: 1.w,
                            color: context.colors.primary,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 18.h),
                    Onboard.values[selectedIndex].title
                        .s(24.sp)
                        .w(600)
                        .c(context.colors.label)
                        .a(TextAlign.center),
                    const Spacer(),
                    CommonButton.elevated(
                        text: "Далее",
                        onPressed: () {
                          if (selectedIndex < 2) {
                            setState(() {
                              selectedIndex++;
                            });
                            controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          } else {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const NamePage()));
                          }
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
