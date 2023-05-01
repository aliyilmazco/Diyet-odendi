import 'package:d/core/base/view/base_view.dart';
import 'package:d/core/constant/color_constant.dart';
import 'package:d/view/home/profile/viewmodel/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ProfileViewModel {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      builder: (context, width, height, appBar) {
        return Scaffold(
          backgroundColor: ColorConst.appBgColorWhite,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: height / 1.4,
                    child: SvgPicture.asset(
                      'assets/svg/Base.svg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    right: width / 2.9,
                    top: height / 40,
                    child: const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(
                        'assets/images/profile.png',
                      ),
                    ),
                  ),
                  Positioned(
                    right: width / 2.7,
                    top: height / 5,
                    child: Column(
                      children: [
                        Text(
                          'SERDEM',
                          style: GoogleFonts.raleway(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: ColorConst.sliderTitle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: width / 15,
                    top: height / 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          elevation: 0.5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: SizedBox(
                            width: width / 2.5,
                            height: height / 4.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Image.asset('assets/images/target.png'),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Hedef Kilo',
                                  style: GoogleFonts.raleway(
                                    color: ColorConst.createPageText,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '53',
                                  style: GoogleFonts.raleway(
                                    color: ColorConst.createPageText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Card(
                          elevation: 0.5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: SizedBox(
                            width: width / 2.5,
                            height: height / 4.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Image.asset('assets/images/water.png'),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Gunluk Su Miktari',
                                  style: GoogleFonts.raleway(
                                    color: ColorConst.createPageText,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '500 ml',
                                  style: GoogleFonts.raleway(
                                    color: ColorConst.createPageText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
