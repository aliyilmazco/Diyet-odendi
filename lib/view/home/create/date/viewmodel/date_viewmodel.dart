import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:d/core/constant/color_constant.dart';
import 'package:d/view/home/create/date/view/date_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class DateViewModel extends State<DateView> {
  late DateTime selectedDate;
  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    selectedDate = DateTime.now().add(const Duration(days: 2));
  }

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
                CalendarTimeline(
                  showYears: false,
                  initialDate: selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(
                    const Duration(days: 365 * 4),
                  ),
                  onDateSelected: (date) => setState(
                    () => {
                      selectedDate = date,
                    },
                  ),
                  leftMargin: 20,
                  monthColor: ColorConst.sliderTitle,
                  dayColor: ColorConst.createPageText,
                  dayNameColor: ColorConst.appBgColorWhite,
                  activeDayColor: ColorConst.appBgColorWhite,
                  activeBackgroundDayColor: ColorConst.createPageText,
                  dotsColor: ColorConst.appBgColorWhite,
                  selectableDayPredicate: (date) => date.day != 23,
                  locale: 'tr',
                ),
                const SizedBox(height: 20),
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
                    child: SizedBox(
                      width: width / 1.1,
                      height: 70,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/breakfast.svg',
                            width: 30,
                            height: 50,
                          ),
                          const Text('Breakfast'),
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
