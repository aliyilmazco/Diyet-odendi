import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FoodsModel extends ChangeNotifier {
  List<String> foodsTitles;
  String foodsName;
  String foodsCalorie;
  List<QueryDocumentSnapshot<Object?>> object;
  int count = 0;
  String selectedValue;
  String selectedValue2;
  List<Text> menuItems1;
  List<Text> menuItems2;
  FoodsModel({
    required this.menuItems1,
    required this.menuItems2,
    required this.selectedValue,
    required this.selectedValue2,
    required this.foodsCalorie,
    required this.foodsName,
    required this.foodsTitles,
    required this.object,
  });

  Future<void> setFoods({
    required List<QueryDocumentSnapshot<Object?>> object,
  }) async {
    this.object = object;
    foodsTitlesFunction();
    notifyListeners();
  }

  foodsTitlesFunction() {
    foodsTitles = [];
    for (int i = 0; i < object.length; i++) {
      Map<String, dynamic>? cerealMap =
          object[i].data() as Map<String, dynamic>?;
      if (cerealMap != null) {
        String cerealKey = cerealMap.keys.first;
        foodsTitles.add(cerealKey);
      }
    }
    notifyListeners();
  }

  foodsCalorieFunction() {
    foodsCalorie = object[0].get('calorie');
    notifyListeners();
  }

  counterIncrease() {
    if (count < 51) {
      count++;
    }

    notifyListeners();
  }

  counterDecrease() {
    if (count > 0) {
      count--;
    }

    notifyListeners();
  }
}
