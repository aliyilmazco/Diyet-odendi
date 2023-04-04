import 'package:d/core/constant/color_constant.dart';
import 'package:flutter/material.dart';

class SliderSelectionWidget extends StatefulWidget {
  SliderSelectionWidget({
    super.key,
    required this.sliderValue,
    required this.baseSize,
    required this.maxSize,
  });
  double sliderValue;
  double baseSize;
  double maxSize;

  @override
  State<SliderSelectionWidget> createState() => _SliderSelectionWidgetState();
}

class _SliderSelectionWidgetState extends State<SliderSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: const SliderThemeData(
        inactiveTrackColor: Colors.black,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13),
        trackHeight: 0.5,
        overlayShape: RoundSliderOverlayShape(
          overlayRadius: 30.0,
        ),
      ),
      child: Slider(
        min: widget.baseSize,
        max: widget.maxSize,
        activeColor: ColorConst.sliderInActive,
        inactiveColor: ColorConst.sliderInActive,
        thumbColor: ColorConst.menBoxGrey,
        value: widget.sliderValue,
        onChanged: (value) {
          widget.sliderValue = value;
        },
      ),
    );
  }
}
