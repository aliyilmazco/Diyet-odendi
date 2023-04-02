import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constant/color_constant.dart';

class LoginButtonWidget extends StatelessWidget {
  LoginButtonWidget({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.borderColor,
    required this.function,
  });
  final double width;
  final double height;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          backgroundColor,
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          ColorConst.appBgColorWhite,
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(6.0),
            ),
            side: BorderSide(
              color: borderColor,
              width: 1,
            ),
          ),
        ),
        shadowColor: MaterialStateProperty.all<Color>(
          ColorConst.sliderTitle,
        ),
        fixedSize: MaterialStateProperty.all<Size>(
          Size(width / 1.1, 40),
        ),
      ),
      onPressed: function,
      child: Text(
        text,
        style: GoogleFonts.raleway(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}
