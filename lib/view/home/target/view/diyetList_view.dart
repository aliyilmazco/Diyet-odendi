// ignore_for_file: file_names

import 'package:d/core/base/view/base_view.dart';
import 'package:d/core/constant/color_constant.dart';
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
                              .getDayListByOgun(value!);
                          Provider.of<DiyetListModel>(context, listen: false)
                              .getData();
                        });
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
              Text(
                selectedMenuItem!.toUpperCase(),
                style: GoogleFonts.glory(
                  color: ColorConst.createPageText,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: 165,
                          width: width,
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          child: Column(
                            children: [
                              for (int i = 0;
                                  i <
                                      Provider.of<DiyetListModel>(context)
                                          .keyList2
                                          .length;
                                  i++)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 50.0,
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        getFirstPart(
                                          Provider.of<DiyetListModel>(context)
                                              .keyList2[i],
                                        ),
                                        style: GoogleFonts.glory(
                                          color: ColorConst.createPageText,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        calculateCalorie(
                                            getSecondPart(
                                              Provider.of<DiyetListModel>(
                                                      context)
                                                  .keyList2[i],
                                            ),
                                            Provider.of<DiyetListModel>(context)
                                                .valueList2[i]),
                                        style: GoogleFonts.glory(
                                          color: ColorConst.createPageText,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
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
