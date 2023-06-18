import 'package:d/view/home/create/eating/model/eating_model.dart';
import 'package:d/view/home/create/eating/view/eating_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

abstract class EatingViewModel extends State<EatingView> {
  final dropdownFormKey = GlobalKey<FormState>();
  final String selectedValue = "100";
  final String selectedValue2 = "0";
  List<DropdownMenuItem<String>> get dropdownItems2 {
    List<DropdownMenuItem<String>> menuItems = [
      for (int i = 100;
          i < Provider.of<FoodsModel>(context).getFoodsNamesNumber() + 100;
          i++)
        if (Provider.of<FoodsModel>(context).getFoodNames(i - 100) != "name")
          DropdownMenuItem(
            value: i.toString(),
            child: Text(
              Provider.of<FoodsModel>(context).getFoodNames(i - 100),
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
      for (int i = 100;
          i < Provider.of<FoodsModel>(context).getSecondFoodNumber() + 100;
          i++)
        if (Provider.of<FoodsModel>(context).getFoodNames(i - 100) != "name")
          DropdownMenuItem(
            value: i.toString(),
            child: Text(
              Provider.of<FoodsModel>(context)
                  .getSecondFoodNames('dairies', i - 100),
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

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        value: "100",
        child: Text(
          "Et",
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      DropdownMenuItem(
        value: "200",
        child: Text(
          "Sut",
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      DropdownMenuItem(
        value: "300",
        child: Text(
          "Meyve",
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      DropdownMenuItem(
        value: "400",
        child: Text(
          "Cikolata",
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
