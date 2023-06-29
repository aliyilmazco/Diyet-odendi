// ignore_for_file: avoid_print

import 'package:d/core/base/view/base_view.dart';
import 'package:d/core/constant/color_constant.dart';
import 'package:d/product/router/router_constant.dart';
import 'package:d/view/home/recipe/model/recipe_model.dart';
import 'package:d/view/home/recipe/viewmodel/recipe_viewmodel.dart';
import 'package:d/view/home/target/model/diyetList_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RecipeView extends StatefulWidget {
  const RecipeView({super.key});

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends RecipeViewModel {
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
                padding: EdgeInsets.only(top: 5, right: width / 3.4),
                child: Text(
                  'Saglikli Tariflerim',
                  style: GoogleFonts.glory(
                    color: ColorConst.createPageText,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: height / 1.5,
                width: width,
                child: ListView.builder(
                  itemCount: Provider.of<RecipeModel>(context, listen: false)
                      .recipeNumber,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.pushNamed(RouteConstants.recipeDetail);
                        Provider.of<RecipeModel>(context, listen: false)
                            .selectedIndex = index;
                        Provider.of<DiyetListModel>(context, listen: false)
                            .getDayList();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  height: 200,
                                  width: width,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(20)),
                                    image: DecorationImage(
                                      image: Provider.of<RecipeModel>(context)
                                                  .recipeImages[index] !=
                                              null
                                          ? NetworkImage(
                                                  Provider.of<RecipeModel>(
                                                          context)
                                                      .recipeImages[index]!)
                                              as ImageProvider<Object>
                                          : const AssetImage(
                                              'assets/images/profile.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Provider.of<RecipeModel>(context,
                                              listen: false)
                                          .recipeName[index]!,
                                      style: GoogleFonts.glory(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      Provider.of<RecipeModel>(context,
                                              listen: false)
                                          .recipeName[index]!,
                                      style: GoogleFonts.glory(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15.0, left: 10),
                                          child: Text(
                                            '${Provider.of<RecipeModel>(context, listen: false).calories[index]!} kcal',
                                            style: GoogleFonts.glory(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: Image.asset(
                                              'assets/images/hearth.png'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
