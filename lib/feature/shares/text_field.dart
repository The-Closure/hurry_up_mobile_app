import 'package:flutter/material.dart';
import 'package:riide/core/resources/color.dart';

class MainTextField extends StatelessWidget {
  MainTextField(
      {Key? key,
      required this.context,
      required this.controller,
      required this.labelText})
      : super(key: key);

  BuildContext context;
  TextEditingController controller;
  String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 14,
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: ShapeDecoration(
        color: MainColor().backgroundTextFieldColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: TextField(
        style: TextStyle(color: Colors.white),
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
