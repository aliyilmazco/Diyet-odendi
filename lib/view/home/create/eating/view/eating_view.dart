import 'package:d/core/base/view/base_view.dart';
import 'package:d/core/constant/color_constant.dart';
import 'package:d/product/widget/create/dropdown_widget.dart';
import 'package:d/product/widget/create/eating_widget.dart';
import 'package:d/view/home/create/eating/model/eating_model.dart';
import 'package:d/view/home/create/eating/viewmodel/eating_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class EatingView extends StatefulWidget {
  const EatingView({super.key});

  @override
  State<EatingView> createState() => _EatingViewState();
}

class _EatingViewState extends EatingViewModel {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      builder: (context, width, height, appBar) {
        return Scaffold(
          backgroundColor: ColorConst.appBgColorWhite,
          appBar: AppBar(
            centerTitle: true,
            shadowColor: Colors.transparent,
            foregroundColor: ColorConst.createPageText,
            backgroundColor: Colors.transparent,
            title: Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: Center(
                child: Text(
                  'OGUNLAR',
                  style: GoogleFonts.raleway(
                    color: ColorConst.sliderTitle,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          body: Center(
            child: Column(
              children: [
                Form(
                  key: dropdownFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      DropDownWidget(
                        isItFirst: false,
                        selectedTitle:
                            Provider.of<FoodsModel>(context).selectedValue2,
                        selectedValue: Provider.of<FoodsModel>(
                          context,
                        ).selectedValue2,
                        width: width,
                        items: dropdownItems2.toSet().toList(),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      DropDownWidget(
                        isItFirst: true,
                        selectedTitle:
                            Provider.of<FoodsModel>(context).selectedValue,
                        selectedValue:
                            Provider.of<FoodsModel>(context).selectedValue,
                        width: width,
                        items: dropdownItems,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: width * 0.4,
                      height: 45,
                      decoration: BoxDecoration(
                        color: ColorConst.mainBoxBg,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              Provider.of<FoodsModel>(context, listen: false)
                                  .counterDecrease();
                            },
                            icon: const Icon(
                              Icons.remove,
                            ),
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          Center(
                            child: Text(
                              Provider.of<FoodsModel>(context).count.toString(),
                              style: GoogleFonts.raleway(
                                color: ColorConst.createPageText,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Provider.of<FoodsModel>(context, listen: false)
                                  .counterIncrease();
                            },
                            icon: const Icon(
                              Icons.add,
                            ),
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final selectedItem = Provider.of<FoodsModel>(context,
                                listen: false)
                            .menuItems2!
                            .firstWhereOrNull((element) =>
                                element.value ==
                                Provider.of<FoodsModel>(context, listen: false)
                                    .selectedValue2);
                        String? text;
                        if (selectedItem!.child is Text) {
                          final textWidget = selectedItem.child as Text;
                          text = textWidget.data.toString();
                        }

                        Provider.of<FoodsModel>(context, listen: false)
                            .addToWidgetList(EatingRowWidget(
                          title: text ?? "empty",
                          value: Provider.of<FoodsModel>(context, listen: false)
                              .selectedValue2
                              .toString(),
                        ));

                        Provider.of<FoodsModel>(context, listen: false).count =
                            1;
                        Provider.of<FoodsModel>(context, listen: false)
                            .addCalculateCalorie();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConst.createButton,
                        shadowColor: Colors.black.withOpacity(0.7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Ekle',
                        style: GoogleFonts.raleway(
                          color: ColorConst.createPageText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Provider.of<FoodsModel>(context, listen: false)
                            .deleteWidgetList();
                        Provider.of<FoodsModel>(context, listen: false)
                            .deleteCalculateCalorie();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConst.createButton,
                        shadowColor: Colors.black.withOpacity(0.7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Temizle',
                        style: GoogleFonts.raleway(
                          color: ColorConst.createPageText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: width / 1.15,
                  height: height / 4,
                  decoration: BoxDecoration(
                    color: ColorConst.mainBoxBg,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Provider.of<FoodsModel>(context).widgetList.isEmpty
                            ? const Text('Liste bos')
                            : Column(
                                children:
                                    Provider.of<FoodsModel>(context).widgetList,
                              ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Toplam Kalori : ${Provider.of<FoodsModel>(context).total.toString()}",
                  style: GoogleFonts.raleway(
                    color: ColorConst.createPageText,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(width / 1.5, 40),
                    backgroundColor: ColorConst.createButton,
                    shadowColor: Colors.black.withOpacity(0.7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Kaydet',
                    style: GoogleFonts.raleway(
                      color: ColorConst.createPageText,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
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
