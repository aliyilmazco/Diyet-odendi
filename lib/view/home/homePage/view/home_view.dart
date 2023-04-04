import 'package:d/core/base/view/base_view.dart';
import 'package:d/core/constant/color_constant.dart';
import 'package:d/view/home/homePage/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
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
                  Text(
                    "ASLA PES ETME",
                    style: GoogleFonts.glory(
                      color: ColorConst.sliderTitle,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
