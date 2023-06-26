// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:d/product/helper/helper_function.dart';
import 'package:d/product/service/auth_service.dart';
import 'package:d/product/service/database_service.dart';
import 'package:d/view/auth/signup/model/sign_up_model.dart';
import 'package:d/view/auth/signup/view/add_info_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

abstract class AddInfoViewModel extends State<AddInfoView> {
  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  bool isSelectedGender = false;
  double boy = 150;
  double kilo = 70;
  double yas = 30;
  double targetWeight = 75;

  genderCheck(bool gender) {
    if (gender) {
      return 'Erkek';
    } else {
      return "Kadin";
    }
  }

  String email = "empty email";
  String password = 'empty password';
  String fullName = 'empty fullName';
  bool isLoading = false;
  String chatId = '';
  AuthService authService = AuthService();

  createChat() {
    DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
        .createChat(fullName, FirebaseAuth.instance.currentUser!.uid, fullName)
        .whenComplete(() {
      isLoading = false;
    });
  }

  updateProfile(
    String uid,
    String fullName,
    String email,
    bool isSelectedGender,
    String boy,
    String kilo,
    String yas,
    String targetWeight,
  ) async {
    DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).updateUserData(
      uid,
      fullName,
      email,
      '',
      genderCheck(isSelectedGender),
      yas,
      boy,
      kilo,
      targetWeight,
      '',
      '',
    );
    setState(() {
      isLoading = false;
    });
    await HelperFunctions.saveUserLoggedInStatus(true);
    await HelperFunctions.saveUserEmail(email);
    await HelperFunctions.saveUserName(fullName);
    await HelperFunctions.saveUserHeight(boy);
    await HelperFunctions.saveUserTargetWeight(targetWeight);
    await HelperFunctions.saveUserWeight(kilo);
    await HelperFunctions.saveUserAge(yas);
    await HelperFunctions.saveUserDietation('');
    await HelperFunctions.saveUserDisease('');
    await HelperFunctions.saveUserGender(genderCheck(isSelectedGender));
    await HelperFunctions.saveUserNote('');
    await HelperFunctions.saveUserPicture('');

    Provider.of<UserModelProvider>(context, listen: false).setUser(
      age: yas,
      dietationId: '',
      chatId: chatId,
      diseases: '',
      email: email,
      fullName: fullName,
      gender: genderCheck(isSelectedGender),
      height: boy,
      note: '',
      profilePic: '',
      targetWeight: targetWeight,
      uid: uid,
      weight: kilo,
    );
    createChat();
    context.pushReplacement('/main');
  }

  gettingUserData() async {
    await HelperFunctions.getUserEmailSharedPreference().then((value) {
      setState(() {
        email = value;
        print('Email: $email');
      });
    });
    await HelperFunctions.getUserNameSharedPreference().then((value) {
      setState(() {
        fullName = value;
        print('Full Name: $fullName');
      });
    });
    await HelperFunctions.getUserChatSharedPreference().then((value) {
      setState(() {
        chatId = value;
        print('chatId: $chatId');
      });
    });
  }
}
