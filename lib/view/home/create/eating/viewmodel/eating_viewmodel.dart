import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d/product/service/database_service.dart';
import 'package:d/product/widget/login/snackbar_widget.dart';
import 'package:d/view/auth/signup/model/sign_up_model.dart';
import 'package:d/view/home/create/eating/model/eating_model.dart';
import 'package:d/view/home/create/eating/view/eating_view.dart';
import 'package:d/view/home/target/model/diyetList_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

abstract class EatingViewModel extends State<EatingView> {
  final dropdownFormKey = GlobalKey<FormState>();
  String selectedValue = "0";
  String selectedValue2 = "0";
  String eatenId = '';

  String currentDate = DateFormat('dd').format(DateTime.now());
  String currentDayName = DateFormat('EEEE').format(DateTime.now());
  String formattedTime = DateTime.now().toString().substring(11, 16);

  @override
  void initState() {
    getEatenID();

    super.initState();
  }

  getEatenID() async {
    QuerySnapshot snapshot =
        await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
            .gettingUserData(
                Provider.of<UserModelProvider>(context, listen: false).email);
    eatenId = snapshot.docs[0]['eaten'][0];
  }

  List<DropdownMenuItem<String>> get dropdownItems2 {
    List<DropdownMenuItem<String>> menuItems = [
      for (int i = 0;
          i < Provider.of<FoodsModel>(context).getFoodsNamesNumber();
          i++)
        if (Provider.of<FoodsModel>(context).getFoodNames(i) != "name")
          DropdownMenuItem(
            value: i.toString(),
            child: Text(
              Provider.of<FoodsModel>(context).getFoodNames(i),
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItems3 {
    List<DropdownMenuItem<String>> menuItems = [
      for (int i = 0;
          i < Provider.of<FoodsModel>(context).getSecondFoodNumber();
          i++)
        DropdownMenuItem(
          value: i.toString(),
          child: Text(
            Provider.of<FoodsModel>(context).getSecondFoodNames(
                Provider.of<FoodsModel>(
                  context,
                ).selectedOgun,
                i),
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
    ];
    return menuItems;
  }

  sendEaten() {
    if (Provider.of<FoodsModel>(context, listen: false).widgetList.isNotEmpty) {
      Map<String, dynamic> eatenMap = {
        "eaten": Provider.of<FoodsModel>(context, listen: false).listFoodNames,
        "sender":
            Provider.of<UserModelProvider>(context, listen: false).fullName,
        'howMuch':
            Provider.of<FoodsModel>(context, listen: false).counterForOut,
        "time": DateTime.now().millisecondsSinceEpoch,
        'day': currentDate,
        'dayName': currentDayName,
        'ogunTime': Provider.of<DiyetListModel>(context, listen: false).ogun,
        'totalCalorie': Provider.of<FoodsModel>(context, listen: false).total,
      };

      DatabaseService(
        uid: FirebaseAuth.instance.currentUser!.uid,
      ).sendEaten(
        eatenId,
        eatenMap,
      );
      context.pop();
      context.pop();
      Provider.of<FoodsModel>(context, listen: false).listFoodNames.clear();
      Provider.of<FoodsModel>(context, listen: false).counterForOut = 0;
      Provider.of<FoodsModel>(context, listen: false).widgetList.clear();
      Provider.of<FoodsModel>(context, listen: false).total = 0;
    }
    showSnackBar(context, Colors.blueAccent, 'Added Successfully');
  }
}
