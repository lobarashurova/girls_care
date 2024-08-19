import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/presentation/main/main_app.dart';
import 'package:girls_care/presentation/main/main_app_db_service.dart';
import 'package:girls_care/presentation/main/maqolalar/articles.dart';
import 'package:provider/provider.dart';
import 'package:girls_care/common/di/injection.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/presentation/start/splash/splash_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
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
            ChangeNotifierProvider(create: (_) => MainAppDbService()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Girl Care',
            theme: ThemeData(
              primaryColor: context.colors.primary,
              scaffoldBackgroundColor: context.colors.window,
              textTheme: GoogleFonts.balooTamma2TextTheme(),
            ),
            home: const ArticlesPage(),
          ),
        );
      },
    );
  }
}
