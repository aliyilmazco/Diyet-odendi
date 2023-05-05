import 'package:d/core/constant/color_constant.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class DateButtonWidget extends StatelessWidget {
  DateButtonWidget({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.text,
    required this.function,
    required this.icon,
  });
  final double width;
  final double height;
  final String title;
  final String text;
  VoidCallback function;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: ColorConst.mainBoxBg,
        child: SizedBox(
          height: 65,
          width: width / 1.3,
          child: Row(
            children: [
              const SizedBox(
                width: 25,
              ),
              const Icon(
                Icons.chat,
                size: 35,
              ),
              const SizedBox(
                width: 25,
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
                width: 10,
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(100),
                ),
                child: IconButton(
                  onPressed: function,
                  icon: const Icon(Icons.add),
                  iconSize: 25,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
