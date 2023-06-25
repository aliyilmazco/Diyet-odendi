// ignore_for_file: avoid_print

import 'package:d/core/base/view/base_view.dart';
import 'package:d/core/constant/color_constant.dart';
import 'package:d/product/widget/login/login_button_widget.dart';
import 'package:d/product/widget/login/login_textfield_widget.dart';
import 'package:d/view/home/settings/viewmodel/update_profile_viewmodel.dart';
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
                              "Update Profile",
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
                          hintText: "Enter Kilo",
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
                              return "Lutfen isim giriniz!";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LoginTextfieldWidget(
                          labelText: "Password",
                          hintText: "Enter Password",
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
                                : "Enter a password 6+ chars long";
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LoginTextfieldWidget(
                          labelText: "Target Weight",
                          hintText: "Enter Target Weight",
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
                                : "Enter a Target Weight 6+ chars long";
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LoginTextfieldWidget(
                          labelText: "Diseases",
                          hintText: "Enter Diseases",
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
                                : "Enter a diseases 6+ chars long";
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LoginTextfieldWidget(
                          labelText: "Note",
                          hintText: "Enter Notes",
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
                                : "Enter a note 6+ chars long";
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LoginButtonWidget(
                          width: width,
                          height: height,
                          text: "Guncelle",
                          backgroundColor: ColorConst.sliderTitle,
                          textColor: ColorConst.appBgColorWhite,
                          borderColor: ColorConst.sliderTitle,
                          function: () {
                            updateProfile(uid, fullName, email,
                                isSelectedGender, boy, kilo, yas, targetWeight);
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
