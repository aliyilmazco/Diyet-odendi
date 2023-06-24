import 'package:d/product/service/auth_service.dart';
import 'package:d/view/home/settings/view/update_profile_view.dart';
import 'package:flutter/material.dart';

abstract class UpdateProfileViewModel extends State<UpdateProfileView> {
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
  AuthService authService = AuthService();
}
