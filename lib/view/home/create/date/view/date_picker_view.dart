import 'package:d/core/base/view/base_view.dart';
import 'package:d/core/constant/color_constant.dart';
import 'package:d/product/widget/create/date_container_widget.dart';
import 'package:d/view/home/create/date/viewmodel/date_picker_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class DatePickerView extends StatefulWidget {
  const DatePickerView({super.key});

  @override
  State<DatePickerView> createState() => _DatePickerViewState();
}

class _DatePickerViewState extends DatePickerViewModel {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      builder: (context, width, height, appBar) {
        return Scaffold(
          appBar: AppBar(
            shadowColor: Colors.transparent,
            foregroundColor: ColorConst.createPageText,
            backgroundColor: Colors.transparent,
            title: Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: Center(
                child: Text(
                  'Calendar',
                  style: GoogleFonts.raleway(
                    color: ColorConst.sliderTitle,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          backgroundColor: ColorConst.appBgColorWhite,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height / 2.7,
                child: Lottie.asset('assets/animations/doctor.json'),
              ),
              buildCalendarDialogButton(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios),
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  Text(
                    'Today',
                    style: GoogleFonts.raleway(
                      color: ColorConst.sliderTitle,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                    ),
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              DateContainerWidget(
                width: width,
                height: height,
                time: '09:30 AM',
                doctor: 'Dr.Serdem Islamoglu',
                status: "Onaylandi",
              ),
              const SizedBox(
                height: 10,
              ),
              DateContainerWidget(
                width: width,
                height: height,
                time: '09:30 AM',
                doctor: 'Dr.Serdem Islamoglu',
                status: "Onaylandi",
              ),
              const SizedBox(
                height: 10,
              ),
              DateContainerWidget(
                width: width,
                height: height,
                time: '09:30 AM',
                doctor: 'Dr.Serdem Islamoglu',
                status: "Onaylandi",
              ),
              const SizedBox(
                height: 10,
              ),
              DateContainerWidget(
                width: width,
                height: height,
                time: '09:30 AM',
                doctor: 'Dr.Serdem Islamoglu',
                status: "Onaylandi",
              ),
            ],
          ),
        );
      },
    );
  }
}
