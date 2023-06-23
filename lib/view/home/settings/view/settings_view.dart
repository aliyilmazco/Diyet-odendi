import 'package:d/core/constant/color_constant.dart';
import 'package:d/view/home/settings/viewmodel/settings_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends SettingsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        foregroundColor: ColorConst.createPageText,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: Center(
            child: Text(
              'Settings',
              style: GoogleFonts.raleway(
                color: ColorConst.sliderTitle,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                Positioned(
                  right: 0,
                  bottom: 1,
                  child: Container(
                    width: 30,
                    height: 30,
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
                      onPressed: () {
                        pickImage();
                      },
                      icon: const Icon(Icons.edit),
                      iconSize: 17,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Row(
            children: [
              const SizedBox(
                width: 35,
              ),
              const Icon(
                Icons.person,
                color: ColorConst.profileText,
              ),
              const SizedBox(
                width: 35,
              ),
              Text(
                'Hesabim',
                style: GoogleFonts.raleway(
                  color: ColorConst.profileText,
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: ColorConst.profileText,
              ),
              const SizedBox(
                width: 35,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 35,
              ),
              const Icon(
                Icons.notifications,
                color: ColorConst.profileText,
              ),
              const SizedBox(
                width: 35,
              ),
              Text(
                'Bildirimler',
                style: GoogleFonts.raleway(
                  color: ColorConst.profileText,
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: ColorConst.profileText,
              ),
              const SizedBox(
                width: 35,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 35,
              ),
              const Icon(
                Icons.remove_red_eye,
                color: ColorConst.profileText,
              ),
              const SizedBox(
                width: 35,
              ),
              Text(
                'Gorunum',
                style: GoogleFonts.raleway(
                  color: ColorConst.profileText,
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: ColorConst.profileText,
              ),
              const SizedBox(
                width: 35,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 35,
              ),
              const Icon(
                Icons.security,
                color: ColorConst.profileText,
              ),
              const SizedBox(
                width: 35,
              ),
              Text(
                'Gizlilik & Guvenlik',
                style: GoogleFonts.raleway(
                  color: ColorConst.profileText,
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: ColorConst.profileText,
              ),
              const SizedBox(
                width: 35,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 35,
              ),
              const Icon(
                Icons.volume_down,
                color: ColorConst.profileText,
              ),
              const SizedBox(
                width: 35,
              ),
              Text(
                'Ses',
                style: GoogleFonts.raleway(
                  color: ColorConst.profileText,
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: ColorConst.profileText,
              ),
              const SizedBox(
                width: 35,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 35,
              ),
              const Icon(
                Icons.language,
                color: ColorConst.profileText,
              ),
              const SizedBox(
                width: 35,
              ),
              Text(
                'Dil',
                style: GoogleFonts.raleway(
                  color: ColorConst.profileText,
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: ColorConst.profileText,
              ),
              const SizedBox(
                width: 35,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              logOut();
            },
            child: Row(
              children: [
                const SizedBox(
                  width: 35,
                ),
                const Icon(
                  Icons.login,
                  color: ColorConst.profileText,
                ),
                const SizedBox(
                  width: 35,
                ),
                Text(
                  'Cikis Yap',
                  style: GoogleFonts.raleway(
                    color: ColorConst.profileText,
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: ColorConst.profileText,
                ),
                const SizedBox(
                  width: 35,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
