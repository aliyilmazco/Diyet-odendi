import 'package:d/core/base/view/base_view.dart';
import 'package:d/core/constant/color_constant.dart';
import 'package:d/view/home/recipe/viewmodel/recipe_detail_viewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeDetailView extends RecipeDetailViewModel {
  const RecipeDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      builder: (context, width, height, appBar) {
        return Scaffold(
          backgroundColor: ColorConst.appBgColorWhite,
          appBar: AppBar(
            shadowColor: Colors.transparent,
            foregroundColor: ColorConst.createPageText,
            backgroundColor: Colors.transparent,
            title: Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: Center(
                child: Text(
                  'Settings',
                  style: GoogleFonts.raleway(
                    color: ColorConst.sliderTitle,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          body: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  height: height / 1.5,
                  width: width,
                  decoration: const BoxDecoration(
                    color: ColorConst.mainBoxBg,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height / 10,
                      ),
                      Text(
                        'Ricotta & Yogurt Parfait',
                        style: GoogleFonts.khula(
                          color: ColorConst.createPageText,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: height / 20,
                      ),
                      for (int i = 0; i < 5; i++)
                        RichText(
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            text: '-  ',
                            style: GoogleFonts.raleway(
                              color: ColorConst.createPageText,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                                text: recipeDetailText(i),
                                style: GoogleFonts.raleway(
                                  color: ColorConst.createPageText,
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
              Positioned(
                top: 60,
                right: 0,
                child: Container(
                  width: width / 1.6,
                  height: height / 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset(
                    'assets/images/meal.png',
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
