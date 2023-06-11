import 'package:d/product/helper/helper_function.dart';
import 'package:d/product/service/auth_service.dart';
import 'package:d/product/service/database_service.dart';
import 'package:d/view/auth/signup/view/add_info_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  String email = "";
  String password = '';
  String fullName = '';
  bool isLoading = false;

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

    context.pushReplacement('/main');
  }

  gettingUserData() async {
    await HelperFunctions.getUserEmailSharedPreference().then((value) {
      setState(() {
        email = value;
      });
    });
    await HelperFunctions.getUserNameSharedPreference().then((value) {
      setState(() {
        fullName = value;
      });
    });
  }
}
