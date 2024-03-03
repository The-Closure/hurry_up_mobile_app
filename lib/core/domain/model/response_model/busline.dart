import 'dart:convert';

import 'package:riide/core/domain/model/model.dart';

class BuslineModel extends Model {
  String name;
  double longitude;
  double latitude;

  BuslineModel({
    required this.name,
    required this.longitude,
    required this.latitude,
  });

  BuslineModel copyWith({
    String? name,
    double? longitude,
    double? latitude,
  }) =>
      BuslineModel(
        name: name ?? this.name,
        longitude: longitude ?? this.longitude,
        latitude: latitude ?? this.latitude,
      );

  factory BuslineModel.fromJson(String str) =>
      BuslineModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BuslineModel.fromMap(Map<String, dynamic> json) => BuslineModel(
        name: json["name"],
        longitude: json["longitude"]?.toDouble(),
        latitude: json["latitude"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "longitude": longitude,
        "latitude": latitude,
      };
}
