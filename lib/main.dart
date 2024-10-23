import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/di/injection.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/presentation/auth/login/login_provider.dart';
import 'package:girls_care/presentation/auth/register/provider/register_provider.dart';
import 'package:girls_care/presentation/main/after_pregnancy/main/main_app_db_service.dart';
import 'package:girls_care/presentation/main/home/main/main_app_db_service.dart';
import 'package:girls_care/presentation/main/klimaks/main/klimaks_app_db_service.dart';
import 'package:girls_care/presentation/main/pregnancy/main/main_app_db_service.dart';
import 'package:girls_care/presentation/start/splash/splash_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await configureDependencies();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => LoginProvider()),
    ChangeNotifierProvider(create: (_) => RegisterProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => PregnancyAppService()),
            ChangeNotifierProvider(create: (_) => PeriodAppService()),
            ChangeNotifierProvider(create: (_) => AfterPregnancyAppService()),
            ChangeNotifierProvider(create: (_) => KlimaksAppService()),

          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Girl Care',
            theme: ThemeData(
              primaryColor: context.colors.primary,
              scaffoldBackgroundColor: context.colors.backgrounColor,
              textTheme: GoogleFonts.balooTamma2TextTheme(),
              fontFamily: GoogleFonts.balooTamma2().fontFamily,
            ),
            home: SplashPage(),
          ),
        );
      },
    );
  }
}
