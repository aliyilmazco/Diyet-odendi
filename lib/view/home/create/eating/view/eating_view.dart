import 'package:d/core/base/view/base_view.dart';
import 'package:d/core/constant/color_constant.dart';
import 'package:d/product/widget/create/dropdown_widget.dart';
import 'package:d/view/home/create/eating/viewmodel/eating_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EatingView extends StatefulWidget {
  const EatingView({super.key});

  @override
  State<EatingView> createState() => _EatingViewState();
}

class _EatingViewState extends EatingViewModel {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      builder: (context, width, height, appBar) {
        return Scaffold(
          backgroundColor: ColorConst.appBgColorWhite,
          appBar: AppBar(
            centerTitle: true,
            shadowColor: Colors.transparent,
            foregroundColor: ColorConst.createPageText,
            backgroundColor: Colors.transparent,
            title: Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: Center(
                child: Text(
                  'OGUNLAR',
                  style: GoogleFonts.raleway(
                    color: ColorConst.sliderTitle,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          body: Center(
            child: Column(
              children: [
                Form(
                  key: dropdownFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      DropDownWidget(
                        selectedValue: selectedValue,
                        width: width,
                        items: dropdownItems,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      DropDownWidget(
                        selectedValue: selectedValue,
                        width: width,
                        items: dropdownItems2,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: width * 0.4,
                      height: 45,
                      decoration: BoxDecoration(
                        color: ColorConst.mainBoxBg,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.remove,
                            ),
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          Center(
                            child: Text(
                              '1',
                              style: GoogleFonts.raleway(
                                color: ColorConst.createPageText,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                            ),
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConst.createButton,
                        shadowColor: Colors.black.withOpacity(0.7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Ekle',
                        style: GoogleFonts.raleway(
                          color: ColorConst.createPageText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConst.createButton,
                        shadowColor: Colors.black.withOpacity(0.7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Cikar',
                        style: GoogleFonts.raleway(
                          color: ColorConst.createPageText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: width / 1.15,
                  height: height / 4,
                  decoration: BoxDecoration(
                    color: ColorConst.mainBoxBg,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Kahvalti',
                            style: GoogleFonts.raleway(
                              color: ColorConst.createPageText,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '1',
                            style: GoogleFonts.raleway(
                              color: ColorConst.createPageText,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Ogle',
                            style: GoogleFonts.raleway(
                              color: ColorConst.createPageText,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '1',
                            style: GoogleFonts.raleway(
                              color: ColorConst.createPageText,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Aksam',
                            style: GoogleFonts.raleway(
                              color: ColorConst.createPageText,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '1',
                            style: GoogleFonts.raleway(
                              color: ColorConst.createPageText,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Ara Ogun',
                            style: GoogleFonts.raleway(
                              color: ColorConst.createPageText,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '1',
                            style: GoogleFonts.raleway(
                              color: ColorConst.createPageText,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Toplam Kalori: 1000',
                  style: GoogleFonts.raleway(
                    color: ColorConst.createPageText,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(width / 1.5, 40),
                    backgroundColor: ColorConst.createButton,
                    shadowColor: Colors.black.withOpacity(0.7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Kaydet',
                    style: GoogleFonts.raleway(
                      color: ColorConst.createPageText,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
