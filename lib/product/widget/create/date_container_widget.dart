import 'package:d/core/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DateContainerWidget extends StatelessWidget {
  const DateContainerWidget({
    super.key,
    required this.width,
    required this.height,
    required this.time,
    required this.doctor,
    required this.status,
  });
  final double width;
  final double height;
  final String time;
  final String doctor;
  final String status;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width / 1.1,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorConst.createBox,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            time,
            style: GoogleFonts.inter(
              color: ColorConst.createPageText,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            doctor,
            style: GoogleFonts.inter(
              color: ColorConst.createPageText,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            status,
            style: GoogleFonts.inter(
              color: ColorConst.createPageText,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
