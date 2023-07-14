// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d/product/service/database_service.dart';
import 'package:d/product/widget/create/date_container_widget.dart';
import 'package:d/view/auth/signup/model/sign_up_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  String selectedTime = '';
  bool isSelecting = false;
  TimeOfDay time = TimeOfDay.now().replacing(hour: 14, minute: 30);

  void onTimeChanged(TimeOfDay newTime) {
    time = newTime;
    String formattedTime =
        '${time.hour}:${time.minute.toString().padLeft(2, '0')}';

    selectedTime = formattedTime.toString();
    isSelecting = true;
    notifyListeners();
  }

  void setDate(List<DateTime?> value) {
    date = value;
    notifyListeners();
  }

  Future<void> addToWidgetList(double width, double height) async {
    // Clear the existing widgetList before adding new widgets
    widgetList.clear();

    for (int i = 0; i < snapshotLength; i++) {
      final bool widgetExists = widgetList.any((widget) {
        if (widget is Padding &&
            widget.child is DateContainerWidget &&
            (widget.child as DateContainerWidget).time == getDateForWidget(i)) {
          return true;
        }
        return false;
      });

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
            doctor: getDoctorTime(i),
            status: getStatusForWidget(i),
          ),
        ),
      );
    }

    isSelecting = false;
  }

  List<Widget> getWidgetList(List<Widget> widgets) {
    widgetList = widgets;
    return widgetList;
  }

  void splitDate() {
    for (final DateTime? dateItem in date) {
      if (dateItem != null) {
        final day = dateItem.day;
        final month = dateItem.month;
        if (firstDay.isEmpty && firstMonth.isEmpty) {
          firstDay = day.toString();
          firstMonth = month.toString();
        } else {
          firstDay = day.toString();
          firstMonth = month.toString();
        }
      }
    }
  }

  void createDate(BuildContext context) {
    DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).createDate(
      Provider.of<UserModelProvider>(context, listen: false).fullName,
      FirebaseAuth.instance.currentUser!.uid,
      lastMonth,
      lastDay,
      firstMonth,
      firstDay,
      '',
      selectedTime,
    );
  }

  String getDateForWidget(int number) {
    final String firstDayWidget = snapshot!.docs[number]['firstDay'];
    final String lastDayWidget = snapshot!.docs[number]['firstMonth'];
    return "$firstDayWidget . $lastDayWidget";
  }

  String getDoctorForWidget(int number) {
    final String doctorName = snapshot!.docs[number]['doctorName'];
    return doctorName;
  }

  String getDoctorTime(int i) {
    final String confirmedTime = snapshot!.docs[i]['confirmedDate'];
    return confirmedTime;
  }

  String getStatusForWidget(int number) {
    final String status = snapshot!.docs[number]['isConfirmed'];
    if (status == 'false') {
      return 'Onaylanmadı';
    } else if (status == 'true') {
      return 'Onaylandı';
    }
    return status;
  }

  Future<void> getDates(double width, double height) async {
    snapshot =
        await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
            .getDate();
    snapshotLength = snapshot!.docs.length;
    print("value degeri: $snapshotLength");
  }
}
