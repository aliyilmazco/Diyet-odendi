import 'package:d/core/base/view/base_view.dart';
import 'package:d/core/constant/color_constant.dart';
import 'package:d/product/widget/home/home_card_widget.dart';
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
                padding: EdgeInsets.only(top: height / 50, right: width / 2.2),
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
                height: 5,
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
                            color: ColorConst.createPageText,
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
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
                  height: height / 2.3,
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
                      HomeCardWidget(
                        width: width,
                        height: height,
                        image: 'assets/svg/avocado.svg',
                        foodNumber: '2 Large',
                        foodText: 'Egg',
                        foodCalorie: '143',
                      ),
                      HomeCardWidget(
                        width: width,
                        height: height,
                        image: 'assets/svg/egg.svg',
                        foodNumber: '1 Medium',
                        foodText: 'Avocado',
                        foodCalorie: '240',
                      ),
                      HomeCardWidget(
                        width: width,
                        height: height,
                        image: 'assets/svg/toast.svg',
                        foodNumber: '1 Slice',
                        foodText: 'Whole Grain Toast',
                        foodCalorie: '100',
                      ),
                      const Spacer(),
                      Container(
                        width: height / 2.3,
                        height: 40,
                        color: ColorConst.mainBoxBottomColor,
                        child: Center(
                          child: Text(
                            'Net Carbs: 16%  Fat 66%  Protein 23%',
                            style: GoogleFonts.glory(
                              color: ColorConst.createPageText,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      'Yaklasan Gorusme',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.raleway(
                        fontSize: 17,
                        color: ColorConst.createPageText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
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
                  height: height / 15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          shadowColor: ColorConst.mainBoxBorder,
                          elevation: 3,
                          clipBehavior: Clip.hardEdge,
                          child: Container(
                            color: ColorConst.mainBoxBorder,
                            width: width / 7,
                            height: height / 18,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '12',
                                  style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Tue',
                                  style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '09:30 AM',
                            style: GoogleFonts.glory(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Dr.Ali',
                            style: GoogleFonts.glory(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
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
