// ignore_for_file: file_names, avoid_print

import 'package:d/product/service/database_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DiyetListModel extends ChangeNotifier {
  List<Map<String, dynamic>> diyetList = [];
  String currentDate = DateFormat('dd').format(DateTime.now());

  getData() async {
    diyetList =
        await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
            .getDiyetList(FirebaseAuth.instance.currentUser!.uid);
    print("diyetList: $diyetList");

    print('current day: $currentDate');
  }

  getDayList() {
    Map<String, dynamic>? desiredMap;

    for (Map<String, dynamic> map in diyetList) {
      if (map['day'] == currentDate) {
        desiredMap = map;
        break;
      }
    }

    if (desiredMap != null) {
      print('İstenilen map: $desiredMap');
    } else {
      print('İstenilen gün değerine sahip map bulunamadi.');
    }
  }
}
