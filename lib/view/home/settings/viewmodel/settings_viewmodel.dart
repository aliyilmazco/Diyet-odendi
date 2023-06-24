// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:d/product/router/router_constant.dart';
import 'package:d/product/service/auth_service.dart';
import 'package:d/view/home/settings/view/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class SettingsViewModel extends State<SettingsView> {
  AuthService authService = AuthService();

  logOut() async {
    await authService.signOut(context);
    context.pop();

    context.pushReplacementNamed(RouteConstants.login);
  }
}
