
import 'dart:convert';

import 'package:riide/core/domain/model/model.dart';

class VertexModel extends Model{
    int id;
    int busLineId;
    String name;
    String latitude;
    String longitude;
    bool isBusy;
    dynamic busyAt;
    int feedbackCount;
    DateTime createdAt;
    DateTime updatedAt;

    VertexModel({
        required this.id,
        required this.busLineId,
        required this.name,
        required this.latitude,
        required this.longitude,
        required this.isBusy,
        required this.busyAt,
        required this.feedbackCount,
        required this.createdAt,
        required this.updatedAt,
    });

    VertexModel copyWith({
        int? id,
        int? busLineId,
        String? name,
        String? latitude,
        String? longitude,
        bool? isBusy,
        dynamic busyAt,
        int? feedbackCount,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        VertexModel(
            id: id ?? this.id,
            busLineId: busLineId ?? this.busLineId,
            name: name ?? this.name,
            latitude: latitude ?? this.latitude,
            longitude: longitude ?? this.longitude,
            isBusy: isBusy ?? this.isBusy,
            busyAt: busyAt ?? this.busyAt,
            feedbackCount: feedbackCount ?? this.feedbackCount,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory VertexModel.fromJson(String str) => VertexModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory VertexModel.fromMap(Map<String, dynamic> json) => VertexModel(
        id: json["id"],
        busLineId: json["bus_line_id"],
        name: json["name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        isBusy: json["is_busy"],
        busyAt: json["busy_at"],
        feedbackCount: json["feedback_count"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "bus_line_id": busLineId,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "is_busy": isBusy,
        "busy_at": busyAt,
        "feedback_count": feedbackCount,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
