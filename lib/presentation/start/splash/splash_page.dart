import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/base/base_page.dart';
import 'package:girls_care/common/extensions/navigation_extensions.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/presentation/auth/login/login_page.dart';
import 'package:girls_care/presentation/main/main_app.dart';
import 'package:girls_care/presentation/start/onboard/onboarding_page.dart';
import 'package:girls_care/presentation/start/splash/cubit/splash_cubit.dart';
import 'package:girls_care/presentation/start/splash/cubit/splash_state.dart';

@RoutePage()
class SplashPage
    extends BasePage<SplashCubit, SplashBuildable, SplashListenable> {
  const SplashPage({super.key});

  @override
  void init(BuildContext context) {
    context.read<SplashCubit>().changeStatus();
    super.init(context);
  }

  @override
  void listener(BuildContext context, SplashListenable state) {
    switch (state.effect) {
      case SplashEffect.home:
        context.pushReplacement(const MainApp());
        break;
      case SplashEffect.onboard:
        context.pushReplacement(const OnboardingPage());
        break;
      case SplashEffect.login:
        context.push(const LoginPage());
        break;
    }
  }

  @override
  Widget builder(BuildContext context, SplashBuildable state) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Assets.icons.splash
              .image(width: 170.w, height: 200..h, fit: BoxFit.cover),
          SizedBox(height: 50.h),
          "Mali — sog’lom ayollik uchun ".s(24.sp).w(600)
        ],
      ),
    ));
  }
}
