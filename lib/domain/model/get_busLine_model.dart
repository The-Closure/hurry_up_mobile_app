// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hurry_app/token_model/token_model.dart';

class GetBusLinesModelResponse extends ResultModel {
  int id;
  String name;
  int price;
  String city_name;
  List<Map<String, dynamic>> bus_line;
  String created_at;
  String updated_at;
  GetBusLinesModelResponse({
    required this.id,
    required this.name,
    required this.price,
    required this.city_name,
    required this.bus_line,
    required this.created_at,
    required this.updated_at,
  });

  GetBusLinesModelResponse copyWith({
    int? id,
    String? name,
    int? price,
    String? city_name,
    List<Map<String, dynamic>>? bus_line,
    String? created_at,
    String? updated_at,
  }) {
    return GetBusLinesModelResponse(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      city_name: city_name ?? this.city_name,
      bus_line: bus_line ?? this.bus_line,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'city_name': city_name,
      'bus_line': bus_line,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory GetBusLinesModelResponse.fromMap(Map<String, dynamic> map) {
    return GetBusLinesModelResponse(
      id: map['id'] as int,
      name: map['name'] as String,
      price: map['price'] as int,
      city_name: map['city_name'] as String,
      bus_line: (json.decode(map['bus_line']) as List<dynamic>)
          .cast<Map<String, dynamic>>(),
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetBusLinesModelResponse.fromJson(String source) =>
      GetBusLinesModelResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GetBusLinesModelResponse(id: $id, name: $name, price: $price, city_name: $city_name, bus_line: $bus_line, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(covariant GetBusLinesModelResponse other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.price == price &&
        other.city_name == city_name &&
        listEquals(other.bus_line, bus_line) &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        price.hashCode ^
        city_name.hashCode ^
        bus_line.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
