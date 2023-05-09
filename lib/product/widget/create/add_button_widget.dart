import 'package:flutter/material.dart';

class AddButtonWidget extends StatelessWidget {
  AddButtonWidget({super.key, required this.function});
  VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: function,
        icon: const Icon(Icons.add),
        iconSize: 25,
        color: Colors.black,
      ),
    );
  }
}
