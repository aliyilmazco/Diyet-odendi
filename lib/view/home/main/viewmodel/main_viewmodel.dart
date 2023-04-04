import 'package:d/view/home/homePage/view/home_view.dart';
import 'package:d/view/home/main/view/main_view.dart';
import 'package:flutter/material.dart';

abstract class MainViewModel extends State<MainView> {
  static int selectedIndex = 0;

  static const List<Widget> pages = <Widget>[
    HomeView(),
    Icon(
      Icons.camera,
      size: 150,
    ),
    Icon(
      Icons.camera,
      size: 150,
    ),
    Icon(
      Icons.camera,
      size: 150,
    ),
    Icon(
      Icons.camera,
      size: 150,
    ),
  ];
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
