// ignore_for_file: deprecated_member_use

import 'package:d/product/router/router_constant.dart';
import 'package:d/view/auth/signin/view/login_view.dart';
import 'package:d/view/auth/signin/view/sign_in_view.dart';
import 'package:d/view/auth/signup/view/add_info_view.dart';
import 'package:d/view/auth/signup/view/sign_up_view.dart';
import 'package:d/view/auth/signup/view/welcome_view.dart';
import 'package:d/view/home/create/date/view/date_picker_view.dart';
import 'package:d/view/home/create/eating/view/eating_view.dart';
import 'package:d/view/home/main/view/main_view.dart';
import 'package:d/view/home/recipe/view/recipe_detail_view.dart';
import 'package:d/view/home/settings/view/settings_view.dart';
import 'package:d/view/splash/slider/view/slider_view.dart';
import 'package:d/view/splash/splashScreen/view/splash_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  late final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: RouteConstants.splash,
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: SplashScreenView(),
          );
        },
      ),
      GoRoute(
        name: RouteConstants.slider,
        path: '/slider',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: SliderView(),
          );
        },
      ),
      GoRoute(
        name: RouteConstants.signIn,
        path: '/singIn',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: SignInView(),
          );
        },
      ),
      GoRoute(
        name: RouteConstants.singUp,
        path: '/signUp',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: SignUpView(),
          );
        },
      ),
      GoRoute(
        name: RouteConstants.login,
        path: '/login',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: LoginView(),
          );
        },
      ),
      GoRoute(
        name: RouteConstants.welcome,
        path: '/welcome',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: WelcomeView(),
          );
        },
      ),
      GoRoute(
        name: RouteConstants.addInfo,
        path: '/addInfo',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: AddInfoView(),
          );
        },
      ),
      GoRoute(
        name: RouteConstants.home,
        path: '/main',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: MainView(),
          );
        },
      ),
      GoRoute(
        name: RouteConstants.settings,
        path: '/settings',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: SettingsView(),
          );
        },
      ),
      GoRoute(
        name: RouteConstants.eating,
        path: '/eating',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: EatingView(),
          );
        },
      ),
      GoRoute(
        name: RouteConstants.recipeDetail,
        path: '/recipeDetail',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: RecipeDetailView(),
          );
        },
      ),
      GoRoute(
        name: RouteConstants.appointment,
        path: '/appointment',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: DatePickerView(),
          );
        },
      ),
    ],
    redirect: (context, state) {
      bool isAuthenticated = false;
      if (!isAuthenticated && state.subloc == '/') {
        return state.namedLocation(RouteConstants.home);
      }
      return null;
    },
  );
}
