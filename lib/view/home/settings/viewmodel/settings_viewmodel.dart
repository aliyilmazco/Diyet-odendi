// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:d/product/router/router_constant.dart';
import 'package:d/product/service/auth_service.dart';
import 'package:d/view/home/create/eating/model/eating_model.dart';
import 'package:d/view/home/settings/view/settings_view.dart';
import 'package:d/view/home/target/model/diyetList_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

abstract class SettingsViewModel extends State<SettingsView> {
  AuthService authService = AuthService();

  logOut() async {
    await authService.signOut(context);
    Provider.of<DiyetListModel>(context, listen: false).total = 0;
    Provider.of<FoodsModel>(context, listen: false).total = 0;
    Provider.of<FoodsModel>(context, listen: false).foodsCalorie = '';

    Provider.of<FoodsModel>(context, listen: false).listFoodNames.clear();
    Provider.of<FoodsModel>(context, listen: false).widgetList.clear();
    Provider.of<DiyetListModel>(context, listen: false).diyetList.clear();

    context.pop();

    context.pushReplacementNamed(RouteConstants.login);
  }
}
