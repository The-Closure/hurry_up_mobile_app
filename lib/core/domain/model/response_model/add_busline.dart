
import 'dart:convert';

import 'package:riide/core/domain/model/model.dart';

class AddBuslineModel extends Model{
    String name;
    int price;
    String cityName;
    List<BusLine> busLine;

    AddBuslineModel({
        required this.name,
        required this.price,
        required this.cityName,
        required this.busLine,
    });

    AddBuslineModel copyWith({
        String? name,
        int? price,
        String? cityName,
        List<BusLine>? busLine,
    }) => 
        AddBuslineModel(
            name: name ?? this.name,
            price: price ?? this.price,
            cityName: cityName ?? this.cityName,
            busLine: busLine ?? this.busLine,
        );

    factory AddBuslineModel.fromJson(String str) => AddBuslineModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AddBuslineModel.fromMap(Map<String, dynamic> json) => AddBuslineModel(
        name: json["name"],
        price: json["price"],
        cityName: json["city_name"],
        busLine: List<BusLine>.from(json["bus_line"].map((x) => BusLine.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "price": price,
        "city_name": cityName,
        "bus_line": List<dynamic>.from(busLine.map((x) => x.toMap())),
    };
}

class BusLine {
    String name;
    double longitude;
    double latitude;

    BusLine({
        required this.name,
        required this.longitude,
        required this.latitude,
    });

    BusLine copyWith({
        String? name,
        double? longitude,
        double? latitude,
    }) => 
        BusLine(
            name: name ?? this.name,
            longitude: longitude ?? this.longitude,
            latitude: latitude ?? this.latitude,
        );

    factory BusLine.fromJson(String str) => BusLine.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory BusLine.fromMap(Map<String, dynamic> json) => BusLine(
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




class BuslineResponseModel extends Model{
    String name;
    int price;
    String cityName;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    BuslineResponseModel({
        required this.name,
        required this.price,
        required this.cityName,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    BuslineResponseModel copyWith({
        String? name,
        int? price,
        String? cityName,
        DateTime? updatedAt,
        DateTime? createdAt,
        int? id,
    }) => 
        BuslineResponseModel(
            name: name ?? this.name,
            price: price ?? this.price,
            cityName: cityName ?? this.cityName,
            updatedAt: updatedAt ?? this.updatedAt,
            createdAt: createdAt ?? this.createdAt,
            id: id ?? this.id,
        );

    factory BuslineResponseModel.fromJson(String str) => BuslineResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory BuslineResponseModel.fromMap(Map<String, dynamic> json) => BuslineResponseModel(
        name: json["name"],
        price: json["price"],
        cityName: json["city_name"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "price": price,
        "city_name": cityName,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
