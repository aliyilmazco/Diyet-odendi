import 'package:d/core/base/view/base_view.dart';
import 'package:d/core/constant/color_constant.dart';
import 'package:d/view/home/create/eating/viewmodel/eating_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EatingView extends StatefulWidget {
  const EatingView({super.key});

  @override
  State<EatingView> createState() => _EatingViewState();
}

class _EatingViewState extends EatingViewModel {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      builder: (context, width, height, appBar) {
        return Scaffold(
          backgroundColor: ColorConst.appBgColorWhite,
          appBar: AppBar(
            shadowColor: Colors.transparent,
            foregroundColor: ColorConst.createPageText,
            backgroundColor: Colors.transparent,
            title: Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: Center(
                child: Text(
                  'OGUNLAR',
                  style: GoogleFonts.raleway(
                    color: ColorConst.sliderTitle,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          body: Center(
            child: Column(
              children: [
                Form(
                  key: dropdownFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: ColorConst.mainBoxBg,
                        ),
                        validator: (value) =>
                            value == null ? "Secim Yapiniz" : null,
                        dropdownColor: ColorConst.mainBoxBg,
                        value: selectedValue,
                        onChanged: (String? newValue) {
                          setState(
                            () {
                              selectedValue = newValue!;
                            },
                          );
                        },
                        items: dropdownItems,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (dropdownFormKey.currentState!.validate()) {
                            //valid flow
                          }
                        },
                        child: const Text("Submit"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
