import 'dart:convert';

import 'package:riide/core/domain/model/model.dart';

class DeleteOrderModel extends Model{
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

    factory DeleteOrderModel.fromJson(String str) => DeleteOrderModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DeleteOrderModel.fromMap(Map<String, dynamic> json) => DeleteOrderModel(
        id: json["id"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
    };
}
