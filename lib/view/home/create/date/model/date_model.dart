import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d/product/service/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DateModel extends ChangeNotifier {
  List<DateTime?> date = [];
  String firstDay = '';
  String lastDay = '';
  String firstMonth = '';
  String lastMonth = '';

  setDate(List<DateTime?> value) {
    date = value;
    notifyListeners();
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

  getDates() async {
    QuerySnapshot snapshot =
        await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
            .getDate();
    print("firstDay: ${snapshot.docs[0]['firstDay']}");
    print("lastDay: ${snapshot.docs[0]['lastDay']}");
    print("firstMonth: ${snapshot.docs[0]['firstMonth']}");
    print("lastMonth: ${snapshot.docs[0]['lastMonth']}");
    print("uid: ${snapshot.docs[0]['uid']}");
    print("isConfirmed ${snapshot.docs[0]['isConfirmed']}");
    print("confirmedDate ${snapshot.docs[0]['confirmedDate']}");
    print("doctorName ${snapshot.docs[0]['doctorName']}");

    int value = snapshot.docs.length;
    print("value degeri: $value");
  }
}
