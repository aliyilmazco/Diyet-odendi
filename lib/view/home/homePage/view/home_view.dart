// ignore_for_file: unnecessary_null_comparison

import 'package:d/core/base/view/base_view.dart';
import 'package:d/core/constant/color_constant.dart';
import 'package:d/product/widget/home/home_card_widget.dart';
import 'package:d/view/auth/signup/model/sign_up_model.dart';

import 'package:d/view/home/homePage/viewmodel/home_viewmodel.dart';
import 'package:d/view/home/target/model/diyetList_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Hosgeldin',
                    style: GoogleFonts.glory(
                      color: ColorConst.createPageText,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    Provider.of<UserModelProvider>(context, listen: false)
                        .fullName,
                    style: GoogleFonts.glory(
                      color: ColorConst.createPageText,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
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
                      height: height / 13,
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          motivation.toUpperCase(),
                          style: GoogleFonts.glory(
                            color: ColorConst.createPageText,
                            fontSize: motivation.length > 20 ? 17 : 30,
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
                                  'assets/images/${Provider.of<DiyetListModel>(context).homeViewOgun}.png',
                                  width: 90,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    Provider.of<DiyetListModel>(context)
                                        .homeViewOgun
                                        .toUpperCase(),
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
                                      'Tavsiye edilen $totalCaloriesValue Kcal',
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
                        image:
                            'assets/images/${Provider.of<DiyetListModel>(context).homeViewOgun}.png',
                        foodNumber: '${getSecondPart(
                          Provider.of<DiyetListModel>(context, listen: false)
                              .keyList[0],
                        )} Adet',
                        foodText: getFirstPart(
                          Provider.of<DiyetListModel>(context, listen: false)
                              .keyList[0],
                        ).toUpperCase(),
                        foodCalorie: calculateCalorie(
                          getSecondPart(Provider.of<DiyetListModel>(context,
                                  listen: false)
                              .keyList[0]),
                          Provider.of<DiyetListModel>(context, listen: false)
                              .valueList[0],
                        ),
                      ),
                      HomeCardWidget(
                        width: width,
                        height: height,
                        image:
                            'assets/images/${Provider.of<DiyetListModel>(context).homeViewOgun}.png',
                        foodNumber: '${getSecondPart(
                          Provider.of<DiyetListModel>(context).keyList[1],
                        )} Adet',
                        foodText: getFirstPart(
                          Provider.of<DiyetListModel>(context).keyList[1],
                        ).toUpperCase(),
                        foodCalorie: calculateCalorie(
                          getSecondPart(
                            Provider.of<DiyetListModel>(context).keyList[1],
                          ),
                          Provider.of<DiyetListModel>(context).valueList[1],
                        ),
                      ),
                      Provider.of<DiyetListModel>(context).keyList[2] != null
                          ? HomeCardWidget(
                              width: width,
                              height: height,
                              image:
                                  'assets/images/${Provider.of<DiyetListModel>(context).homeViewOgun}.png',
                              foodNumber: '${getSecondPart(
                                Provider.of<DiyetListModel>(context).keyList[2],
                              )} Adet',
                              foodText: getFirstPart(
                                Provider.of<DiyetListModel>(context).keyList[2],
                              ).toUpperCase(),
                              foodCalorie: calculateCalorie(
                                  getSecondPart(
                                    Provider.of<DiyetListModel>(context)
                                        .keyList[2],
                                  ),
                                  Provider.of<DiyetListModel>(context)
                                      .valueList[2]),
                            )
                          : HomeCardWidget(
                              width: width,
                              height: height,
                              image:
                                  'assets/images/${Provider.of<DiyetListModel>(context).homeViewOgun}.png',
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
                            "Total : $totalCaloriesValue Kcal",
                            style: GoogleFonts.glory(
                              color: ColorConst.createPageText,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
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
                                  snapshotDate?.docs[selectedIndex]
                                          ['firstDay'] ??
                                      '1',
                                  style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  snapshotDate?.docs[selectedIndex]
                                          ['firstMonth'] ??
                                      'OCAK',
                                  style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Saat : ${snapshotDate?.docs[selectedIndex]['confirmedDate'] ?? '12:00'}",
                              style: GoogleFonts.glory(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'Diyetisyen : ${snapshotDate?.docs[selectedIndex]['isConfirmed'] == 'true' ? 'Aleyna Akman' : 'Onaylanmadi'}',
                              style: GoogleFonts.glory(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
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
