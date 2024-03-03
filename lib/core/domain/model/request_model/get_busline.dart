import 'dart:convert';

import 'package:riide/core/domain/model/model.dart';

class GetBuslineModel extends Model {
  int id;
  String name;
  int price;
  String cityName;
  dynamic busLine;
  DateTime createdAt;
  DateTime updatedAt;

  GetBuslineModel({
    required this.id,
    required this.name,
    required this.price,
    required this.cityName,
    required this.busLine,
    required this.createdAt,
    required this.updatedAt,
  });

  GetBuslineModel copyWith({
    int? id,
    String? name,
    int? price,
    String? cityName,
    dynamic busLine,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      GetBuslineModel(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        cityName: cityName ?? this.cityName,
        busLine: busLine ?? this.busLine,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory GetBuslineModel.fromJson(String str) =>
      GetBuslineModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetBuslineModel.fromMap(Map<String, dynamic> json) => GetBuslineModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        cityName: json["city_name"],
        busLine: json["bus_line"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "price": price,
        "city_name": cityName,
        "bus_line": busLine,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
