import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:girls_care/common/base/base_page.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
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
        // context.router.replaceAll([const OnboardingRoute()]);
        break;
      case SplashEffect.login:
        // context.router.replaceAll([LoginRoute()]);
        break;
    }
  }

  @override
  Widget builder(BuildContext context, SplashBuildable state) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: Assets.icons.splash.image(width: 250, height: 110)),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                context.read<SplashCubit>().changeStatus();
              },
              child: Assets.icons.splash.image(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.4),
            ),
          )
        ],
      ),
    );
  }
}
