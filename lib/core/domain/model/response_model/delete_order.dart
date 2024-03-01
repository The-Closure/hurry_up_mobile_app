// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:riide/core/domain/model/model.dart';

class DeleteOrderModel extends Model {
  int id;

  DeleteOrderModel({
    required this.id,
  });

  DeleteOrderModel copyWith({
    int? id,
  }) =>
      DeleteOrderModel(
        id: id ?? this.id,
      );

  factory DeleteOrderModel.fromJson(String str) =>
      DeleteOrderModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeleteOrderModel.fromMap(Map<String, dynamic> json) =>
      DeleteOrderModel(
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
      };
}

class DeleteOrderResponseModel extends Model {
  String deleteMassage;
  DeleteOrderResponseModel({
    required this.deleteMassage,
  });
}
