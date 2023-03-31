import 'package:d/core/constant/color_constant.dart';
import 'package:d/product/router/router_constant.dart';
import 'package:d/view/splash/splashScreen/view/splash_screen_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SliderView extends StatefulWidget {
  const SliderView({super.key});

  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: 'Register',
      onFinish: () {
        context.pushReplacement('/signUp');
      },
      finishButtonStyle: const FinishButtonStyle(
        backgroundColor: ColorConst.sliderTitle,
      ),
      skipTextButton: const Text(
        'Skip',
        style: TextStyle(
          fontSize: 16,
          color: ColorConst.sliderText,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: const Text(
        'Login',
        style: TextStyle(
          fontSize: 16,
          color: ColorConst.sliderText,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailingFunction: () {
        context.pushReplacementNamed(RouteConstants.signIn);
      },
      controllerColor: ColorConst.appBgColorWhite,
      totalPage: 3,
      headerBackgroundColor: Colors.white,
      pageBackgroundColor: Colors.white,
      background: [
        Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
          ),
          child: SvgPicture.asset(
            'assets/svg/slider_1.svg',
            height: MediaQuery.of(context).size.width / 1.2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
            left: 30,
          ),
          child: SvgPicture.asset(
            'assets/svg/slider_2.svg',
            height: MediaQuery.of(context).size.width / 1.3,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 25),
          child: SvgPicture.asset(
            'assets/svg/slider_3.svg',
            height: MediaQuery.of(context).size.width / 1.3,
          ),
        ),
      ],
      speed: 1.8,
      pageBodies: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'Lorem Title...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorConst.sliderTitle,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Lorem ipsum dolor sit amet consectetur adipiscing, elit ac feugiat tortor luctus facilisi, nam inceptos maecenas venenatis et. ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorConst.sliderText,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'Lorem Title.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorConst.sliderTitle,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Lorem ipsum dolor sit amet consectetur adipiscing, elit ac feugiat tortor luctus facilisi, nam inceptos maecenas venenatis et. ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorConst.sliderText,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'Start now!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorConst.sliderTitle,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Lorem ipsum dolor sit amet consectetur adipiscing, elit ac feugiat tortor luctus facilisi, nam inceptos maecenas venenatis et. .',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorConst.sliderText,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
