// ignore_for_file: avoid_print

import 'package:d/view/home/recipe/model/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view/recipe_view.dart';

abstract class RecipeViewModel extends State<RecipeView> {
  @override
  void initState() {
    super.initState();
    Provider.of<RecipeModel>(context, listen: false).getRecipe();
    Provider.of<RecipeModel>(context, listen: false).getRecipeNumber();
  }
}
