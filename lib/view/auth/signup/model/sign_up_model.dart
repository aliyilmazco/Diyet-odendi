// ignore_for_file: avoid_print

import 'package:d/product/helper/helper_function.dart';
import 'package:flutter/material.dart';

class UserModelProvider with ChangeNotifier {
  String fullName;
  String email;
  String age;
  String uid;
  String dietationId;
  String diseases;
  String gender;
  String height;
  String note;
  String profilePic;
  String targetWeight;
  String weight;

  UserModelProvider({
    required this.age,
    required this.email,
    required this.fullName,
    required this.uid,
    required this.dietationId,
    required this.diseases,
    required this.gender,
    required this.height,
    required this.note,
    required this.profilePic,
    required this.targetWeight,
    required this.weight,
  });

  Future<void> setUser({
    required String fullName,
    required String email,
    required String age,
    required String uid,
    required String dietationId,
    required String diseases,
    required String gender,
    required String height,
    required String note,
    required String profilePic,
    required String targetWeight,
    required String weight,
  }) async {
    bool isLoggedIn = await HelperFunctions.getUserLoggedInSharedPreference();

    if (isLoggedIn) {
      this.age = await HelperFunctions.getUserAgeSharedPreference();
      this.email = await HelperFunctions.getUserEmailSharedPreference();
      this.height = await HelperFunctions.getUserHeightSharedPreference();
      this.fullName = await HelperFunctions.getUserNameSharedPreference();
      this.targetWeight =
          await HelperFunctions.getUserTargetWeightSharedPreference();
      this.weight = await HelperFunctions.getUserWeightSharedPreference();
      print("isLoggedIn true");
    } else {
      this.age = age;
      this.email = email;
      this.fullName = fullName;
      this.uid = uid;
      this.dietationId = dietationId;
      this.diseases = diseases;
      this.gender = gender;
      this.height = height;
      this.note = note;
      this.profilePic = profilePic;
      this.targetWeight = targetWeight;
      this.weight = weight;
      print("isLoggedIn false");
    }

    notifyListeners();
  }

  resetUser() {
    age = "";
    email = "";
    fullName = "";
    uid = "";
    dietationId = "";
    diseases = '';
    weight = '';
    targetWeight = '';
    profilePic = '';
    note = '';
    uid = '';
    height = '';
    print("basarili temizleme");
  }
}
