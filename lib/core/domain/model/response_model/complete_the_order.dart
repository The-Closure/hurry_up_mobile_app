import 'dart:convert';

import 'package:riide/core/domain/model/model.dart';

class CompleteOrderModel extends Model{
    int? id;
    String? massage;

    CompleteOrderModel({
        this.id,
        this.massage,
    });

    CompleteOrderModel copyWith({
        int? id,
        String? massage,
    }) => 
        CompleteOrderModel(
            id: id ?? this.id,
            massage: massage ?? this.massage,
        );

    factory CompleteOrderModel.fromJson(String str) => CompleteOrderModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CompleteOrderModel.fromMap(Map<String, dynamic> json) => CompleteOrderModel(
        id: json["id"],
        massage: json["massage"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "massage": massage,
    };
}
