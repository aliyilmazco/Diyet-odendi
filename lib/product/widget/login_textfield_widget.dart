import 'package:flutter/material.dart';

import '../../core/constant/color_constant.dart';

class LoginTextFieldWidget extends StatelessWidget {
  const LoginTextFieldWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.showSuffix,
  });
  final String labelText;
  final String hintText;
  final bool showSuffix;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorConst.textFieldBorder,
              width: 0.1,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          labelText: labelText,
          suffixIcon: showSuffix ? const Icon(Icons.remove_red_eye) : null,
          hintText: hintText,
        ),
      ),
    );
  }
}
