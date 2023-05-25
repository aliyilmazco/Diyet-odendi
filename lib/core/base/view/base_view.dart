import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  final Widget Function(
      BuildContext context, double width, double height, AppBar appBar) builder;
  // final AppBar? appBar;

  const BaseView({super.key, required this.builder});

  static MediaQueryData _mediaQueryData = const MediaQueryData();
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static AppBar? appbar = AppBar(
    backgroundColor: Colors.amber,
    title: Center(
      child: SizedBox(
        width: screenWidth / 1.4,
        child: Image.asset('assets/images/header.png'),
      ),
    ),
  );

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    appbar = appbar;
  }

  @override
  Widget build(BuildContext context) {
    init(context);
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: const Color(0xFF121111),
        child: builder(context, screenWidth, screenHeight, appbar!),
      ),
    );
  }
}
