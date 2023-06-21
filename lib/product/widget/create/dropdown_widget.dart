// ignore_for_file: no_logic_in_create_state

import 'package:d/core/constant/color_constant.dart';
import 'package:d/view/home/create/eating/model/eating_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({
    Key? key,
    required this.selectedValue,
    required this.width,
    required this.selectedTitle,
    required this.isItFirst,
    required this.items,
  }) : super(key: key);

  final String selectedValue;
  final String selectedTitle;
  final double width;
  final List<DropdownMenuItem<String>> items;
  final bool isItFirst;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
      decoration: BoxDecoration(
        color: ColorConst.mainBoxBg,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      width: widget.width / 1.15,
      child: DropdownButton<String>(
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black,
          size: 30,
        ),
        isExpanded: true,
        borderRadius: BorderRadius.circular(30),
        elevation: 2,
        alignment: Alignment.center,
        underline: Container(
          height: 0,
        ),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(
              () {
                selectedValue = newValue;

                if (widget.isItFirst) {
                  Provider.of<FoodsModel>(context, listen: false)
                      .selectedValue2 = selectedValue;
                  Provider.of<FoodsModel>(context, listen: false).menuItems2 =
                      widget.items;
                  Provider.of<FoodsModel>(context, listen: false)
                      .updateSelectedFood(
                    Provider.of<FoodsModel>(context, listen: false)
                        .getFoodNames(
                      (int.parse(selectedValue)),
                    ),
                  );
                } else {
                  Provider.of<FoodsModel>(context, listen: false)
                      .selectedValue = selectedValue;
                  Provider.of<FoodsModel>(context, listen: false).calorie =
                      Provider.of<FoodsModel>(context, listen: false)
                          .getSecondFoodValues(
                              Provider.of<FoodsModel>(context, listen: false)
                                  .getFoodNames((int.parse(selectedValue))),
                              1);
                  Provider.of<FoodsModel>(context, listen: false).menuItems1 =
                      widget.items;
                }
              },
            );
          }
        },
        value: selectedValue,
        dropdownColor: ColorConst.mainBoxBg,
        items: widget.items,
      ),
    );
  }
}
