import 'package:d/core/base/view/base_view.dart';
import 'package:d/core/constant/color_constant.dart';
import 'package:d/view/home/homePage/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      builder: (context, width, height, appBar) {
        return Scaffold(
          backgroundColor: ColorConst.appBgColorWhite,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: height / 40, right: width / 2.2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hosgeldin',
                      style: GoogleFonts.glory(
                        color: ColorConst.createPageText,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Serdem',
                      style: GoogleFonts.glory(
                        color: ColorConst.createPageText,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    shadowColor: ColorConst.mainBoxBg,
                    elevation: 3,
                    clipBehavior: Clip.hardEdge,
                    child: Container(
                      color: ColorConst.mainBoxBg,
                      width: width / 1.2,
                      height: height / 18,
                      child: Center(
                        child: Text(
                          "Asla pes etme!",
                          style: GoogleFonts.glory(
                            color: ColorConst.sliderTitle,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                elevation: 3,
                shadowColor: ColorConst.mainBoxBg,
                clipBehavior: Clip.hardEdge,
                child: Container(
                  color: ColorConst.mainBoxBg,
                  width: width / 1.2,
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flex(
                            direction: Axis.horizontal,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20.0, top: 20),
                                child: Image.asset(
                                  'assets/images/breakfast.png',
                                  width: 90,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Kahvalti',
                                    style: GoogleFonts.glory(
                                      color: ColorConst.createPageText,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'Tavsiye edilen 365 - 535 Kcal',
                                      style: GoogleFonts.glory(
                                        color: ColorConst.createPageText,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        elevation: 3,
                        shadowColor: ColorConst.mainBoxBg,
                        clipBehavior: Clip.hardEdge,
                        child: Container(
                          width: width / 1.6,
                          height: height / 20,
                        ),
                      ),
                    ],
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
