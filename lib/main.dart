import 'package:flutter/material.dart';
import 'package:girls_care/common/di/injection.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/presentation/start/splash/splash_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Girl care',
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: context.colors.primary,
        scaffoldBackgroundColor: context.colors.window,
      ),
      home: const SplashPage(),
    );
  }
}
