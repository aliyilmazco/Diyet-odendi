// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d/product/service/database_service.dart';
import 'package:d/product/widget/create/date_container_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DateModel extends ChangeNotifier {
  List<DateTime?> date = [];
  String firstDay = '';
  String lastDay = '';
  String firstMonth = '';
  String lastMonth = '';
  QuerySnapshot? snapshot;
  int snapshotLength = 0;
  List<Widget> widgetList = [];
  bool isLoaded = false;
  setDate(List<DateTime?> value) {
    date = value;
    notifyListeners();
  }

  addToWidgetList(
    double width,
    double height,
  ) async {
    for (int i = 0; i < snapshotLength; i++) {
      bool widgetExists = false;
      for (Widget widget in widgetList) {
        if (widget is Padding &&
            widget.child is DateContainerWidget &&
            (widget.child as DateContainerWidget).time == getDateForWidget(i)) {
          widgetExists = true;
          break;
        }
      }

      if (widgetExists) {
        continue;
      }

      widgetList.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DateContainerWidget(
            width: width,
            height: height,
            time: getDateForWidget(i),
            doctor: getDoctorForWidget(i),
            status: getStatusForWidget(i),
          ),
        ),
      );
    }

    notifyListeners();
  }

  void getWidgetList(List<Widget> widgets) async {
    for (var widget in widgets) {
      print(widget);
    }
  }

  splitDate() {
    int i = 0;
    for (DateTime? date in date) {
      if (date != null) {
        int day = date.day;
        int month = date.month;
        if (i == 0) {
          firstDay = day.toString();
          firstMonth = month.toString();
          i++;
        } else {
          lastDay = day.toString();
          lastMonth = month.toString();
        }
      }
    }
    i = 0;
  }

  createDate() {
    DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).createDate(
      '',
      FirebaseAuth.instance.currentUser!.uid,
      firstMonth,
      firstDay,
      lastMonth,
      lastDay,
      '',
    );
  }

  String getDateForWidget(int number) {
    String firstDayWidget = snapshot!.docs[number]['firstDay'];
    String lastDayWidget = snapshot!.docs[number]['firstMonth'];
    return "$firstDayWidget . $lastDayWidget";
  }

  String getDoctorForWidget(int number) {
    String doctorName = snapshot!.docs[number]['doctorName'];
    return doctorName;
  }

  String getStatusForWidget(int number) {
    String status = snapshot!.docs[number]['isConfirmed'];
    return status;
  }

  getDates(double width, double height) async {
    snapshot =
        await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
            .getDate();

    snapshotLength = snapshot!.docs.length;
    print("value degeri: $snapshotLength");
  }
}
