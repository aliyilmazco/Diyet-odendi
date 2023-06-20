import 'package:d/view/home/create/eating/model/eating_model.dart';
import 'package:d/view/home/create/eating/view/eating_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

abstract class EatingViewModel extends State<EatingView> {
  final dropdownFormKey = GlobalKey<FormState>();
  final String selectedValue = "0";
  final String selectedValue2 = "0";
  List<DropdownMenuItem<String>> get dropdownItems2 {
    List<DropdownMenuItem<String>> menuItems = [
      for (int i = 0;
          i < Provider.of<FoodsModel>(context).getFoodsNamesNumber();
          i++)
        if (Provider.of<FoodsModel>(context).getFoodNames(i) != "name")
          DropdownMenuItem(
            value: i.toString(),
            child: Text(
              Provider.of<FoodsModel>(context).getFoodNames(i),
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItems3 {
    List<DropdownMenuItem<String>> menuItems = [
      for (int i = 0;
          i < Provider.of<FoodsModel>(context).getSecondFoodNumber();
          i++)
        if (Provider.of<FoodsModel>(context).getFoodNames(i) != "name")
          DropdownMenuItem(
            value: i.toString(),
            child: Text(
              Provider.of<FoodsModel>(context).getSecondFoodNames(
                  Provider.of<FoodsModel>(
                    context,
                  ).selectedOgun,
                  i),
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
    ];
    return menuItems;
  }
}
