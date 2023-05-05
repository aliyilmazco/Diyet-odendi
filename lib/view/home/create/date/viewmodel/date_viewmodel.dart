import 'package:d/core/constant/color_constant.dart';
import 'package:d/view/home/create/date/view/date_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class DateViewModel extends State<DateView> {
  void showSheet(
    double width,
    double height,
  ) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      context: context,
      isScrollControlled: true, // set this to true
      builder: (_) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (_, controller) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    elevation: 2,
                    color: ColorConst.mainBoxBg,
                    child: Container(
                      width: width / 1.1,
                      height: 70,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/breakfast.svg',
                            width: 30,
                            height: 50,
                          ),
                          Text('Breakfast'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
