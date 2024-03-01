import 'dart:convert';

import 'package:riide/core/domain/model/model.dart';

class CompleteOrderModel extends Model {
  int id;

  CompleteOrderModel({
    required this.id,
  });

  CompleteOrderModel copyWith({
    int? id,
  }) =>
      CompleteOrderModel(
        id: id ?? this.id,
      );

  factory CompleteOrderModel.fromJson(String str) =>
      CompleteOrderModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CompleteOrderModel.fromMap(Map<String, dynamic> json) =>
      CompleteOrderModel(
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
      };
}

class CompleteOrderResponseModel extends Model{
    String message;

    CompleteOrderResponseModel({
        required this.message,
    });

    CompleteOrderResponseModel copyWith({
        String? message,
    }) => 
        CompleteOrderResponseModel(
            message: message ?? this.message,
        );

    factory CompleteOrderResponseModel.fromJson(String str) => CompleteOrderResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CompleteOrderResponseModel.fromMap(Map<String, dynamic> json) => CompleteOrderResponseModel(
        message: json["message"],
    );

    Map<String, dynamic> toMap() => {
        "message": message,
    };
}

