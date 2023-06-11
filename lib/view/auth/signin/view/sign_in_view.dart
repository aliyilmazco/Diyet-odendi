import 'package:d/core/base/view/base_view.dart';
import 'package:d/product/router/router_constant.dart';
import 'package:d/product/widget/login/login_title_widget.dart';
import 'package:d/view/auth/signin/viewmodel/sign_in_viewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constant/color_constant.dart';
import '../../../../product/widget/login/login_button_widget.dart';
import '../../../../product/widget/login/login_textfield_widget.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends SignInViewModel {
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
                        mainAxisAlignment: MainAxisAlignment.start,
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
                                padding: const EdgeInsets.only(left: 20.0),
                                child: SvgPicture.asset(
                                  'assets/svg/login.svg',
                                  width: width / 1.6,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          LoginTextfieldWidget(
                            labelText: "Email",
                            hintText: "Enter Email",
                            showSuffix: false,
                            controller: controller1,
                            functionCallBack: (value) {
                              setState(() {
                                email = value;
                                print(email);
                              });
                            },
                            validator: (value) {
                              return RegExp(
                                          r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                      .hasMatch(value!)
                                  ? null
                                  : "Enter a valid email";
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          LoginTextfieldWidget(
                            labelText: "Password",
                            hintText: "Enter Password",
                            showSuffix: true,
                            controller: controller2,
                            functionCallBack: (value) {
                              setState(() {
                                password = value;
                                print(password);
                              });
                            },
                            validator: (value) {
                              return value!.length > 6
                                  ? null
                                  : "Enter a password 6+ chars long";
                            },
                          ),
                          const SizedBox(
                            height: 10,
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
                            text: "Giris",
                            backgroundColor: ColorConst.sliderTitle,
                            textColor: ColorConst.appBgColorWhite,
                            borderColor: ColorConst.sliderTitle,
                            function: () {
                              login();
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          RichText(
                            text: TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.pushReplacementNamed(
                                      RouteConstants.singUp);
                                },
                              text: 'Hesabin yok mu? ',
                              style: GoogleFonts.raleway(
                                color: ColorConst.noAccountText,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.pushReplacementNamed(
                                          RouteConstants.singUp);
                                    },
                                  text: ' Kayit Ol',
                                  style: GoogleFonts.raleway(
                                    color: ColorConst.sliderTitle,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          )
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
