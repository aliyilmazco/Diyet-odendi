// ignore_for_file: file_names

import 'package:d/view/home/target/view/diyetList_view.dart';
import 'package:flutter/material.dart';

abstract class DiyetListViewModel extends State<DiyetListView> {
  String? selectedMenuItem;
  List<String> menuItems = [
    'breakfast',
    'lunch',
    'dinner',
    'snack',
  ];
  @override
  void initState() {
    super.initState();
    selectedMenuItem = menuItems[0];
  }

  String getFirstPart(String input) {
    List<String> parts = input.split('x');

    return parts[0];
  }

  String getSecondPart(String input) {
    List<String> parts = input.split('x');

    return parts[1];
  }

  String calculateCalorie(String value, String calories) {
    double result = double.parse(value) * double.parse(calories);
    return result.toStringAsFixed(0);
  }
}
