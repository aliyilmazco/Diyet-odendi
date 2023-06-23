// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:io';

import 'package:d/product/router/router_constant.dart';
import 'package:d/product/service/auth_service.dart';
import 'package:d/view/home/settings/view/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

abstract class SettingsViewModel extends State<SettingsView> {
  File? image;
  AuthService authService = AuthService();
  void pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } catch (e) {
      print('Image picking failed: $e');
    }
  }

  logOut() async {
    await authService.signOut(context);
    context.pop();

    context.pushReplacementNamed(RouteConstants.login);
  }
}
