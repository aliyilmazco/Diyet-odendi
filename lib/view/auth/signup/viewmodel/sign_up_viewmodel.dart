// ignore_for_file: use_build_context_synchronously

import 'package:d/product/helper/helper_function.dart';

import 'package:d/product/service/auth_service.dart';
import 'package:d/product/widget/login/snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../view/sign_up_view.dart';

abstract class SignUpViewModel extends State<SignUpView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  String email = "";
  String password = '';
  String fullName = '';
  bool isLoading = false;
  AuthService authService = AuthService();

  Future register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      await authService
          .registerUserWithEmailandPassword(fullName, email, password)
          .then((value) async {
        if (value == true) {
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmail(email);
          await HelperFunctions.saveUserName(fullName);
          context.pushReplacement("/welcome");
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
