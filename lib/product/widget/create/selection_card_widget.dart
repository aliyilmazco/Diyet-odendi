import 'package:d/core/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectionGenderCardWidget extends StatefulWidget {
  SelectionGenderCardWidget({
    super.key,
    required this.svgRoot,
    required this.cardText,
    this.function,
    this.isSelected,
  });
  final String svgRoot;
  final String cardText;
  bool? isSelected;
  VoidCallback? function;
  @override
  State<SelectionGenderCardWidget> createState() =>
      _SelectionGenderCardWidgetState();
}

class _SelectionGenderCardWidgetState extends State<SelectionGenderCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Card(
              color: widget.isSelected!
                  ? ColorConst.menBoxGrey
                  : ColorConst.appBgColorWhite,
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  color: ColorConst.womenBoxBorder,
                  width: 0.1,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    30,
                  ),
                ),
              ),
              child: InkWell(
                splashColor: ColorConst.profileText,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    30,
                  ),
                ),
                onTap: widget.function,
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Center(
                    child: SvgPicture.asset(
                      widget.svgRoot,
                      width: 30,
                    ),
                  ),
                ),
              ),
            ),
            widget.isSelected!
                ? const Positioned(
                    right: 20,
                    top: 15,
                    child: Icon(
                      Icons.check_circle,
                    ),
                  )
                : Positioned(
                    right: 20,
                    top: 20,
                    child: Container(),
                  ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          widget.cardText,
          style: GoogleFonts.raleway(
            color: ColorConst.createPageText,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
