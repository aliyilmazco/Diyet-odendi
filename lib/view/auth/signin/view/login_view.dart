import 'package:d/core/base/view/base_view.dart';
import 'package:d/core/constant/color_constant.dart';
import 'package:d/product/widget/login_button_widget.dart';
import 'package:d/product/widget/login_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      builder: (context, width, height, appBar) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: height / 10,
                ),
                const LoginTitleWidget(
                  smallText: 'DIYETISYENE',
                  bigText: 'HOSGELDINIZ',
                ),
                SvgPicture.asset(
                  'assets/svg/login.svg',
                  width: width / 1.3,
                ),
                SizedBox(
                  height: height / 10,
                ),
                LoginButtonWidget(
                  width: width,
                  height: height,
                  text: "Kayit Ol",
                  backgroundColor: ColorConst.sliderTitle,
                  textColor: ColorConst.appBgColorWhite,
                  borderColor: ColorConst.sliderTitle,
                  function: () {},
                ),
                LoginButtonWidget(
                  width: width,
                  height: height,
                  text: "Giris",
                  backgroundColor: ColorConst.appBgColorWhite,
                  textColor: ColorConst.sliderTitle,
                  borderColor: ColorConst.sliderTitle,
                  function: () {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
