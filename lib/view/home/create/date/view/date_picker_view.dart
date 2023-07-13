// ignore_for_file: unrelated_type_equality_checks

import 'package:d/core/base/view/base_view.dart';
import 'package:d/core/constant/color_constant.dart';
import 'package:d/view/home/create/date/model/date_model.dart';
import 'package:d/view/home/create/date/viewmodel/date_picker_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interval_time_selector/show_time_picker/day_time_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class DatePickerView extends StatefulWidget {
  const DatePickerView({super.key});

  @override
  State<DatePickerView> createState() => _DatePickerViewState();
}

class _DatePickerViewState extends DatePickerViewModel {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TimeOfDay _time = TimeOfDay.now().replacing(hour: 14, minute: 30);

    void onTimeChanged(TimeOfDay newTime) {
      setState(() {
        _time = newTime;
      });
    }

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
                  'Görüşme Tarihi Al',
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
              SizedBox(
                width: width / 2.5,
                height: 37,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      showPicker(
                        workingHours: [0, 1, 9, 12, 11, 12, 13, 15, 19, 23],
                        context: context,
                        value: _time,
                        ascending: true,
                        onChange: onTimeChanged,
                        maxMinuteAtMaximumHour: 40,
                        minMinuteAtMinimumHour: 20,
                        onChangeDateTime: (DateTime dateTime) {
                          debugPrint("[debug datetime]:  $dateTime");
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ColorConst.createButton,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Bir Saat Seciniz',
                    style: GoogleFonts.raleway(
                      color: ColorConst.createPageText,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
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
                    'Görüşmelerim',
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
                height: 10,
              ),
              SizedBox(
                width: width / 1.1,
                height: height / 3.5,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Consumer<DateModel>(
                        builder: (context, dateModel, _) {
                          return dateModel.widgetList.isEmpty
                              ? const Text('Liste boş!')
                              : Column(
                                  children: dateModel.widgetList,
                                );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
