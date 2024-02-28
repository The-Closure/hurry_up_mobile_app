import 'dart:convert';

import 'package:riide/core/domain/model/model.dart';

class OrdersModel extends Model {
  int topPassengerCount;
  int currentPassengerCount;
  int destinationVerticesId;
  bool isHurry;
  String? genders;
  String? userIds;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  OrdersModel({
    required this.topPassengerCount,
    required this.currentPassengerCount,
    required this.destinationVerticesId,
    required this.isHurry,
    required this.genders,
    this.userIds,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  OrdersModel copyWith({
    int? topPassengerCount,
    int? currentPassengerCount,
    int? destinationVerticesId,
    bool? isHurry,
    String? genders,
    String? userIds,
    DateTime? updatedAt,
    DateTime? createdAt,
    int? id,
  }) =>
      OrdersModel(
        topPassengerCount: topPassengerCount ?? this.topPassengerCount,
        currentPassengerCount:
            currentPassengerCount ?? this.currentPassengerCount,
        destinationVerticesId:
            destinationVerticesId ?? this.destinationVerticesId,
        isHurry: isHurry ?? this.isHurry,
        genders: genders ?? this.genders,
        userIds: userIds ?? this.userIds,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
      );

  factory OrdersModel.fromJson(String str) =>
      OrdersModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrdersModel.fromMap(Map<String, dynamic> json) => OrdersModel(
        topPassengerCount: json["top_passenger_count"],
        currentPassengerCount: json["current_passenger_count"],
        destinationVerticesId: json["destination_vertices_id"],
        isHurry: json["is_hurry"],
        genders: json["genders"],
        userIds: json["user_ids"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "top_passenger_count": topPassengerCount,
        "current_passenger_count": currentPassengerCount,
        "destination_vertices_id": destinationVerticesId,
        "is_hurry": isHurry,
        "genders": genders,
        "user_ids": userIds,
        "updated_at": updatedAt!.toIso8601String(),
        "created_at": createdAt!.toIso8601String(),
        "id": id,
      };
}
