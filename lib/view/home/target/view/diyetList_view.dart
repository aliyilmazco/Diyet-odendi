// ignore_for_file: file_names, unnecessary_null_comparison

import 'package:d/core/base/view/base_view.dart';
import 'package:d/core/constant/color_constant.dart';
import 'package:d/product/widget/home/home_card_widget.dart';
import 'package:d/view/home/target/model/diyetList_model.dart';
import 'package:d/view/home/target/viewmodel/diyetList_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DiyetListView extends StatefulWidget {
  const DiyetListView({super.key});

  @override
  State<DiyetListView> createState() => _DiyetListViewState();
}

class _DiyetListViewState extends DiyetListViewModel {
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
                padding: const EdgeInsets.only(top: 10.0),
                child: Center(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                    decoration: BoxDecoration(
                      color: ColorConst.mainBoxBg,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    width: width / 1.15,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(30),
                      elevation: 2,
                      alignment: Alignment.center,
                      underline: Container(
                        height: 0,
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                        size: 30,
                      ),
                      value: selectedMenuItem,
                      dropdownColor: ColorConst.mainBoxBg,
                      onChanged: (value) {
                        setState(() {
                          selectedMenuItem = value;
                          Provider.of<DiyetListModel>(context, listen: false)
                              .total = 0;
                          Provider.of<DiyetListModel>(context, listen: false)
                              .getDayListByOgun(value!);
                        });
                        totalCaloriesValue = totalCalories();
                      },
                      items: menuItems
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Center(child: Text(value.toUpperCase())),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text(
                            Provider.of<DiyetListModel>(context)
                                .currentDayName
                                .toUpperCase(),
                            style: GoogleFonts.glory(
                              color: ColorConst.createPageText,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
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
                              height: height / 2,
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
                                            padding: const EdgeInsets.only(
                                                left: 20.0, top: 20),
                                            child: Image.asset(
                                              'assets/images/$selectedMenuItem.png',
                                              width: 90,
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                selectedMenuItem!.toUpperCase(),
                                                style: GoogleFonts.glory(
                                                  color:
                                                      ColorConst.createPageText,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0),
                                                child: Text(
                                                  'Tavsiye edilen $totalCaloriesValue Kcal',
                                                  style: GoogleFonts.glory(
                                                    color: ColorConst
                                                        .createPageText,
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
                                        'assets/images/$selectedMenuItem.png',
                                    foodNumber: '${getSecondPart(
                                      Provider.of<DiyetListModel>(context)
                                          .keyList2[0],
                                    )} Adet',
                                    foodText: getFirstPart(
                                      Provider.of<DiyetListModel>(context)
                                          .keyList2[0],
                                    ).toUpperCase(),
                                    foodCalorie: calculateCalorie(
                                      getSecondPart(
                                        Provider.of<DiyetListModel>(context)
                                            .keyList2[0],
                                      ),
                                      Provider.of<DiyetListModel>(context)
                                          .valueList2[0],
                                    ),
                                  ),
                                  HomeCardWidget(
                                    width: width,
                                    height: height,
                                    image:
                                        'assets/images/$selectedMenuItem.png',
                                    foodNumber: '${getSecondPart(
                                      Provider.of<DiyetListModel>(context)
                                          .keyList2[1],
                                    )} Adet',
                                    foodText: getFirstPart(
                                      Provider.of<DiyetListModel>(context)
                                          .keyList2[1],
                                    ).toUpperCase(),
                                    foodCalorie: calculateCalorie(
                                      getSecondPart(
                                        Provider.of<DiyetListModel>(context)
                                            .keyList2[1],
                                      ),
                                      Provider.of<DiyetListModel>(context)
                                          .valueList2[1],
                                    ),
                                  ),
                                  Provider.of<DiyetListModel>(context)
                                              .keyList2[1] !=
                                          null
                                      ? HomeCardWidget(
                                          width: width,
                                          height: height,
                                          image:
                                              'assets/images/$selectedMenuItem.png',
                                          foodNumber: '${getSecondPart(
                                            Provider.of<DiyetListModel>(context)
                                                .keyList2[2],
                                          )} Adet',
                                          foodText: getFirstPart(
                                            Provider.of<DiyetListModel>(context)
                                                .keyList2[2],
                                          ).toUpperCase(),
                                          foodCalorie: calculateCalorie(
                                              getSecondPart(
                                                Provider.of<DiyetListModel>(
                                                        context)
                                                    .keyList2[2],
                                              ),
                                              Provider.of<DiyetListModel>(
                                                      context)
                                                  .valueList2[2]),
                                        )
                                      : HomeCardWidget(
                                          width: width,
                                          height: height,
                                          image:
                                              'assets/images/$selectedMenuItem.png',
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
                                        "Total $totalCaloriesValue Kcal",
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
