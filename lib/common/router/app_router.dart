import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    /// Auth
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(page: PasswordRoute.page),
    AutoRoute(page: VerifyRoute.page),
    AutoRoute(page: EmailRoute.page),

    /// Start
    AutoRoute(page: OnboardingRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: SplashRoute.page, initial: true),

    //
    // //Others
    AutoRoute(page: AddFeedRoute.page),
    AutoRoute(page: AllNotificationsRoute.page),
    AutoRoute(page: SearchRoute.page),
    AutoRoute(page: DomkomRoute.page),
    AutoRoute(page: MyInfoRoute.page),

    //
    /// Main
    AutoRoute(
      page: MainRoute.page,
      children: [
        AutoRoute(page: LentaRoute.page),
        AutoRoute(page: ListChatsRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: ProfileRoute.page),
      ],
    ),
  ];
}
