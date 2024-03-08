// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:hurry_app/token_model/token_model.dart';

class StoreBusLineModel extends ResultModel {
  String name;
  int price;
  String city_name;
  List<Map<String, dynamic>> bus_line;
  StoreBusLineModel({
    required this.name,
    required this.price,
    required this.city_name,
    required this.bus_line,
  });

  StoreBusLineModel copyWith({
    String? name,
    int? price,
    String? city_name,
    List<Map<String, dynamic>>? bus_line,
  }) {
    return StoreBusLineModel(
      name: name ?? this.name,
      price: price ?? this.price,
      city_name: city_name ?? this.city_name,
      bus_line: bus_line ?? this.bus_line,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'city_name': city_name,
      'bus_line': bus_line.asMap(),
    };
  }

  factory StoreBusLineModel.fromMap(Map<String, dynamic> map) {
    return StoreBusLineModel(
      name: map['name'] as String,
      price: map['price'] as int,
      city_name: map['city_name'] as String, bus_line: map['name'],
      // bus_line: List <Map<String, dynamic>>.fromMap(map['bus_line'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory StoreBusLineModel.fromJson(String source) =>
      StoreBusLineModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StoreBusLineModel(name: $name, price: $price, city_name: $city_name, bus_line: $bus_line)';
  }

  @override
  bool operator ==(covariant StoreBusLineModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.price == price &&
        other.city_name == city_name &&
        other.bus_line == bus_line;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        price.hashCode ^
        city_name.hashCode ^
        bus_line.hashCode;
  }
}

//////////////////////
class StoreBusLineModelResponse extends ResultModel {
  String name;
  int price;
  String city_name;
  String updated_at;
  String created_at;
  int id;
  StoreBusLineModelResponse({
    required this.name,
    required this.price,
    required this.city_name,
    required this.updated_at,
    required this.created_at,
    required this.id,
  });

  StoreBusLineModelResponse copyWith({
    String? name,
    int? price,
    String? city_name,
    String? updated_at,
    String? created_at,
    int? id,
  }) {
    return StoreBusLineModelResponse(
      name: name ?? this.name,
      price: price ?? this.price,
      city_name: city_name ?? this.city_name,
      updated_at: updated_at ?? this.updated_at,
      created_at: created_at ?? this.created_at,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'city_name': city_name,
      'updated_at': updated_at,
      'created_at': created_at,
      'id': id,
    };
  }

  factory StoreBusLineModelResponse.fromMap(Map<String, dynamic> map) {
    return StoreBusLineModelResponse(
      name: map['name'] as String,
      price: map['price'] as int,
      city_name: map['city_name'] as String,
      updated_at: map['updated_at'] as String,
      created_at: map['created_at'] as String,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory StoreBusLineModelResponse.fromJson(String source) =>
      StoreBusLineModelResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StoreBusLineModelResponse(name: $name, price: $price, city_name: $city_name, updated_at: $updated_at, created_at: $created_at, id: $id)';
  }

  @override
  bool operator ==(covariant StoreBusLineModelResponse other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.price == price &&
        other.city_name == city_name &&
        other.updated_at == updated_at &&
        other.created_at == created_at &&
        other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        price.hashCode ^
        city_name.hashCode ^
        updated_at.hashCode ^
        created_at.hashCode ^
        id.hashCode;
  }
}
