import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FoodsModel extends ChangeNotifier {
  List<String> foodsTitles;
  String foodsName;
  String foodsCalorie;
  List<QueryDocumentSnapshot<Object?>> object;
  FoodsModel({
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
}
