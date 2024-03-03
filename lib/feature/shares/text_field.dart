import 'package:flutter/material.dart';
import 'package:riide/core/resources/color.dart';

// ignore: must_be_immutable
class MainTextField extends StatelessWidget {
  MainTextField(
      {super.key,
      required this.context,
      required this.controller,
      required this.labelText});

  BuildContext context;
  TextEditingController controller;
  String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 14,
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: ShapeDecoration(
        color: MainColor().appPrimerySolidBlack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
