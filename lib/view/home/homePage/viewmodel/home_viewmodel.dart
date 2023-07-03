// ignore_for_file: avoid_print

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d/product/service/database_service.dart';
import 'package:d/view/home/homePage/view/home_view.dart';
import 'package:d/view/home/target/model/diyetList_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class HomeViewModel extends State<HomeView> {
  String motivation = '';
  QuerySnapshot? snapshot;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getMotivation();
    });

    super.initState();
  }

  Future<void> getMotivation() async {
    snapshot =
        await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
            .getMotivation();
    if (snapshot!.docs.isNotEmpty) {
      var firstDocument = snapshot!.docs.first;
      var data = firstDocument.data() as Map<dynamic, dynamic>;
      if (data.isNotEmpty) {
        var random = Random();
        var randomIndex = random.nextInt(data.values.length - 1);
        var randomDocument = data.values.elementAt(randomIndex);
        setState(() {
          motivation = randomDocument.toString();
        });
      }
    }
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

  String totalCalories() {
    int total = 0;
    for (int i = 0;
        i < Provider.of<DiyetListModel>(context).keyList.length;
        i++) {
      String values = calculateCalorie(
          getSecondPart(
            Provider.of<DiyetListModel>(context).keyList[i],
          ),
          Provider.of<DiyetListModel>(context).valueList[i]);

      total += int.parse(values);
    }
    return total.toString();
  }
}
