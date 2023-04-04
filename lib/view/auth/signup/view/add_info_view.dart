import 'package:d/core/base/view/base_view.dart';
import 'package:d/product/widget/create/selection_card_widget.dart';
import 'package:d/view/auth/signup/viewmodel/add_info_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/color_constant.dart';

class AddInfoView extends StatefulWidget {
  const AddInfoView({super.key});

  @override
  State<AddInfoView> createState() => _AddInfoViewState();
}

class _AddInfoViewState extends AddInfoViewModel {
  bool isSelectedGender = false;
  double boy = 150;
  double kilo = 70;
  @override
  Widget build(BuildContext context) {
    return BaseView(
      builder: (context, width, height, appBar) {
        return Scaffold(
          backgroundColor: ColorConst.appBgColorWhite,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height / 10,
              ),
              Padding(
                padding: EdgeInsets.only(right: width / 4),
                child: Text(
                  textAlign: TextAlign.end,
                  'Bilgilerinizi Giriniz!',
                  style: GoogleFonts.dmSans(
                    color: ColorConst.createPageText,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: height / 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SelectionGenderCardWidget(
                    svgRoot: 'assets/svg/man.svg',
                    cardText: 'Erkek',
                    isSelected: isSelectedGender,
                    function: () {
                      setState(
                        () {
                          isSelectedGender = !isSelectedGender;
                        },
                      );
                    },
                  ),
                  SelectionGenderCardWidget(
                    svgRoot: 'assets/svg/woman.svg',
                    cardText: 'Kadin',
                    isSelected: !isSelectedGender,
                    function: () {
                      setState(
                        () {
                          isSelectedGender = !isSelectedGender;
                        },
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: height / 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width / 10),
                        child: Text(
                          'Boy',
                          style: GoogleFonts.raleway(
                            color: ColorConst.createPageText,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      SliderTheme(
                        data: const SliderThemeData(
                          inactiveTrackColor: Colors.black,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 13),
                          trackHeight: 0.5,
                          overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 30.0,
                          ),
                          showValueIndicator: ShowValueIndicator.always,
                          valueIndicatorColor: ColorConst.menBoxGrey,
                          valueIndicatorTextStyle: TextStyle(
                            color: ColorConst.createPageText,
                          ),
                        ),
                        child: Slider(
                          min: 20,
                          max: 250,
                          label: "Boy: ${boy.round().toString()}",
                          activeColor: ColorConst.sliderInActive,
                          inactiveColor: ColorConst.sliderInActive,
                          thumbColor: ColorConst.menBoxGrey,
                          value: boy,
                          onChanged: (value) {
                            setState(
                              () {
                                boy = value;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width / 10),
                        child: Text(
                          'Kilo',
                          style: GoogleFonts.raleway(
                            color: ColorConst.createPageText,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: const SliderThemeData(
                      inactiveTrackColor: Colors.black,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13),
                      trackHeight: 0.5,
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                      showValueIndicator: ShowValueIndicator.always,
                      valueIndicatorColor: ColorConst.menBoxGrey,
                      valueIndicatorTextStyle: TextStyle(
                        color: ColorConst.createPageText,
                      ),
                    ),
                    child: Slider(
                      min: 20,
                      max: 350,
                      label: "Kilo: ${kilo.round().toString()}",
                      activeColor: ColorConst.sliderInActive,
                      inactiveColor: ColorConst.sliderInActive,
                      thumbColor: ColorConst.menBoxGrey,
                      value: kilo,
                      onChanged: (value) {
                        setState(
                          () {
                            kilo = value;
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: width / 1.4, top: height / 7),
                child: FloatingActionButton(
                  backgroundColor: ColorConst.createPageText,
                  onPressed: () {
                    context.pushReplacement('/main');
                  },
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
