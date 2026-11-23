import 'package:contact_app/core/app_routes.dart';
import 'package:contact_app/core/theme/app_theme_manager.dart';
import 'package:contact_app/feature/home/pages/home_page.dart';
import 'package:contact_app/feature/splash/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeManager.getThemeData(),
      initialRoute: AppRoutes.splashRoute,
      routes: {
        AppRoutes.splashRoute : (context) => const SplashPage(),
        AppRoutes.homeRoute : (context) => const HomePage(),
      },
    );
  }
}
