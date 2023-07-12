// ignore_for_file: avoid_print

import 'package:d/core/base/view/base_view.dart';
import 'package:d/core/constant/color_constant.dart';
import 'package:d/product/widget/login/login_button_widget.dart';
import 'package:d/product/widget/login/login_textfield_widget.dart';
import 'package:d/view/home/settings/viewmodel/update_profile_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateProfileView extends StatefulWidget {
  const UpdateProfileView({super.key});

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends UpdateProfileViewModel {
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          )
        : BaseView(
            builder: (context, width, height, appBar) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: ColorConst.appBgColorWhite,
                  shadowColor: Colors.transparent,
                  iconTheme: const IconThemeData(color: Colors.black),
                ),
                backgroundColor: ColorConst.appBgColorWhite,
                body: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Profili Güncelle",
                              style: GoogleFonts.glory(
                                color: ColorConst.createPageText,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        LoginTextfieldWidget(
                          labelText: 'Tum Isim',
                          hintText: "Isim Giriniz",
                          showSuffix: false,
                          functionCallBack: (value) {
                            setState(
                              () {
                                fullName = value;
                                print(fullName);
                              },
                            );
                          },
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              return null;
                            } else {
                              return "Lutfen isim giriniz!";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LoginTextfieldWidget(
                          labelText: "Kilo",
                          hintText: "Kilo Giriniz",
                          showSuffix: false,
                          functionCallBack: (value) {
                            setState(() {
                              kilo = value;
                              print(email);
                            });
                          },
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              return null;
                            } else {
                              return "Lutfen kilo giriniz!";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LoginTextfieldWidget(
                          labelText: "Şifre",
                          hintText: "Şifre Giriniz",
                          showSuffix: true,
                          functionCallBack: (value) {
                            setState(() {
                              password = value;
                              print(password);
                            });
                          },
                          validator: (value) {
                            return value!.length > 6
                                ? null
                                : "Lütfen 6 karakterden daha uzun şifre giriniz!";
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LoginTextfieldWidget(
                          labelText: "Hedef Kilo",
                          hintText: "Hedef Kilo Giriniz",
                          showSuffix: false,
                          functionCallBack: (value) {
                            setState(() {
                              targetWeight = value;
                              print(targetWeight);
                            });
                          },
                          validator: (value) {
                            return value!.length > 2
                                ? null
                                : "Lütfen 6 karakterden daha uzun hedef kilo giriniz!";
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LoginTextfieldWidget(
                          labelText: "Hastalık",
                          hintText: "Hastalık Giriniz",
                          showSuffix: false,
                          height: 100,
                          functionCallBack: (value) {
                            setState(() {
                              diseases = value;
                              print(diseases);
                            });
                          },
                          validator: (value) {
                            return value!.length > 6
                                ? null
                                : "Lütfen 6 karakterden daha uzun hastalık giriniz!";
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LoginTextfieldWidget(
                          labelText: "Not",
                          hintText: "Not Giriniz",
                          height: 100,
                          showSuffix: false,
                          functionCallBack: (value) {
                            setState(() {
                              note = value;
                              print(note);
                            });
                          },
                          validator: (value) {
                            return value!.length > 6
                                ? null
                                : "Lütfen 6 karakterden daha uzun note giriniz!";
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LoginButtonWidget(
                          width: width,
                          height: height,
                          text: "Güncelle",
                          backgroundColor: ColorConst.sliderTitle,
                          textColor: ColorConst.appBgColorWhite,
                          borderColor: ColorConst.sliderTitle,
                          function: () {
                            updateProfile(
                              FirebaseAuth.instance.currentUser!.uid,
                              fullName,
                              email,
                              isSelectedGender,
                              boy,
                              kilo,
                              yas,
                              targetWeight,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }
}
