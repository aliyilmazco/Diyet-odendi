import 'package:d/core/base/view/base_view.dart';
import 'package:d/core/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      builder: (context, width, height, appBar) {
        return Scaffold(
          backgroundColor: ColorConst.appBgColorWhite,
          body: Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: width,
                      height: height / 2,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50)),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: <Color>[
                            Color.fromRGBO(243, 244, 246, 1),
                            Color.fromRGBO(243, 244, 246, 0.1),
                          ],
                          tileMode: TileMode.mirror,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width / 6, top: 25),
                      child: SvgPicture.asset(
                        'assets/svg/login.svg',
                        width: width / 1.3,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 20,
                ),
                Padding(
                  padding: EdgeInsets.only(right: width / 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kisisel',
                        style: GoogleFonts.dmSans(
                          color: ColorConst.createPageText,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Diyetisyen',
                        style: GoogleFonts.dmSans(
                          color: ColorConst.createPageText,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.start,
                        'Uygulamaniza',
                        style: GoogleFonts.dmSans(
                          color: ColorConst.createPageText,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Hosgeldiniz!',
                        style: GoogleFonts.dmSans(
                          color: ColorConst.createPageText,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width / 1.4, top: height / 25),
                  child: FloatingActionButton(
                    backgroundColor: ColorConst.createPageText,
                    onPressed: () {
                      context.pushReplacement('/addInfo');
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
