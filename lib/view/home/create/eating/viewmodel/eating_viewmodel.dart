import 'package:d/view/home/create/eating/model/eating_model.dart';
import 'package:d/view/home/create/eating/view/eating_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

abstract class EatingViewModel extends State<EatingView> {
  final dropdownFormKey = GlobalKey<FormState>();
  final String selectedValue = "100";
  List<Text> textList = [
    Text(
      "Et",
      style: GoogleFonts.roboto(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
    Text(
      "Sut",
      style: GoogleFonts.roboto(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
    Text(
      "Balik",
      style: GoogleFonts.roboto(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
  ];
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        value: "100",
        child: textList[0],
      ),
      DropdownMenuItem(
        value: "200",
        child: textList[1],
      ),
      DropdownMenuItem(
        value: "300",
        child: textList[2],
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
        value: "401",
        child: Text(
          "Yiyecek4",
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      DropdownMenuItem(
        value: "402",
        child: Text(
          "Yiyecek5",
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      DropdownMenuItem(
        value: "403",
        child: Text(
          "Yiyecek6",
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      DropdownMenuItem(
        value: "404",
        child: Text(
          "Yiyecek7",
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      DropdownMenuItem(
        value: "405",
        child: Text(
          "Yiyecek8",
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      DropdownMenuItem(
        value: "406",
        child: Text(
          "Yiyecek9",
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      DropdownMenuItem(
        value: "407",
        child: Text(
          "Yiyecek10",
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
