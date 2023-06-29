// ignore_for_file: file_names

import 'package:d/core/base/view/base_view.dart';
import 'package:d/core/constant/color_constant.dart';
import 'package:d/view/home/target/viewmodel/diyetList_viewmodel.dart';
import 'package:flutter/material.dart';

class DiyetListView extends StatefulWidget {
  const DiyetListView({super.key});

  @override
  State<DiyetListView> createState() => _DiyetListViewState();
}

class _DiyetListViewState extends DiyetListViewModel {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      builder: (context, width, height, appBar) {
        return Scaffold(
          backgroundColor: ColorConst.appBgColorWhite,
          body: Column(
            children: [],
          ),
        );
      },
    );
  }
}
