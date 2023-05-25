import 'package:d/core/constant/color_constant.dart';
import 'package:d/product/widget/create/add_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LunchContainerWidget extends StatelessWidget {
  const LunchContainerWidget({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.text,
    required this.image,
    required this.function,
  });
  final double width;
  final double height;
  final String title;
  final String text;
  final String image;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        elevation: 2,
        color: ColorConst.mainBoxBg,
        child: SizedBox(
          width: width / 1.1,
          height: 70,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                ),
                width: 70,
                height: 70,
                child: Image.asset(
                  image,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.raleway(
                      color: ColorConst.createPageText,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    text,
                    style: GoogleFonts.raleway(
                      color: ColorConst.createPageText,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              AddButtonWidget(
                function: function,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
