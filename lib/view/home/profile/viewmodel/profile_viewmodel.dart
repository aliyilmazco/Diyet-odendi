import 'package:d/view/home/profile/model/chart_data.dart';
import 'package:d/view/home/profile/view/profile_view.dart';
import 'package:flutter/material.dart';

abstract class ProfileViewModel extends State<ProfileView> {
  late List<ChartData> data;
  @override
  void initState() {
    data = [
      ChartData(1, 75),
      ChartData(2, 71),
      ChartData(3, 73),
      ChartData(4, 72),
      ChartData(5, 74),
      ChartData(6, 74),
      ChartData(7, 74),
    ];
    super.initState();
  }
}
