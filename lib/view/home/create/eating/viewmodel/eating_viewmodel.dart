import 'package:d/view/home/create/eating/view/eating_view.dart';
import 'package:flutter/material.dart';

abstract class EatingViewModel extends State<EatingView> {
  String? selectedValue = null;
  final dropdownFormKey = GlobalKey<FormState>();

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "100", child: Text("Et")),
      const DropdownMenuItem(value: "200", child: Text("Sut")),
      const DropdownMenuItem(value: "300", child: Text("Meyve")),
      const DropdownMenuItem(value: "400", child: Text("Cikolata")),
    ];
    return menuItems;
  }
}
