import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constant/color_constant.dart';

class LoginTitleWidget extends StatelessWidget {
  const LoginTitleWidget({
    super.key,
    required this.smallText,
    required this.bigText,
  });
  final String smallText;
  final String bigText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          smallText,
          style: GoogleFonts.raleway(
              color: ColorConst.sliderTitle,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          bigText,
          style: GoogleFonts.raleway(
              color: ColorConst.sliderTitle,
              fontSize: 30,
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
