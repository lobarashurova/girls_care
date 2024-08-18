import 'package:flutter/material.dart';
import 'package:girls_care/common/di/injection.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/presentation/start/splash/splash_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await configureDependencies();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => LoginProvider()),
    ChangeNotifierProvider(create: (_) => RegisterProvider()),
  ], child: MyApp()));
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
