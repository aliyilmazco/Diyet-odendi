// ignore_for_file: avoid_print

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d/product/service/database_service.dart';
import 'package:d/view/home/homePage/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
}
