// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class FoodsModel extends ChangeNotifier {
  List<String> foodsTitles;
  String foodsName;
  String foodsCalorie;
  List<QueryDocumentSnapshot<Object?>> object;
  int count = 1;
  String selectedValue;
  String selectedValue2;
  List<DropdownMenuItem<String>>? menuItems1;
  List<DropdownMenuItem<String>>? menuItems2;
  List<Widget> widgetList = [];
  int total = 0;
  List<Map<String, dynamic>> object2;
  String selectedOgun = 'dairies';
  String calorie = '0';
  FoodsModel({
    required this.menuItems1,
    required this.menuItems2,
    required this.selectedValue,
    required this.selectedValue2,
    required this.foodsCalorie,
    required this.foodsName,
    required this.foodsTitles,
    required this.object,
    required this.object2,
  });

  getFoods({
    required List<Map<String, dynamic>> listFoods,
  }) {
    object2 = listFoods;

    for (var foodMap in listFoods) {
      var foodNames = foodMap.values.toList();
      print('foodValues: $foodNames');
    }

    notifyListeners();
  }

  getFoodsNamesNumber() {
    List<String> foodNames = [];
    for (var foodMap in object2) {
      foodNames = foodMap.keys.toList();
    }
    return foodNames.length;
  }

  getFoodNames(int number) {
    List<String> foodNames = [];
    for (var foodMap in object2) {
      foodNames = foodMap.keys.toList();
    }

    return foodNames[number];
  }

  updateSelectedFood(String selectedFood) {
    selectedOgun = selectedFood;
    notifyListeners();
  }

  getSecondFoodNames(String selectedFood, int number) {
    Map<String, dynamic>? dairiesMap;
    List<dynamic> values = [];
    for (Map<String, dynamic> data in object2) {
      if (data.containsKey(selectedFood)) {
        dairiesMap = data[selectedFood];
        break;
      }
    }
    if (dairiesMap != null) {
      values = dairiesMap.keys.toList();
    }

    return values[number];
  }

  getSecondFoodValues(String selectedFood, int number) {
    Map<String, dynamic>? dairiesMap;
    List<dynamic> values = [];
    for (Map<String, dynamic> data in object2) {
      if (data.containsKey(selectedFood)) {
        dairiesMap = data[selectedFood];
        break;
      }
    }
    if (dairiesMap != null) {
      values = dairiesMap.values.toList();
    }
    print('selected food: $selectedFood and number: $number');
    return values[number];
  }

  getSecondFoodNumber() {
    Map<String, dynamic>? dairiesMap;
    List<dynamic> values = [];
    for (Map<String, dynamic> data in object2) {
      if (data.containsKey(selectedOgun)) {
        dairiesMap = data[selectedOgun];
        break;
      }
    }
    if (dairiesMap != null) {
      values = dairiesMap.keys.toList();
    }
    print("second food number: ${values.length}");
    return values.length;
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

  void addToWidgetList(Widget widget) {
    for (int i = 0; i < count; i++) {
      widgetList.add(widget);
    }

    notifyListeners();
  }

  void getWidgetList(List<Widget> widgets) {
    for (var widget in widgets) {
      print(widget);
    }
  }

  void deleteWidgetList() {
    widgetList = [];
    notifyListeners();
  }

  addCalculateCalorie() {
    for (int i = 0; i < count; i++) {
      total += int.parse(calorie);
    }
    notifyListeners();
  }

  deleteCalculateCalorie() {
    total = 0;
    notifyListeners();
  }
}
