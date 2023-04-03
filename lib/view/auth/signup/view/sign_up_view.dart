import 'package:d/core/base/view/base_view.dart';
import 'package:d/product/widget/login_textfield_widget.dart';
import 'package:d/product/widget/login_title_widget.dart';
import 'package:d/view/auth/signup/viewmodel/sign_up_viewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/color_constant.dart';
import '../../../../product/widget/login_button_widget.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends SignUpViewModel {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      builder: (context, width, height, appBar) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: height / 10,
                  ),
                  Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      const LoginTitleWidget(
                        smallText: 'DIYETISYENE',
                        bigText: 'HOSGELDINIZ',
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width / 6),
                        child: SvgPicture.asset(
                          'assets/svg/login.svg',
                          width: width / 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  LoginTextfieldWidget(
                    labelText: 'Tum Isim',
                    hintText: "Isim Giriniz",
                    showSuffix: false,
                    controller: controller1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  LoginTextfieldWidget(
                    labelText: 'Email',
                    hintText: "Email Giriniz",
                    showSuffix: false,
                    controller: controller2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  LoginTextfieldWidget(
                    labelText: 'Sifre',
                    hintText: "Sifre Giriniz",
                    showSuffix: true,
                    controller: controller3,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  LoginTextfieldWidget(
                    labelText: 'Sifre Onay',
                    hintText: "Sifre Giriniz",
                    showSuffix: true,
                    controller: controller4,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          textAlign: TextAlign.end,
                          "Sifremi Unuttum?",
                          style: GoogleFonts.raleway(
                            fontSize: 15,
                            color: ColorConst.sliderTitle,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  LoginButtonWidget(
                    width: width,
                    height: height,
                    text: "Kayit Ol",
                    backgroundColor: ColorConst.sliderTitle,
                    textColor: ColorConst.appBgColorWhite,
                    borderColor: ColorConst.sliderTitle,
                    function: () {
                      context.pushReplacement("/welcome");
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      text: 'Zaten bir hesabin var mi? ',
                      style: GoogleFonts.raleway(
                        color: ColorConst.noAccountText,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: ' Kayit Ol',
                          style: GoogleFonts.raleway(
                            color: ColorConst.sliderTitle,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
