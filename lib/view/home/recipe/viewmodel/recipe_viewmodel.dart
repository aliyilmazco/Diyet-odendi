import 'package:flutter/material.dart';

import '../view/recipe_view.dart';

abstract class RecipeViewModel extends State<RecipeView> {
  String imageCheck(int number) {
    if (number == 0) {
      return 'assets/svg/ana_ogun.svg';
    } else if (number == 1) {
      return 'assets/svg/avocado.svg';
    } else if (number == 2) {
      return 'assets/svg/ana_ogun.svg';
    } else if (number == 3) {
      return 'assets/svg/egg.svg';
    } else if (number == 4) {
      return 'assets/svg/ana_ogun.svg';
    } else if (number == 5) {
      return 'assets/svg/ana_ogun.svg';
    } else {
      return 'assets/svg/ana_ogun.svg';
    }
  }

  String textCheck(int number) {
    if (number == 0) {
      return 'Ana Ogun';
    } else if (number == 1) {
      return 'Atistirmalik';
    } else if (number == 2) {
      return 'Tatli';
    } else if (number == 3) {
      return 'Kahvalti';
    } else if (number == 4) {
      return 'Ara Ogun';
    } else if (number == 5) {
      return 'Ana Ogun';
    } else {
      return 'Ana Ogun';
    }
  }
}
