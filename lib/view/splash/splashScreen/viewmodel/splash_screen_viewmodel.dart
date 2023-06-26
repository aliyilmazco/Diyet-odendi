// ignore_for_file: avoid_print

import 'package:d/product/helper/helper_function.dart';
import 'package:d/view/auth/signup/model/sign_up_model.dart';
import 'package:d/view/home/settings/model/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../view/splash_screen_view.dart';

abstract class SplashScreenViewModel extends State<SplashScreenView> {
  bool isLoggedIn = false;
  bool isLoaded = false;
  String uid = '';
  String fullName = '';
  String email = '';
  bool isSelectedGender = false;
  String boy = '';
  String kilo = '';
  String yas = '';
  String chatId = '';
  String targetWeight = '';
  String dietation = '';
  String note = '';
  String picture = '';
  String diseases = '';
  String gender = '';
  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();

    Future.delayed(const Duration(seconds: 6), () async {
      if (isLoggedIn) {
        Future.delayed(const Duration(seconds: 8), () async {
          context.pushReplacement('/main');
          Provider.of<UserModelProvider>(context, listen: false).setUser(
              fullName: fullName,
              email: email,
              age: yas,
              uid: uid,
              chatId: chatId,
              dietationId: dietation,
              diseases: diseases,
              gender: gender,
              height: boy,
              note: note,
              profilePic: picture,
              targetWeight: targetWeight,
              weight: kilo);
          print(
              "Full name from splash: ${Provider.of<UserModelProvider>(context, listen: false).fullName} ..");
          print(fullName);
        });
        Provider.of<SettingsModel>(
          context,
          listen: false,
        ).downloadImage();
      } else {
        Future.delayed(const Duration(seconds: 3), () async {
          context.pushReplacement('/login');
        });
      }
    });
  }

  getUserLoggedInStatus() async {
    isLoggedIn = await HelperFunctions.getUserLoggedInSharedPreference();
    isLoaded = true;

    email = await HelperFunctions.getUserEmailSharedPreference();
    fullName = await HelperFunctions.getUserNameSharedPreference();
    yas = await HelperFunctions.getUserAgeSharedPreference();
    boy = await HelperFunctions.getUserHeightSharedPreference();
    targetWeight = await HelperFunctions.getUserTargetWeightSharedPreference();
    kilo = await HelperFunctions.getUserWeightSharedPreference();
    dietation = await HelperFunctions.getUserDietationSharedPreference();
    diseases = await HelperFunctions.getUserDiseaseSharedPreference();
    gender = await HelperFunctions.getUserGenderSharedPreference();
    note = await HelperFunctions.getUserNoteSharedPreference();
    picture = await HelperFunctions.getUserPictureSharedPreference();
    chatId = await HelperFunctions.getUserChatSharedPreference();

    setState(() {
      fullName = fullName;
      email = email;
      yas = yas;
      boy = boy;
      targetWeight = targetWeight;
      kilo = kilo;
      dietation = dietation;
      diseases = diseases;
      gender = gender;
      note = note;
      chatId = chatId;
      picture = picture;
    });
  }
}
