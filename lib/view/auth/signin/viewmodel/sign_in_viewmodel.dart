// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d/product/helper/helper_function.dart';
import 'package:d/product/router/router_constant.dart';
import 'package:d/product/service/database_service.dart';
import 'package:d/product/widget/login/snackbar_widget.dart';
import 'package:d/view/auth/signup/model/sign_up_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../product/service/auth_service.dart';
import '../view/sign_in_view.dart';

abstract class SignInViewModel extends State<SignInView> {
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
  AuthService authService = AuthService();

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  genderCheck(bool gender) {
    if (gender) {
      return 'Erkek';
    } else {
      return "Kadin";
    }
  }

  login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      await authService.login(email, password).then((value) async {
        if (value == true) {
          QuerySnapshot snapshot =
              await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                  .gettingUserData(email);

          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmail(email);
          await HelperFunctions.saveUserName(snapshot.docs[0]['fullName']);
          await HelperFunctions.saveUserHeight(snapshot.docs[0]['height']);
          await HelperFunctions.saveUserTargetWeight(
              snapshot.docs[0]['targetWeight']);
          await HelperFunctions.saveUserWeight(snapshot.docs[0]['weight']);
          await HelperFunctions.saveUserAge(snapshot.docs[0]['age']);
          await HelperFunctions.saveUserDietation(
              snapshot.docs[0]['dietationId']);
          await HelperFunctions.saveUserDisease(snapshot.docs[0]['diseases']);
          await HelperFunctions.saveUserGender(snapshot.docs[0]['gender']);
          await HelperFunctions.saveUserNote(snapshot.docs[0]['note']);
          await HelperFunctions.saveUserPicture(snapshot.docs[0]['profilePic']);
          await HelperFunctions.saveUserChat(snapshot.docs[0]['chatId']);

          Provider.of<UserModelProvider>(context, listen: false).setUser(
            age: snapshot.docs[0]['age'],
            dietationId: snapshot.docs[0]['dietationId'],
            diseases: snapshot.docs[0]['diseases'],
            email: snapshot.docs[0]['email'],
            fullName: snapshot.docs[0]['fullName'],
            gender: snapshot.docs[0]['gender'],
            height: snapshot.docs[0]['height'],
            note: snapshot.docs[0]['note'],
            profilePic: snapshot.docs[0]['profilePic'],
            targetWeight: snapshot.docs[0]['targetWeight'],
            uid: uid,
            chatId: snapshot.docs[0]['chatId'],
            weight: snapshot.docs[0]['weight'],
          );
          context.pushReplacementNamed(RouteConstants.home);
        } else {
          showSnackBar(context, Colors.blue, value);

          setState(() {
            isLoading = false;
          });
        }
      });
    }
  }
}
