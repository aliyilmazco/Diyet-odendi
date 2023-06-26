import 'package:d/core/base/view/base_view.dart';
import 'package:d/core/constant/color_constant.dart';
import 'package:d/view/home/recipe/model/recipe_model.dart';
import 'package:d/view/home/recipe/viewmodel/recipe_detail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RecipeDetailView extends RecipeDetailViewModel {
  const RecipeDetailView({Key? key}) : super(key: key);

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
            title: Text(
              Provider.of<RecipeModel>(context, listen: false).recipeName[
                  Provider.of<RecipeModel>(context, listen: false)
                      .selectedIndex]!,
              style: GoogleFonts.raleway(
                color: ColorConst.sliderTitle,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  height: height / 1.35,
                  width: width,
                  decoration: const BoxDecoration(
                    color: ColorConst.mainBoxBg,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: height / 10,
                        ),
                        Text(
                          Provider.of<RecipeModel>(context, listen: false)
                                  .recipeName[
                              Provider.of<RecipeModel>(context, listen: false)
                                  .selectedIndex]!,
                          style: GoogleFonts.khula(
                            color: ColorConst.createPageText,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            Provider.of<RecipeModel>(context, listen: false)
                                    .recipeSteps[
                                Provider.of<RecipeModel>(context, listen: false)
                                    .selectedIndex]!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: ColorConst.createPageText,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Malzemeler',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorConst.createPageText,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            Provider.of<RecipeModel>(context, listen: false)
                                    .ingredients[
                                Provider.of<RecipeModel>(context, listen: false)
                                    .selectedIndex]!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: ColorConst.createPageText,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  width: width / 1.5,
                  height: height / 5,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: Provider.of<RecipeModel>(context).recipeImages[
                                  Provider.of<RecipeModel>(context,
                                          listen: false)
                                      .recipeNumber] !=
                              null
                          ? NetworkImage(Provider.of<RecipeModel>(context)
                                  .recipeImages[
                              Provider.of<RecipeModel>(context, listen: false)
                                  .selectedIndex]!) as ImageProvider<Object>
                          : const AssetImage('assets/images/profile.png'),
                      fit: BoxFit.fitWidth,
                    ),
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
