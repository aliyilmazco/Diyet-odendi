import 'package:d/view/home/create/date/view/date_view.dart';
import 'package:flutter/material.dart';

abstract class DateViewModel extends State<DateView> {
  void showSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // set this to true
      builder: (_) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (_, controller) {
            return Container(
              color: Colors.blue[500],
              child: ListView.builder(
                controller: controller, // set this too
                itemBuilder: (_, i) => ListTile(title: Text('Item $i')),
              ),
            );
          },
        );
      },
    );
  }
}
