import 'package:d/product/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../view/splash_screen_view.dart';

abstract class SplashScreenViewModel extends State<SplashScreenView> {
  bool isLoggedIn = false;
  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
    if (isLoggedIn) {
      Future.delayed(const Duration(seconds: 3), () async {
        context.pushReplacement('/main');
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () async {
        context.pushReplacement('/slider');
      });
    }
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value) {
      if (value) {
        setState(() {
          isLoggedIn = value;
        });
      }
    });
  }
}
