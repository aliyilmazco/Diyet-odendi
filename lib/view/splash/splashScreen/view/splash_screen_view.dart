import 'package:d/core/base/view/base_view.dart';
import 'package:d/core/constant/color_constant.dart';
import 'package:d/view/splash/splashScreen/viewmodel/splash_screen_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends SplashScreenViewModel {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      builder: (context, width, height, appBar) {
        return Scaffold(
          backgroundColor: ColorConst.appBgColorWhite,
          body: Center(
            child: Container(
              child: Lottie.asset('assets/animations/splash.json'),
            ),
          ),
        );
      },
    );
  }
}
