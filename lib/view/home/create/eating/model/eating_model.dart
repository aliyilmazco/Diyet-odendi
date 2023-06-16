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

    Map<String, dynamic>? dairiesMap;

    for (Map<String, dynamic> data in listFoods) {
      if (data.containsKey('dairies')) {
        dairiesMap = data['dairies'];

        break;
      }
    }
    if (dairiesMap != null) {
      List<dynamic> values = dairiesMap.values.toList();
      print('Values: $values');
    }

    print('dairies map: $dairiesMap');

    notifyListeners();
  }

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
      total += int.parse(selectedValue2);
    }
    notifyListeners();
  }

  deleteCalculateCalorie() {
    total = 0;
    notifyListeners();
  }
}
