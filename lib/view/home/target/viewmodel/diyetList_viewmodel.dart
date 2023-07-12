// ignore_for_file: file_names

import 'package:d/view/home/target/model/diyetList_model.dart';
import 'package:d/view/home/target/view/diyetList_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class DiyetListViewModel extends State<DiyetListView> {
  String? selectedMenuItem = 'breakfast';
  String totalCaloriesValue = '';
  List<String> menuItems = [
    'kahvaltı',
    'lunch',
    'dinner',
    'snack',
  ];
  @override
  void initState() {
    super.initState();
    selectedMenuItem = menuItems[0];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DiyetListModel>(context, listen: false).getData();
      Provider.of<DiyetListModel>(context, listen: false)
          .getDayListByOgun(selectedMenuItem!);
      totalCaloriesValue = totalCalories();
    });
  }

  String getFirstPart(String input) {
    List<String> parts = input.split('x');

    return parts[0];
  }

  String getSecondPart(String input) {
    bool isContain = input.contains('x');
    List<String> parts = input.split('x');

    return isContain ? parts[1] : '';
  }

  String calculateCalorie(String value, String calories) {
    if (value == '') {
      value = '1';
    }
    if (calories == '') {
      calories = '0';
    }
    double result = double.parse(value) * double.parse(calories);
    return result.toStringAsFixed(0);
  }

  String totalCalories() {
    for (int i = 0;
        i < Provider.of<DiyetListModel>(context, listen: false).keyList2.length;
        i++) {
      String values = calculateCalorie(
          getSecondPart(
            Provider.of<DiyetListModel>(context, listen: false).keyList2[i],
          ),
          Provider.of<DiyetListModel>(context, listen: false).valueList2[i]);

      Provider.of<DiyetListModel>(context, listen: false).total +=
          int.parse(values);
    }

    return Provider.of<DiyetListModel>(context, listen: false).total.toString();
  }
}
