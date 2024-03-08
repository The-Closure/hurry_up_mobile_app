// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:hurry_app/token_model/token_model.dart';

class GetVertesesModel extends ResultModel {
  int id;
  GetVertesesModel({
    required this.id,
  });

  GetVertesesModel copyWith({
    int? id,
  }) {
    return GetVertesesModel(
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
    };
  }

  factory GetVertesesModel.fromMap(Map<String, dynamic> map) {
    return GetVertesesModel(
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetVertesesModel.fromJson(String source) =>
      GetVertesesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GetVertesesModel(id: $id)';

  @override
  bool operator ==(covariant GetVertesesModel other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

class GetVertesesModelResponse extends ResultModel {
  int id;
  int bus_line_id;
  String name;
  String latitude;
  String longitude;
  bool is_busy;
  dynamic busy_at;
  int feedback_count;
  String created_at;
  String updated_at;
  GetVertesesModelResponse({
    required this.id,
    required this.bus_line_id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.is_busy,
    required this.busy_at,
    required this.feedback_count,
    required this.created_at,
    required this.updated_at,
  });

  GetVertesesModelResponse copyWith({
    int? id,
    int? bus_line_id,
    String? name,
    String? latitude,
    String? longitude,
    bool? is_busy,
    dynamic? busy_at,
    int? feedback_count,
    String? created_at,
    String? updated_at,
  }) {
    return GetVertesesModelResponse(
      id: id ?? this.id,
      bus_line_id: bus_line_id ?? this.bus_line_id,
      name: name ?? this.name,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      is_busy: is_busy ?? this.is_busy,
      busy_at: busy_at ?? this.busy_at,
      feedback_count: feedback_count ?? this.feedback_count,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'bus_line_id': bus_line_id,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'is_busy': is_busy,
      'busy_at': busy_at,
      'feedback_count': feedback_count,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory GetVertesesModelResponse.fromMap(Map<String, dynamic> map) {
    return GetVertesesModelResponse(
      id: map['id'] as int,
      bus_line_id: map['bus_line_id'] as int,
      name: map['name'] as String,
      latitude: map['latitude'] as String,
      longitude: map['longitude'] as String,
      is_busy: map['is_busy'] as bool,
      busy_at: map['busy_at'] as dynamic,
      feedback_count: map['feedback_count'] as int,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetVertesesModelResponse.fromJson(String source) =>
      GetVertesesModelResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GetVertesesModelResponse(id: $id, bus_line_id: $bus_line_id, name: $name, latitude: $latitude, longitude: $longitude, is_busy: $is_busy, busy_at: $busy_at, feedback_count: $feedback_count, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(covariant GetVertesesModelResponse other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.bus_line_id == bus_line_id &&
        other.name == name &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.is_busy == is_busy &&
        other.busy_at == busy_at &&
        other.feedback_count == feedback_count &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        bus_line_id.hashCode ^
        name.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        is_busy.hashCode ^
        busy_at.hashCode ^
        feedback_count.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
