import 'package:d/core/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({
    super.key,
    required this.width,
    required this.height,
    required this.image,
    required this.foodNumber,
    required this.foodText,
    required this.foodCalorie,
  });
  final double width;
  final double height;
  final String image;
  final String foodText;
  final String foodNumber;
  final String foodCalorie;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorConst.mainBoxBg,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: ColorConst.mainBoxBorder,
          width: 3,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      borderOnForeground: true,
      elevation: 3,
      shadowColor: ColorConst.mainBoxBg,
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: width / 1.4,
        height: height / 15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Image.asset(image),
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  foodText,
                  style: GoogleFonts.glory(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ColorConst.createPageText,
                  ),
                ),
                Text(
                  foodNumber,
                  style: GoogleFonts.glory(
                    fontSize: 14,
                    color: ColorConst.createPageText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Text(
                foodCalorie,
                style: GoogleFonts.glory(
                  color: ColorConst.createPageText,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
