import 'package:flutter/material.dart';

abstract class RecipeDetailViewModel extends StatelessWidget {
  const RecipeDetailViewModel({super.key});

  String recipeDetailText(int number) {
    if (number == 0) {
      return '1 Yumurta';
    } else if (number == 1) {
      return '1 Yemek Kaşığı Tereyağı';
    } else if (number == 2) {
      return ' 20 Gr Beyaz Peynir';
    } else if (number == 3) {
      return ' 5 Zeytin';
    } else if (number == 4) {
      return ' 1 Dilim Tam Buğday Ekmek';
    } else {
      return '1 Kase Salatalik';
    }
  }
}
