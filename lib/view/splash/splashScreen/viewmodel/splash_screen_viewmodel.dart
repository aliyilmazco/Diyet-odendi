import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../view/splash_screen_view.dart';

abstract class SplashScreenViewModel extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      context.pushReplacement('/slider');
    });
  }
}
