// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:flutter/foundation.dart';

class PostOrderModel {
  int top_passenger_count;
  int current_passenger_count;
  int destination_vertices_id;
  bool is_hurry;
  String genders;
  PostOrderModel({
    required this.top_passenger_count,
    required this.current_passenger_count,
    required this.destination_vertices_id,
    required this.is_hurry,
    required this.genders,
  });

  PostOrderModel copyWith({
    int? top_passenger_count,
    int? current_passenger_count,
    int? destination_vertices_id,
    bool? is_hurry,
    String? genders,
  }) {
    return PostOrderModel(
      top_passenger_count: top_passenger_count ?? this.top_passenger_count,
      current_passenger_count:
          current_passenger_count ?? this.current_passenger_count,
      destination_vertices_id:
          destination_vertices_id ?? this.destination_vertices_id,
      is_hurry: is_hurry ?? this.is_hurry,
      genders: genders ?? this.genders,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'top_passenger_count': top_passenger_count,
      'current_passenger_count': current_passenger_count,
      'destination_vertices_id': destination_vertices_id,
      'is_hurry': is_hurry,
      'genders': genders,
    };
  }

  factory PostOrderModel.fromMap(Map<String, dynamic> map) {
    return PostOrderModel(
      top_passenger_count: map['top_passenger_count'] as int,
      current_passenger_count: map['current_passenger_count'] as int,
      destination_vertices_id: map['destination_vertices_id'] as int,
      is_hurry: map['is_hurry'] as bool,
      genders: map['genders'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostOrderModel.fromJson(String source) =>
      PostOrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostOrderModel(top_passenger_count: $top_passenger_count, current_passenger_count: $current_passenger_count, destination_vertices_id: $destination_vertices_id, is_hurry: $is_hurry, genders: $genders)';
  }

  @override
  bool operator ==(covariant PostOrderModel other) {
    if (identical(this, other)) return true;

    return other.top_passenger_count == top_passenger_count &&
        other.current_passenger_count == current_passenger_count &&
        other.destination_vertices_id == destination_vertices_id &&
        other.is_hurry == is_hurry &&
        other.genders == genders;
  }

  @override
  int get hashCode {
    return top_passenger_count.hashCode ^
        current_passenger_count.hashCode ^
        destination_vertices_id.hashCode ^
        is_hurry.hashCode ^
        genders.hashCode;
  }
}

class PostOrderModelResponse {
  int top_passenger_count;
  int current_passenger_count;
  int destination_vertices_id;
  bool is_hurry;
  String genders;
  List<String> user_ids;
  String updated_at;
  String created_at;
  int id;
  PostOrderModelResponse({
    required this.top_passenger_count,
    required this.current_passenger_count,
    required this.destination_vertices_id,
    required this.is_hurry,
    required this.genders,
    required this.user_ids,
    required this.updated_at,
    required this.created_at,
    required this.id,
  });

  PostOrderModelResponse copyWith({
    int? top_passenger_count,
    int? current_passenger_count,
    int? destination_vertices_id,
    bool? is_hurry,
    String? genders,
    List<String>? user_ids,
    String? updated_at,
    String? created_at,
    int? id,
  }) {
    return PostOrderModelResponse(
      top_passenger_count: top_passenger_count ?? this.top_passenger_count,
      current_passenger_count:
          current_passenger_count ?? this.current_passenger_count,
      destination_vertices_id:
          destination_vertices_id ?? this.destination_vertices_id,
      is_hurry: is_hurry ?? this.is_hurry,
      genders: genders ?? this.genders,
      user_ids: user_ids ?? this.user_ids,
      updated_at: updated_at ?? this.updated_at,
      created_at: created_at ?? this.created_at,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'top_passenger_count': top_passenger_count,
      'current_passenger_count': current_passenger_count,
      'destination_vertices_id': destination_vertices_id,
      'is_hurry': is_hurry,
      'genders': genders,
      'user_ids': user_ids,
      'updated_at': updated_at,
      'created_at': created_at,
      'id': id,
    };
  }

  factory PostOrderModelResponse.fromMap(Map<String, dynamic> map) {
    return PostOrderModelResponse(
      top_passenger_count: map['top_passenger_count'] as int,
      current_passenger_count: map['current_passenger_count'] as int,
      destination_vertices_id: map['destination_vertices_id'] as int,
      is_hurry: map['is_hurry'] as bool,
      genders: map['genders'] as String,
      user_ids: List<String>.from((map['user_ids'] as List<String>)),
      updated_at: map['updated_at'] as String,
      created_at: map['created_at'] as String,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostOrderModelResponse.fromJson(String source) =>
      PostOrderModelResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostOrderModelResponse(top_passenger_count: $top_passenger_count, current_passenger_count: $current_passenger_count, destination_vertices_id: $destination_vertices_id, is_hurry: $is_hurry, genders: $genders, user_ids: $user_ids, updated_at: $updated_at, created_at: $created_at, id: $id)';
  }

  @override
  bool operator ==(covariant PostOrderModelResponse other) {
    if (identical(this, other)) return true;

    return other.top_passenger_count == top_passenger_count &&
        other.current_passenger_count == current_passenger_count &&
        other.destination_vertices_id == destination_vertices_id &&
        other.is_hurry == is_hurry &&
        other.genders == genders &&
        listEquals(other.user_ids, user_ids) &&
        other.updated_at == updated_at &&
        other.created_at == created_at &&
        other.id == id;
  }

  @override
  int get hashCode {
    return top_passenger_count.hashCode ^
        current_passenger_count.hashCode ^
        destination_vertices_id.hashCode ^
        is_hurry.hashCode ^
        genders.hashCode ^
        user_ids.hashCode ^
        updated_at.hashCode ^
        created_at.hashCode ^
        id.hashCode;
  }
}
