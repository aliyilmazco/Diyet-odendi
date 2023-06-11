// ignore_for_file: avoid_print, unnecessary_null_comparison, use_build_context_synchronously

import 'package:d/product/helper/helper_function.dart';
import 'package:d/product/service/database_service.dart';
import 'package:d/view/auth/signup/model/sign_up_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future login(String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future registerUserWithEmailandPassword(
    String fullName,
    String email,
    String password,
  ) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if (user != null) {
        await DatabaseService(uid: user.uid).savingUserData(
          fullName,
          email,
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
        );

        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signOut(BuildContext context) async {
    try {
      await HelperFunctions.saveUserLoggedInStatus(false);
      await HelperFunctions.saveUserName("");
      await HelperFunctions.saveUserEmail("");
      await HelperFunctions.saveUserAge('');
      await HelperFunctions.saveUserHeight('');
      await HelperFunctions.saveUserTargetWeight('');
      await HelperFunctions.saveUserWeight('');
      Provider.of<UserModelProvider>(
        context,
        listen: false,
      ).dispose();

      return await firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}
