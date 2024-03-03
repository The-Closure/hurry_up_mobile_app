import 'package:flutter/material.dart';
import 'package:riide/core/domain/model/response_model/vertex.dart';
import 'package:riide/core/resources/color.dart';

Future dialog({
  required BuildContext context,
  required List<VertexModel> vertex,
  required Widget? Function(BuildContext, int) itemBuilder,
}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: MainColor().appPrimerySolidBlack,
      content: SizedBox(
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.width / 1.2,
        child: ListView.builder(
          itemBuilder: itemBuilder,
          itemCount: vertex.length,
        ),
      ),
    ),
  );
}


