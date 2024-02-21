import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:riide/core/domain/model/model.dart';

class OrdersModel extends Model {
  int topPassengerCount;
  int currentPassengerCount;
  int destinationVerticesId;
  bool isHurry;

  OrdersModel({
    required this.topPassengerCount,
    required this.currentPassengerCount,
    required this.destinationVerticesId,
    required this.isHurry,
  });

  OrdersModel copyWith({
    int? topPassengerCount,
    int? currentPassengerCount,
    int? destinationVerticesId,
    bool? isHurry,
  }) =>
      OrdersModel(
        topPassengerCount: topPassengerCount ?? this.topPassengerCount,
        currentPassengerCount:
            currentPassengerCount ?? this.currentPassengerCount,
        destinationVerticesId:
            destinationVerticesId ?? this.destinationVerticesId,
        isHurry: isHurry ?? this.isHurry,
      );

  factory OrdersModel.fromJson(String str) =>
      OrdersModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrdersModel.fromMap(Map<String, dynamic> json) => OrdersModel(
        topPassengerCount: json["top_passenger_count"],
        currentPassengerCount: json["current_passenger_count"],
        destinationVerticesId: json["destination_vertices_id"],
        isHurry: json["is_hurry"],
      );

  Map<String, dynamic> toMap() => {
        "top_passenger_count": topPassengerCount,
        "current_passenger_count": currentPassengerCount,
        "destination_vertices_id": destinationVerticesId,
        "is_hurry": isHurry,
      };
}
