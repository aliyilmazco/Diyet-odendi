import 'package:d/core/base/view/base_view.dart';
import 'package:d/core/constant/color_constant.dart';
import 'package:d/view/auth/signup/model/sign_up_model.dart';
import 'package:d/view/home/profile/model/chart_data.dart';
import 'package:d/view/home/profile/viewmodel/profile_viewmodel.dart';
import 'package:d/view/home/settings/model/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          Provider.of<SettingsModel>(context).downloadUrl !=
                                  null
                              ? NetworkImage(Provider.of<SettingsModel>(context)
                                  .downloadUrl!) as ImageProvider<Object>
                              : const AssetImage('assets/images/profile.png'),
                    ),
                  ),
                  Positioned(
                    right: width / 2.5,
                    top: height / 5,
                    child: Column(
                      children: [
                        Text(
                          Provider.of<UserModelProvider>(context, listen: false)
                              .fullName,
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
                                  double.tryParse(
                                              Provider.of<UserModelProvider>(
                                                      context,
                                                      listen: false)
                                                  .targetWeight) !=
                                          null
                                      ? double.tryParse(
                                              Provider.of<UserModelProvider>(
                                                      context,
                                                      listen: false)
                                                  .targetWeight)!
                                          .toInt()
                                          .toString()
                                      : 'undefined',
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
                  Positioned(
                    top: height / 2,
                    left: width / 15,
                    child: Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: SizedBox(
                        height: 170,
                        width: width / 1.2,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Kilo Takip Cizelgesi',
                              style: GoogleFonts.raleway(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: ColorConst.createPageText,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: width / 15),
                              child: SizedBox(
                                height: 124,
                                width: width / 1.2,
                                child: SfCartesianChart(
                                  margin: const EdgeInsets.all(0),
                                  borderWidth: 0,
                                  plotAreaBorderWidth: 0,
                                  borderColor: Colors.transparent,
                                  primaryXAxis: NumericAxis(
                                    minimum: 1,
                                    maximum: 7,
                                    interval: 1,
                                    isVisible: false,
                                  ),
                                  primaryYAxis: NumericAxis(
                                    minimum: 70,
                                    maximum: 76,
                                    interval: 1,
                                    isVisible: false,
                                    borderWidth: 0,
                                    borderColor: Colors.transparent,
                                  ),
                                  series: <ChartSeries<ChartData, int>>[
                                    SplineAreaSeries(
                                      splineType: SplineType.natural,
                                      dataSource: data,
                                      xValueMapper: (ChartData data, _) =>
                                          data.day,
                                      yValueMapper: (ChartData data, _) =>
                                          data.weight,
                                      gradient: const LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          ColorConst.appBgColorWhite,
                                          ColorConst.appBgColorWhite,
                                          ColorConst.appBgColorWhite,
                                        ],
                                      ),
                                    ),
                                    SplineSeries(
                                      color: ColorConst.sliderText,
                                      width: 1,
                                      markerSettings: const MarkerSettings(
                                        color: ColorConst.dotColor,
                                        borderWidth: 1,
                                        shape: DataMarkerType.circle,
                                        isVisible: false,
                                        borderColor: ColorConst.dotColor,
                                      ),
                                      dataSource: data,
                                      xValueMapper: (ChartData data, _) =>
                                          data.day,
                                      yValueMapper: (ChartData data, _) =>
                                          data.weight,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
