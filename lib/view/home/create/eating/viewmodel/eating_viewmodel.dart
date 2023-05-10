import 'package:d/view/home/create/eating/view/eating_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class EatingViewModel extends State<EatingView> {
  final dropdownFormKey = GlobalKey<FormState>();
  final String selectedValue = "100";
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

  List<DropdownMenuItem<String>> get dropdownItems2 {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        value: "100",
        child: Text(
          "Yiyecek",
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
          "Yiyecek2",
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
          "Yiyecek3",
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
          "Yiyecek4",
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
