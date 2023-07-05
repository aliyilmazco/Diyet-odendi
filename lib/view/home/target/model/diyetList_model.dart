// ignore_for_file: file_names, avoid_print

import 'package:d/product/service/database_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DiyetListModel extends ChangeNotifier {
  List<Map<String, dynamic>> diyetList = [];
  List<String> keyList = ['', '', ''];
  List<String> valueList = ['', '', ''];
  List<String> keyList2 = ['', '', ''];
  List<String> valueList2 = ['', '', ''];
  String ogun = '';

  int total = 0;

  String currentDate = DateFormat('dd').format(DateTime.now());
  String currentDayName = DateFormat('EEEE').format(DateTime.now());

  String formattedTime = DateTime.now().toString().substring(11, 16);

  calculateTime() {
    if (formattedTime.compareTo('06:00') >= 0 &&
        formattedTime.compareTo('09:00') < 0) {
      ogun = 'breakfast';
    } else if (formattedTime.compareTo('12:00') >= 0 &&
        formattedTime.compareTo('15:00') < 0) {
      ogun = 'lunch';
    } else if (formattedTime.compareTo('18:00') >= 0 &&
        formattedTime.compareTo('21:00') < 0) {
      ogun = 'dinner';
    } else {
      ogun = 'snack';
    }

    print('Mevcut Zaman: $formattedTime');
    print('Öğün: $ogun');
  }

  getData() async {
    diyetList =
        await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
            .getDiyetList(FirebaseAuth.instance.currentUser!.uid);
    getDayList();
    print("diyetList: $diyetList");

    print('current day: $currentDate');
  }

  getDayList() {
    calculateTime();
    Map<String, dynamic>? desiredMap;

    for (Map<String, dynamic> map in diyetList) {
      if (map['day'] == currentDate) {
        desiredMap = map;
        break;
      }
    }

    if (desiredMap != null) {
      print('İstenilen map: $desiredMap');
      print('${desiredMap[ogun]}');
      Map<String, dynamic> lunchMap = desiredMap[ogun];

      lunchMap.forEach((key, value) {
        print('key: $key, value: $value');
        keyList.add(key);
        valueList.add(value);
      });
    } else {
      print('İstenilen gün değerine sahip map bulunamadi.');
    }
  }

  getDayListByOgun(String ogunByString) {
    calculateTime();
    Map<String, dynamic>? desiredMap;

    for (Map<String, dynamic> map in diyetList) {
      if (map['day'] == currentDate) {
        desiredMap = map;
        break;
      }
    }

    if (desiredMap != null) {
      print('İstenilen map: $desiredMap');
      print('${desiredMap[ogunByString]}');
      Map<String, dynamic> lunchMap = desiredMap[ogunByString];
      keyList2.clear();
      valueList2.clear();
      total = 0;
      lunchMap.forEach((key, value) {
        print('key: $key, value: $value');
        keyList2.add(key);
        valueList2.add(value);
      });
    } else {
      print('İstenilen gün değerine sahip map bulunamadi.');
    }
  }
}
