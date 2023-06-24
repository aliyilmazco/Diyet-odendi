// ignore_for_file: avoid_print

import 'package:d/core/base/view/base_view.dart';
import 'package:d/product/router/router_constant.dart';
import 'package:d/product/widget/login/login_textfield_widget.dart';
import 'package:d/product/widget/login/login_title_widget.dart';
import 'package:d/view/auth/signup/viewmodel/sign_up_viewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/color_constant.dart';
import '../../../../product/widget/login/login_button_widget.dart';

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
          body: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                )
              : SingleChildScrollView(
                  child: Center(
                    child: Form(
                      key: formKey,
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
                            functionCallBack: (value) {
                              setState(
                                () {
                                  fullName = value;
                                  print(fullName);
                                },
                              );
                            },
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                return null;
                              } else {
                                return "Lutfen isim giriniz!";
                              }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          LoginTextfieldWidget(
                            labelText: 'Email',
                            hintText: "Email Giriniz",
                            showSuffix: false,
                            functionCallBack: (value) {
                              setState(
                                () {
                                  email = value;
                                  print(email);
                                },
                              );
                            },
                            validator: (value) {
                              return RegExp(
                                          r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                      .hasMatch(value!)
                                  ? null
                                  : "Dogru email giriniz!";
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          LoginTextfieldWidget(
                            labelText: 'Sifre',
                            hintText: "Sifre Giriniz",
                            showSuffix: true,
                            functionCallBack: (value) {
                              setState(
                                () {
                                  password = value;
                                  print(password);
                                },
                              );
                            },
                            validator: (value) {
                              return value!.length > 6
                                  ? null
                                  : "6 Karakterden uzun sifre giriniz!";
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          LoginTextfieldWidget(
                            labelText: 'Sifre Onay',
                            hintText: "Sifre Giriniz",
                            showSuffix: true,
                            validator: (value) {
                              return value! == password
                                  ? null
                                  : "Sifreler eslesmiyor";
                            },
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
                              register();
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
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.pushReplacementNamed(
                                          RouteConstants.signIn);
                                    },
                                  text: 'Giris Yap',
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
                ),
        );
      },
    );
  }
}
