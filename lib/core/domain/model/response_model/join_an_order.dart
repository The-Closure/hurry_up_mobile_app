import 'dart:convert';

import 'package:riide/core/domain/model/model.dart';

class JoinOrderModel extends Model {
  int orderId;
  int numOfPeople;

  JoinOrderModel({
    required this.orderId,
    required this.numOfPeople,
  });

  JoinOrderModel copyWith({
    int? orderId,
    int? numOfPeople,
  }) =>
      JoinOrderModel(
        orderId: orderId ?? this.orderId,
        numOfPeople: numOfPeople ?? this.numOfPeople,
      );

  factory JoinOrderModel.fromJson(String str) =>
      JoinOrderModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory JoinOrderModel.fromMap(Map<String, dynamic> json) => JoinOrderModel(
        orderId: json["order_id"],
        numOfPeople: json["num_of_people"],
      );

  Map<String, dynamic> toMap() => {
        "order_id": orderId,
        "num_of_people": numOfPeople,
      };
}

class JoinOrderResponseModel extends Model{
    int id;
    String userIds;
    int topPassengerCount;
    int currentPassengerCount;
    int destinationVerticesId;
    dynamic estimatedPrice;
    bool isHurry;
    String status;
    String genders;
    DateTime createdAt;
    DateTime updatedAt;

    JoinOrderResponseModel({
        required this.id,
        required this.userIds,
        required this.topPassengerCount,
        required this.currentPassengerCount,
        required this.destinationVerticesId,
        required this.estimatedPrice,
        required this.isHurry,
        required this.status,
        required this.genders,
        required this.createdAt,
        required this.updatedAt,
    });

    JoinOrderResponseModel copyWith({
        int? id,
        String? userIds,
        int? topPassengerCount,
        int? currentPassengerCount,
        int? destinationVerticesId,
        dynamic estimatedPrice,
        bool? isHurry,
        String? status,
        String? genders,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        JoinOrderResponseModel(
            id: id ?? this.id,
            userIds: userIds ?? this.userIds,
            topPassengerCount: topPassengerCount ?? this.topPassengerCount,
            currentPassengerCount: currentPassengerCount ?? this.currentPassengerCount,
            destinationVerticesId: destinationVerticesId ?? this.destinationVerticesId,
            estimatedPrice: estimatedPrice ?? this.estimatedPrice,
            isHurry: isHurry ?? this.isHurry,
            status: status ?? this.status,
            genders: genders ?? this.genders,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory JoinOrderResponseModel.fromJson(String str) => JoinOrderResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory JoinOrderResponseModel.fromMap(Map<String, dynamic> json) => JoinOrderResponseModel(
        id: json["id"],
        userIds: json["user_ids"],
        topPassengerCount: json["top_passenger_count"],
        currentPassengerCount: json["current_passenger_count"],
        destinationVerticesId: json["destination_vertices_id"],
        estimatedPrice: json["estimated_price"],
        isHurry: json["is_hurry"],
        status: json["status"],
        genders: json["genders"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "user_ids": userIds,
        "top_passenger_count": topPassengerCount,
        "current_passenger_count": currentPassengerCount,
        "destination_vertices_id": destinationVerticesId,
        "estimated_price": estimatedPrice,
        "is_hurry": isHurry,
        "status": status,
        "genders": genders,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
