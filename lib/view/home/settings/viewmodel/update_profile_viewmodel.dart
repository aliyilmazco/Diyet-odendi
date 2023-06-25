// ignore_for_file: avoid_print

import 'package:d/product/helper/helper_function.dart';
import 'package:d/product/service/auth_service.dart';
import 'package:d/product/service/database_service.dart';
import 'package:d/view/auth/signup/model/sign_up_model.dart';
import 'package:d/view/home/settings/view/update_profile_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

abstract class UpdateProfileViewModel extends State<UpdateProfileView> {
  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String uid = '';
  String fullName = '';
  bool isSelectedGender = false;
  String boy = '';
  String kilo = '';
  String yas = '';
  String targetWeight = '';
  bool isLoading = false;
  String diseases = '';
  String note = '';
  String gender = '';
  AuthService authService = AuthService();
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
      gender,
      yas,
      boy,
      kilo,
      targetWeight,
      diseases,
      note,
    );
    setState(() {
      isLoading = false;
    });

    Provider.of<UserModelProvider>(context, listen: false).setUser(
      age: yas,
      dietationId: '',
      diseases: diseases,
      email: email,
      fullName: fullName,
      gender: gender,
      height: boy,
      note: note,
      profilePic: '',
      targetWeight: targetWeight,
      uid: uid,
      weight: kilo,
    );
    context.pop();
  }

  gettingUserData() async {
    await HelperFunctions.getUserEmailSharedPreference().then((value) {
      setState(() {
        email = value;
        print('Email: $email');
      });
    });

    await HelperFunctions.getUserGenderSharedPreference().then((value) {
      setState(() {
        gender = value;
        print('gender: $fullName');
      });
    });
    await HelperFunctions.getUserAgeSharedPreference().then((value) {
      setState(() {
        yas = value;
        print('yas: $fullName');
      });
    });
    await HelperFunctions.getUserHeightSharedPreference().then((value) {
      setState(() {
        boy = value;
        print('yas: $fullName');
      });
    });
  }
}
