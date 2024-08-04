import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:girls_care/common/base/base_page.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
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
        // context.router.replaceAll([const MainRoute()]);
        break;
      case SplashEffect.onboard:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => OnboardingPage()));
        break;
      case SplashEffect.login:
        // context.router.replaceAll([LoginRoute()]);
        break;
    }
  }

  @override
  Widget builder(BuildContext context, SplashBuildable state) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Assets.icons.splash.image(width: 170, height: 200, fit: BoxFit.cover),
          SizedBox(
            height: 50,
          ),
          "Mali — sog’lom ayollik uchun ".s(24).w(600)
        ],
      ),
    ));
  }
}
