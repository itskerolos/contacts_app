import 'package:contact_app/core/app_routes.dart';
import 'package:flutter/material.dart';

import '../../../core/gen/assets.gen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed( Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoute);
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Assets.images.logoImg.image()),
    );
  }
}
