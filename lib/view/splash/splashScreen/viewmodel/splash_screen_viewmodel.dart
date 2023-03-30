import 'package:d/view/splash/slider/view/slider_view.dart';
import 'package:flutter/material.dart';

import '../view/splash_screen_view.dart';

abstract class SplashScreenViewModel extends State<SplashScreenView> {
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SliderView()));
    });
  }
}
