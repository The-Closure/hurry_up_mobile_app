import 'dart:convert';

import 'package:riide/core/domain/model/model.dart';

class OrdersModel extends Model {
  int top_passenger_count;
  int current_passenger_count;
  int destination_vertices_id;
  int source_vertices_id;
  bool is_hurry;
  String genders;

  OrdersModel({
    required this.top_passenger_count,
    required this.current_passenger_count,
    required this.destination_vertices_id,
    required this.source_vertices_id,
    required this.is_hurry,
    required this.genders,
  });

  OrdersModel copyWith({
    int? topPassengerCount,
    int? currentPassengerCount,
    int? destinationVerticesId,
    int? sourceVerticesId,
    bool? isHurry,
    String? genders,
  }) =>
      OrdersModel(
        top_passenger_count: topPassengerCount ?? this.top_passenger_count,
        current_passenger_count:
            currentPassengerCount ?? this.current_passenger_count,
        destination_vertices_id:
            destinationVerticesId ?? this.destination_vertices_id,
        source_vertices_id: sourceVerticesId ?? this.source_vertices_id,
        is_hurry: isHurry ?? this.is_hurry,
        genders: genders ?? this.genders,
      );

  factory OrdersModel.fromJson(String str) =>
      OrdersModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrdersModel.fromMap(Map<String, dynamic> json) => OrdersModel(
        top_passenger_count: json["top_passenger_count"],
        current_passenger_count: json["current_passenger_count"],
        destination_vertices_id: json["destination_vertices_id"],
        source_vertices_id: json["source_vertices_id"],
        is_hurry: json["is_hurry"],
        genders: json["genders"],
      );

  Map<String, dynamic> toMap() => {
        "top_passenger_count": top_passenger_count,
        "current_passenger_count": current_passenger_count,
        "destination_vertices_id": destination_vertices_id,
        "source_vertices_id": source_vertices_id,
        "is_hurry": is_hurry,
        "genders": genders,
      };
}

class OrdersResponseModel extends Model {
  int topPassengerCount;
  int currentPassengerCount;
  int destinationVerticesId;
  int sourceVerticesId;
  bool isHurry;
  String genders;
  String userIds;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  OrdersResponseModel({
    required this.topPassengerCount,
    required this.currentPassengerCount,
    required this.destinationVerticesId,
    required this.sourceVerticesId,
    required this.isHurry,
    required this.genders,
    required this.userIds,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  OrdersResponseModel copyWith({
    int? topPassengerCount,
    int? currentPassengerCount,
    int? destinationVerticesId,
    int? sourceVerticesId,
    bool? isHurry,
    String? genders,
    String? userIds,
    DateTime? updatedAt,
    DateTime? createdAt,
    int? id,
  }) =>
      OrdersResponseModel(
        topPassengerCount: topPassengerCount ?? this.topPassengerCount,
        currentPassengerCount:
            currentPassengerCount ?? this.currentPassengerCount,
        destinationVerticesId:
            destinationVerticesId ?? this.destinationVerticesId,
        sourceVerticesId: sourceVerticesId ?? this.sourceVerticesId,
        isHurry: isHurry ?? this.isHurry,
        genders: genders ?? this.genders,
        userIds: userIds ?? this.userIds,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
      );

  factory OrdersResponseModel.fromJson(String str) =>
      OrdersResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrdersResponseModel.fromMap(Map<String, dynamic> json) =>
      OrdersResponseModel(
        topPassengerCount: json["top_passenger_count"],
        currentPassengerCount: json["current_passenger_count"],
        destinationVerticesId: json["destination_vertices_id"],
        sourceVerticesId: json["source_vertices_id"],
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
        "source_vertices_id": sourceVerticesId,
        "is_hurry": isHurry,
        "genders": genders,
        "user_ids": userIds,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
